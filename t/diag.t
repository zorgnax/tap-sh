#!/bin/bash
. t/test.sh
tap_is $'diag foo
diag $\'foo\\nbar\'
diag ""
diag <<EOF
hello
world!
EOF' '# foo
# foo
# bar
# 
# hello
# world!'
done_testing
