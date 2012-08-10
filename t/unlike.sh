#!/bin/bash
. tap.sh

tap_is 'unlike "foo" ""' "not ok 1
#  Failed test
#                    'foo'
#           matches: ''"

tap_is 'unlike "foo" "o"' "not ok 1
#  Failed test
#                    'foo'
#           matches: 'o'"

tap_is 'unlike "foo" "b"' 'ok 1'

tap_is 'unlike "stranger" "^s.(r).*\1$"' "not ok 1
#  Failed test
#                    'stranger'
#           matches: '^s.(r).*\1$'"

tap_is 'unlike "strangerl" "^s.(r).*\1$"' 'ok 1'

tap_is 'unlike "strangerlurr" "^s.(r).*\1$"' "not ok 1
#  Failed test
#                    'strangerlurr'
#           matches: '^s.(r).*\1$'"

tap_is 'unlike "crone" "cr([e-o]*)"; echo ${BASH_REMATCH[*]}' "not ok 1
#  Failed test
#                    'crone'
#           matches: 'cr([e-o]*)'
crone one"

done_testing

