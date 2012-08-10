#!/bin/bash
. tap.sh

tap_is 'is "hello" "hello"' 'ok 1'

tap_is 'is "hello" "hello" "foo"' 'ok 1 - foo'

tap_is 'is "hello" "world!"' "not ok 1
#  Failed test
#          got: 'hello'
#     expected: 'world!'"

tap_is 'is "hello" "world!" "foo"' "not ok 1 - foo
#  Failed test 'foo'
#          got: 'hello'
#     expected: 'world!'"

tap_is $'is $\'hello\\nworld!\' $\'hello\\nworld!\'' 'ok 1'

tap_is $'is $\'hello\\nworld!\' $\'herp\\nderp\'' "not ok 1
#  Failed test
# @@ -1,2 +1,2 @@
# -herp
# -derp
# +hello
# +world!"

tap_is $'is $\'hello\\nworld!\' <<EOEXPECTED
hello
world!
EOEXPECTED' "not ok 1
#  Failed test
# @@ -1 +1,2 @@
# -
# +hello
# +world!"

done_testing

