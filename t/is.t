#!/bin/bash
. t/test.sh
tap_is $'is "hello" "hello"
is "hello" "hello" "foo"
is "hello" "world!"
is "hello" "world!" "foo"
is $\'hello\\nworld!\' $\'hello\\nworld!\'
is $\'hello\\nworld!\' <<EOEXPECTED
hello
world!
EOEXPECTED
is $\'hello\\nworld!\' <<EOEXPECTED
hello
world!
and some more stuff
that i am expecting
to be there always
never
EOEXPECTED' $'ok 1
ok 2 - foo
not ok 3
#  Failed test at line 3
#          got: \'hello\'
#     expected: \'world!\'
not ok 4 - foo
#  Failed test \'foo\'
#  at line 4
#          got: \'hello\'
#     expected: \'world!\'
ok 5
not ok 6
#  Failed test at line 6
# @@ -1 +1,2 @@
# -
# +hello
# +world!
not ok 7
#  Failed test at line 10
# @@ -1 +1,2 @@
# -
# +hello
# +world!'
done_testing

