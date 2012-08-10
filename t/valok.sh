#!/bin/bash
. tap.sh

tap_is 'val_ok 0' 'ok 1'

tap_is 'val_ok 0 "foo"' 'ok 1 - foo'

tap_is 'val_ok "hello world"' 'not ok 1
#  Failed test'

tap_is 'val_ok 1' 'not ok 1
#  Failed test'

tap_is 'val_ok 1 "foo"' "not ok 1 - foo
#  Failed test 'foo'"

tap_is 'val_ok 1000000000000' 'not ok 1
#  Failed test'

done_testing

