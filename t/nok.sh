#!/bin/bash
. tap.sh

tap_is 'nok true' 'not ok 1
#  Failed test at line 1'

tap_is 'nok true foo' "not ok 1 - foo
#  Failed test 'foo'
#  at line 1"

tap_is 'nok' $'not ok 1\n#  Failed test at line 1'

tap_is 'nok false' 'ok 1'

tap_is 'nok false foo' 'ok 1 - foo'

tap_is $'nok \'
for f in hello world!; do
    echo [$f]
done\'
echo "$GOT"' 'not ok 1
#  Failed test at line 4
[hello]
[world!]'

done_testing

