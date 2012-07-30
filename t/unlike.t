#!/bin/bash
. t/test.sh
tap_is $'unlike "foo" ""
unlike "foo" "o"
unlike "foo" "b"
unlike "stranger" "^s.(r).*\\\\1$"
unlike "strangerl" "^s.(r).*\\\\1$"
unlike "strangerlurr" "^s.(r).*\\\\1$"
unlike "crone" "cr([e-o]*)"
echo ${BASH_REMATCH[*]}
unlike "foo" "" "baz"
unlike "foo" "o" "baz"
unlike "foo" "b" "baz"
unlike "stranger" "^s.(r).*\\\\1$" "baz"
unlike "strangerl" "^s.(r).*\\\\1$" "baz"
unlike "strangerlurr" "^s.(r).*\\\\1$" "baz"
unlike "crone" "cr([e-o]*)" "baz"
echo ${BASH_REMATCH[*]}' $'not ok 1
#  Failed test at line 1
#                    \'foo\'
#           matches: \'\'
not ok 2
#  Failed test at line 2
#                    \'foo\'
#           matches: \'o\'
ok 3
not ok 4
#  Failed test at line 4
#                    \'stranger\'
#           matches: \'^s.(r).*\\1$\'
ok 5
not ok 6
#  Failed test at line 6
#                    \'strangerlurr\'
#           matches: \'^s.(r).*\\1$\'
not ok 7
#  Failed test at line 7
#                    \'crone\'
#           matches: \'cr([e-o]*)\'
crone one
not ok 8 - baz
#  Failed test \'baz\'
#  at line 9
#                    \'foo\'
#           matches: \'\'
not ok 9 - baz
#  Failed test \'baz\'
#  at line 10
#                    \'foo\'
#           matches: \'o\'
ok 10 - baz
not ok 11 - baz
#  Failed test \'baz\'
#  at line 12
#                    \'stranger\'
#           matches: \'^s.(r).*\\1$\'
ok 12 - baz
not ok 13 - baz
#  Failed test \'baz\'
#  at line 14
#                    \'strangerlurr\'
#           matches: \'^s.(r).*\\1$\'
not ok 14 - baz
#  Failed test \'baz\'
#  at line 15
#                    \'crone\'
#           matches: \'cr([e-o]*)\'
crone one'
done_testing
