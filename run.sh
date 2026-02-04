#!/usr/bin/env bash

set -e

YEAR="$1"
TARGET="$2"
TIME_LIMIT=2

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
CYAN="\033[0;36m"
GRAY="\033[0;90m"
NC="\033[0m"

print_header () {
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${CYAN} Running $YEAR / Problem $1${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "Using time limit: ${TIME_LIMIT}s"
}

render_line () {
    local FILE="$1"

    if [[ ! -f "$FILE" ]]; then
        echo "<missing>"
        return
    fi

    local LINE
    LINE="$(sed -n '1p' "$FILE")"

    if [[ -n "$(tail -c 1 "$FILE")" ]]; then
        echo "${LINE}<no newline>"
    else
        echo "${LINE}\\n"
    fi
}

run_problem () {
    local PROB="$1"
    local BASE="$YEAR/$PROB"

    local IN_DIR="$BASE/input"
    local OUT_DIR="$BASE/output"
    local SOL="$BASE/solution.py"

    if [[ ! -f "$SOL" ]]; then
        echo -e "${YELLOW}⚠ No solution.py for problem $PROB${NC}"
        return
    fi

    print_header "$PROB"

    local AC=0
    local WA=0
    local TLE=0

    local TMP_DIR="$BASE/test_output"
    mkdir -p "$TMP_DIR"

    for IN in "$IN_DIR"/*; do
        local TEST
        TEST="$(basename "$IN")"

        local EXP="$OUT_DIR/$TEST"
        local MYOUT="$TMP_DIR/$TEST"

        if ! timeout "$TIME_LIMIT" python3 "$SOL" < "$IN" > "$MYOUT" 2>/dev/null; then
            echo -e "${YELLOW}⧗ TLE${NC} $TEST"
            ((TLE++))
            continue
        fi

        if diff -q "$EXP" "$MYOUT" >/dev/null; then
            echo -e "${GREEN}✔ AC${NC} $TEST"
            ((AC++))
        else
            echo -e "${RED}✘ WA${NC} $TEST"

            IN_LINE="$(render_line "$IN")"
            EXP_LINE="$(render_line "$EXP")"
            OUT_LINE="$(render_line "$MYOUT")"

            echo "  input=$IN_LINE | expected=$EXP_LINE | output=$OUT_LINE"
            echo

            ((WA++))
        fi
    done

    echo "Summary: AC=$AC WA=$WA TLE=$TLE"
}

if [[ "$TARGET" == "all" ]]; then
    for P in "$YEAR"/*; do
        [[ -d "$P" ]] && run_problem "$(basename "$P")"
    done
else
    run_problem "$TARGET"
fi
