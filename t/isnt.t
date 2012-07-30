#!/bin/bash
. t/test.sh
tap_is $'isnt "hello" "hello"
isnt "hello" "hello" "foo"
isnt "hello" "world!"
isnt "hello" "world!" "foo"
isnt $\'hello\\nworld!\' $\'hello\\nworld!\'
isnt $\'hello\\nworld!\' <<EOEXPECTED
hello
world!
EOEXPECTED
isnt $\'hello\\nworld!\' <<EOEXPECTED
hello
world!
and some more stuff
that i am expecting
to be there always
never
EOEXPECTED' $'not ok 1
#  Failed test at line 1
#          got: \'hello\'
#     expected: anything else
not ok 2 - foo
#  Failed test \'foo\'
#  at line 2
#          got: \'hello\'
#     expected: anything else
ok 3
ok 4 - foo
not ok 5
#  Failed test at line 5
# didn\'t expect:
# hello
# world!
ok 6
ok 7'
done_testing

