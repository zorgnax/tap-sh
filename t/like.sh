#!/bin/bash
. tap.sh

tap_is 'like "foo" ""' 'ok 1'

tap_is 'like "foo" "o"' 'ok 1'

tap_is 'like "foo" "b"' "not ok 1
#  Failed test
#                    'foo'
#     doesn't match: 'b'"

tap_is 'like "stranger" "^s.(r).*\1$"' 'ok 1'

tap_is 'like "strangerl" "^s.(r).*\1$"' "not ok 1
#  Failed test
#                    'strangerl'
#     doesn't match: '^s.(r).*\1$'"

tap_is 'like "strangerlurr" "^s.(r).*\1$"' 'ok 1'

tap_is 'like "crone" "cr([e-o]*)"; echo ${BASH_REMATCH[*]}' $'ok 1\ncrone one'

done_testing

