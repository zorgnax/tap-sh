#!/bin/bash
. tap.sh

tap_is 'todo
ok true foo
ok false bar
odot' "ok 1 - foo # TODO
not ok 2 - bar # TODO
#  Failed (TODO) test 'bar'
#  at line 3"

tap_is 'todo "later not now never always"
ok true foo
ok false bar
odot' "ok 1 - foo # TODO later not now never always
not ok 2 - bar # TODO later not now never always
#  Failed (TODO) test 'bar'
#  at line 3"

done_testing

