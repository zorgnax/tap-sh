NO_PLAN=-1
SKIP_ALL=-2
EXPECTED_TESTS=NO_PLAN
FAILED_TESTS=0
CURRENT_TEST=0
GOT=

val_ok () {
    local value=$1 desc=$2 file line
    ((CURRENT_TEST++))
    if [ "$value" -ne 0 ]; then
        echo -n "not "
    fi
    echo -n "ok $CURRENT_TEST"
    if [ -n "$desc" ]; then
        echo -n " - $desc"
    fi
    echo ""
    if [ "$value" -ne 0 ]; then
        if [ "${FUNCNAME[@]: -1}" = "main" ]; then
            file=${BASH_SOURCE[-1]}
            line=${BASH_LINENO[-2]}
        else
            line=${BASH_LINENO[-1]}
        fi
        echo -n "#  Failed test " >&2
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
    local cmd
    if [ -t 0 ]; then
        cmd=$@
    else
        cmd=$(cat)
    fi
    GOT=$(eval "$cmd" 2>&1)
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

