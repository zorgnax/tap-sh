#!/bin/bash
. t/test.sh
tap_is $'like "foo" ""
like "foo" "o"
like "foo" "b"
like "stranger" "^s.(r).*\\\\1$"
like "strangerl" "^s.(r).*\\\\1$"
like "strangerlurr" "^s.(r).*\\\\1$"
like "crone" "cr([e-o]*)"
echo ${BASH_REMATCH[*]}
like "foo" "" "baz"
like "foo" "o" "baz"
like "foo" "b" "baz"
like "stranger" "^s.(r).*\\\\1$" "baz"
like "strangerl" "^s.(r).*\\\\1$" "baz"
like "strangerlurr" "^s.(r).*\\\\1$" "baz"
like "crone" "cr([e-o]*)" "baz"
echo ${BASH_REMATCH[*]}' \
$'ok 1
ok 2
not ok 3
#  Failed test at line 3
#                    \'foo\'
#     doesn\'t match: \'b\'
ok 4
not ok 5
#  Failed test at line 5
#                    \'strangerl\'
#     doesn\'t match: \'^s.(r).*\\1$\'
ok 6
ok 7
crone one
ok 8 - baz
ok 9 - baz
not ok 10 - baz
#  Failed test \'baz\'
#  at line 11
#                    \'foo\'
#     doesn\'t match: \'b\'
ok 11 - baz
not ok 12 - baz
#  Failed test \'baz\'
#  at line 13
#                    \'strangerl\'
#     doesn\'t match: \'^s.(r).*\\1$\'
ok 13 - baz
ok 14 - baz
crone one'
done_testing
