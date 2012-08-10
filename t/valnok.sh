#!/bin/bash
. tap.sh

tap_is 'val_nok 0' 'not ok 1
#  Failed test'

tap_is 'val_nok 0 "foo"' "not ok 1 - foo
#  Failed test 'foo'"

tap_is 'val_nok 1' 'ok 1'

tap_is 'val_nok 1 "foo"' 'ok 1 - foo'

tap_is 'val_nok 1000000000000' 'ok 1'

tap_is 'val_nok "this is a string with spaces"' 'ok 1'

done_testing
