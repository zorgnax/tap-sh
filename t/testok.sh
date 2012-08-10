#!/bin/bash
. tap.sh

tap_is 'test_ok -n "foo"' 'ok 1'

tap_is 'test_ok -n ""' 'not ok 1
#  Failed test
#     -n '

tap_is 'test_ok -z "foo"' 'not ok 1
#  Failed test
#     -z foo'

tap_is 'test_ok -z ""' 'ok 1'

tap_is 'test_ok "hello" = "world"' 'not ok 1
#  Failed test
#     hello
#         =
#     world'

tap_is 'test_ok "hello" = "hello"' 'ok 1'

tap_is 'test_ok "hello" != "world"' 'ok 1'

tap_is 'test_ok "hello" != "hello"' 'not ok 1
#  Failed test
#     hello
#         !=
#     hello'

tap_is 'test_ok 1 -eq 1' 'ok 1'

tap_is 'test_ok 1 -eq 2' 'not ok 1
#  Failed test
#     1
#         -eq
#     2'

tap_is 'test_ok 2 -ge 1' 'ok 1'

tap_is 'test_ok 1 -ge 2' 'not ok 1
#  Failed test
#     1
#         -ge
#     2'

tap_is 'test_ok 2 -gt 1' 'ok 1'

tap_is 'test_ok 1 -gt 2' 'not ok 1
#  Failed test
#     1
#         -gt
#     2'

tap_is 'test_ok foo -ef bar' 'not ok 1
#  Failed test
#     foo
#         -ef
#     bar'

tap_is 'test_ok -r foo' 'not ok 1
#  Failed test
#     -r foo'

done_testing
