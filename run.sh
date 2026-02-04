#!/usr/bin/env bash

YEAR="$1"
TARGET="$2"
TIME_LIMIT=2

RED="\033[0;31m"; GREEN="\033[0;32m"; CYAN="\033[0;36m"; GRAY="\033[0;90m"; NC="\033[0m"

has_newline () {
    tail -c 1 "$1" | wc -l | tr -d ' '
}

run_problem() {
    local BASE="$YEAR/$1"
    [[ -d "$BASE/input" && -d "$BASE/output" ]] || return

    local EXEC=""
    local BIN="$BASE/solution_bin"

    if [ -f "$BASE/solution.cpp" ]; then
        # Remove o binário anterior para evitar falsos positivos
        rm -f "$BIN"
        
        # Compila usando g++-15 (suporta bits/stdc++.h no Mac)
        if g++-15 -std=gnu++17 -O2 -Wall -Wextra "$BASE/solution.cpp" -o "$BIN" 2>/tmp/icpc_compile_err; then
            EXEC="$BIN"
        else
            echo -e "${RED}Compilation Error${NC} in $BASE/solution.cpp"
            cat /tmp/icpc_compile_err
            return
        fi
    elif [ -f "$BASE/solution.py" ]; then
        EXEC="python3 $BASE/solution.py"
    fi

    [ -n "$EXEC" ] || return

    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${CYAN} Running $YEAR / $1${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

    AC=0; WA=0; mkdir -p "$BASE/test_output"

    for IN in "$BASE/input"/*; do
        [ -f "$IN" ] || continue
        T=$(basename "$IN")
        EXP="$BASE/output/$T"
        OUT="$BASE/test_output/$T"
        [ -f "$EXP" ] || continue

        if ! timeout "$TIME_LIMIT" $EXEC < "$IN" > "$OUT" 2>/dev/null; then
            echo -e "TLE $T"; continue
        fi

        if diff -q "$EXP" "$OUT" >/dev/null; then
            echo -e "${GREEN}✔ AC${NC} $T"; ((AC++))
        else
            echo -e "${RED}✘ WA${NC} $T"
            iv=$(head -n 1 "$IN" | tr -d '\n\r'); [ "$(has_newline "$IN")" -eq 1 ] && iv+="↵" || iv+="∅"
            ev=$(head -n 1 "$EXP" | tr -d '\n\r'); [ "$(has_newline "$EXP")" -eq 1 ] && ev+="↵" || ev+="∅"
            ov=$(head -n 1 "$OUT" | tr -d '\n\r'); [ "$(has_newline "$OUT")" -eq 1 ] && ov+="↵" || ov+="∅"
            echo -e "  ${GRAY}in:${NC}$iv | ${GRAY}exp:${NC}$ev | ${GRAY}out:${NC}$ov\n"
            ((WA++))
        fi
    done
    echo "Summary: AC=$AC WA=$WA"
}

if [ "$TARGET" = "all" ]; then
    for d in "$YEAR"/*; do [ -d "$d" ] && run_problem "$(basename "$d")"; done
else
    run_problem "$TARGET"
fi