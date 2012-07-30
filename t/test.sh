. tap.sh

tap_is () {
    local cmd=$1 expected=$2 desc
    if [[ "$cmd" =~ $'\n' ]]; then
        desc=$(head -1 <<< "$cmd")...
    else
        desc=$cmd
    fi
    cmd=". tap.sh;$cmd"
    sub_run_is "$cmd" "$expected" "$desc"
}

