#!/bin/bash
. tap.sh

tap_is 'ok true' 'ok 1'

tap_is 'ok true foo' 'ok 1 - foo'

tap_is $'ok - <<EOCMD\ntrue\nEOCMD' 'ok 1'

tap_is $'ok - foo <<EOCMD\ntrue\nEOCMD' 'ok 1 - foo'

tap_is 'ok false' "not ok 1
#  Failed test"

tap_is 'ok false foo' "not ok 1 - foo
#  Failed test 'foo'"

tap_is $'ok - <<EOCMD\nfalse\nEOCMD' "not ok 1
#  Failed test"

tap_is $'ok - foo <<EOCMD\nfalse\nEOCMD' "not ok 1 - foo
#  Failed test 'foo'"

done_testing

