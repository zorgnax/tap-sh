#!/bin/bash
. t/test.sh
tap_is $'note foo
note $\'foo\\nbar\'
note ""
note <<EOF
hello
world!
EOF' $'# foo
# foo
# bar
# 
# hello
# world!'
done_testing

