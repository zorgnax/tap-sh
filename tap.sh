# tap.sh - Write tests in Bash
# Copyright 2012 Jake Gelbman <gelbman@gmail.com>
# Subject to the GPL, version 2.

NO_PLAN=-1
EXPECTED_TESTS=$NO_PLAN
FAILED_TESTS=0
CURRENT_TEST=0
GOT=

plan () {
    EXPECTED_TESTS=$1
    echo "1..$EXPECTED_TESTS"
}

done_testing () {
    local value=0
    if [ "$EXPECTED_TESTS" -eq "$NO_PLAN" ]; then
        echo "1..$CURRENT_TEST"
    elif [ "$CURRENT_TEST" -ne "$EXPECTED_TESTS" ]; then
        echo -n "# Looks like you planned $EXPECTED_TESTS test" >&2
        if [ "$EXPECTED_TESTS" -ne 1 ]; then
            echo -n "s" >&2
        fi
        echo " but ran $CURRENT_TEST." >&2
        value=255
    fi
    if [ "$FAILED_TESTS" -gt 0 ]; then
        echo -n "# Looks like you failed $FAILED_TESTS test" >&2
        if [ "$FAILED_TESTS" -ne 1 ]; then
            echo -n "s" >&2
        fi
        echo " of $CURRENT_TEST run." >&2
        if [ "$EXPECTED_TESTS" -eq "$NO_PLAN" ]; then
            value=$FAILED_TESTS
        else
            value=$((EXPECTED_TESTS - CURRENT_TEST + FAILED_TESTS))
        fi
    fi
    if [ "${FUNCNAME[@]: -1}" = "main" ]; then
        exit $value
    fi
    return $value
}

val_ok () {
    local value=$1 desc=$2 file line
    ((CURRENT_TEST++))
    if ! [[ "$value" =~ ^[0-9]+$ ]]; then
        value=1
    fi
    if [ "$value" -ne 0 ]; then
        echo -n "not "
    fi
    echo -n "ok $CURRENT_TEST"
    if [ -n "$desc" ]; then
        echo -n " - $desc"
    fi
    if [ -n "${TODO+set}" ]; then
        echo -n " # TODO"
    fi
    if [ -n "$TODO" ]; then
        echo -n " $TODO"
    fi
    echo ""
    if [ "$value" -ne 0 ]; then
        if [ "${FUNCNAME[@]: -1}" = "main" ]; then
            file=${BASH_SOURCE[-1]}
            line=${BASH_LINENO[-2]}
        else
            line=${BASH_LINENO[-1]}
        fi
        echo -n "#  Failed " >&2
        if [ -n "${TODO+set}" ]; then
            echo -n "(TODO) " >&2
        fi
        echo -n "test " >&2
        if [ -n "$desc" ]; then
            echo "'$desc'" >&2
            echo -n "#  " >&2
        fi
        echo -n "at "
        if [ -n "$file" ]; then
            echo -n "$file "
        fi
        echo "line $line"
        ((FAILED_TESTS++))
    fi
    return $value
}

val_nok () {
    local value=$1 desc=$2
    if ! [[ "$value" =~ ^[0-9]+$ ]]; then
        value=1
    fi
    if [ "$value" -eq 0 ]; then
        fail "$desc"
    else
        pass "$desc"
    fi
}

pass () {
    local desc=$1
    val_ok 0 "$desc"
}

fail () {
    local desc=$1
    val_ok 1 "$desc"
}

note () {
    if [ $# -gt 0 ]; then
        echo "$@" | note
        return
    fi
    sed 's/.*/# &/'
}

diag () {
    note "$@" >&2
}

run () {
    local cmd var
    if [ -t 0 ]; then
        cmd=$1 var=$2
    else
        cmd=$(cat) var=$1
    fi
    var=${var:-GOT}
    eval "$var=\$(eval \"\$cmd\" 2>&1)"
}

ok () {
    local cmd desc
    if [ -t 0 ]; then
        cmd=$1 desc=$2
    else
        cmd=$(cat) desc=$1
    fi
    GOT=$(eval "$cmd" 2>&1)
    val_ok $? "$desc"
}

nok () {
    local cmd desc
    if [ -t 0 ]; then
        cmd=$1 desc=$2
    else
        cmd=$(cat) desc=$1
    fi
    GOT=$(eval "$cmd" 2>&1)
    val_nok $? "$desc"
}

is () {
    local got expected desc diff value
    if [ -t 0 ]; then
        got=$1 expected=$2 desc=$3
    else
        got=$1 expected=$(cat) desc=$2
    fi
    diff=$(diff -U5 -p <(cat <<< "$expected") <(cat <<< "$got"))
    value=$?
    val_ok $value "$desc"
    if [ $value -ne 0 ]; then
        if [[ "$got$expected" =~ $'\n' ]]; then
            diff=$(sed -n '/@@/,$p' <<< "$diff")
            diag "$diff"
        else
            diag "         got: '$got'"
            diag "    expected: '$expected'"
        fi
    fi
    return $value
}

isnt () {
    local got unexpected desc value
    if [ -t 0 ]; then
        got=$1 unexpected=$2 desc=$3
    else
        got=$1 unexpected=$(cat) desc=$2
    fi
    [ "$got" != "$unexpected" ]
    value=$?
    val_ok $value "$desc"
    if [ $value -ne 0 ]; then
        if [[ "$got" =~ $'\n' ]]; then
            diag "didn't expect:"
            diag "$got"
        else
            diag "         got: '$got'"
            diag "    expected: anything else"
        fi
    fi
    return $value
}

skip () {
    local cmd=$1 n=$2 desc=$3 value
    GOT=$(eval "$cmd" 2>&1)
    value=$?
    if [ $value -eq 0 ]; then
        if [ -n "$desc" ]; then
            desc=" $desc"
        fi
        for i in $(seq $n); do
            pass "# skip$desc"
        done
    fi
    return $value
}

skip_all () {
    local desc=$1
    if [ -n "$desc" ]; then
        desc=" $desc"
    fi
    echo "1..0 # SKIP$desc"
    if [ "${FUNCNAME[@]: -1}" = "main" ]; then
        exit 0
    fi
}

todo () {
    TODO=$1
}

odot () {
    unset TODO
}

