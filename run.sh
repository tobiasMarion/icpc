#!/usr/bin/env bash

YEAR="$1"
TARGET="$2"
TIME_LIMIT=2

RED="\033[0;31m"; GREEN="\033[0;32m"; YELLOW="\033[1;33m"; CYAN="\033[0;36m"; GRAY="\033[0;90m"; NC="\033[0m"

has_newline () {
    tail -c 1 "$1" | wc -l | tr -d ' '
}

run_problem() {
    local BASE="$YEAR/$1"
    
    if [ "$INTERACTIVE_MODE" != "1" ]; then
        [[ -d "$BASE/input" && -d "$BASE/output" ]] || return
    fi

    local EXEC=""
    local BIN="$BASE/solution_bin"

    rm -f "$BIN"

    if [ -f "$BASE/solution.cpp" ]; then
        if command -v g++-15 &> /dev/null; then
            COMPILER="g++-15"
        else
            COMPILER="g++"
        fi
        
        if $COMPILER -std=gnu++17 -O2 -Wall -Wextra "$BASE/solution.cpp" -o "$BIN" 2>/tmp/icpc_compile_err; then
            EXEC="./$BIN"
        else
            echo -e "${RED}Compilation Error${NC} in $BASE/solution.cpp"
            cat /tmp/icpc_compile_err
            return
        fi
    elif [ -f "$BASE/solution.py" ]; then
        EXEC="python3 $BASE/solution.py"
    else
        echo -e "${YELLOW}No solution file found${NC} in $BASE"
        return
    fi

    [ -n "$EXEC" ] || return

    if [ "$INTERACTIVE_MODE" = "1" ]; then
        echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "${CYAN} Debugging $YEAR / $1 (Manual Input)${NC}"
        echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        $EXEC
        rm -f "$BIN"
        return
    fi

    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${CYAN} Running $YEAR / $1${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

    AC=0; WA=0; TLE=0; mkdir -p "$BASE/test_output"

    for IN in "$BASE/input"/*; do
        [ -f "$IN" ] || continue
        T=$(basename "$IN")
        EXP="$BASE/output/$T"
        OUT="$BASE/test_output/$T"
        [ -f "$EXP" ] || continue

        if ! timeout "$TIME_LIMIT" bash -c "$EXEC < '$IN' > '$OUT'" 2>/dev/null; then
            echo -e "${YELLOW}⧗ TLE${NC} $T"; ((TLE++)); continue
        fi

        if diff -q "$EXP" "$OUT" >/dev/null 2>&1; then
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
    echo -e "Summary: AC=$AC WA=$WA TLE=$TLE\n"
    
    rm -f "$BIN"
}

if [ "$TARGET" = "all" ]; then
    for d in "$YEAR"/*; do 
        if [ -d "$d" ]; then 
            run_problem "$(basename "$d")"
        fi
    done
else
    run_problem "$TARGET"
fi
