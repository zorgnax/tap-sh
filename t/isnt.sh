#!/bin/bash
. tap.sh

tap_is 'isnt "hello" "hello"' "not ok 1
#  Failed test
#          got: 'hello'
#     expected: anything else"

tap_is 'isnt "hello" "hello" "foo"' "not ok 1 - foo
#  Failed test 'foo'
#          got: 'hello'
#     expected: anything else"

tap_is 'isnt "hello" "world!"' "ok 1"

tap_is 'isnt "hello" "world!" "foo"' 'ok 1 - foo'

tap_is $'isnt $\'hello\\nworld!\' $\'hello\\nworld!\'' "not ok 1
#  Failed test
# didn't expect:
# hello
# world!"

tap_is $'isnt $\'hello\\nworld!\' <<EOEXPECTED
hello
world!
EOEXPECTED' 'ok 1' "isnt doesn't read STDIN"

done_testing

