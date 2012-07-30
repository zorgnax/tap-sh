#!/bin/bash
. t/test.sh
tap_is $'todo
ok true foo
ok false bar
odot
todo "later not now never always"
ok true foo
ok false bar
odot' $'ok 1 - foo # TODO
not ok 2 - bar # TODO
#  Failed (TODO) test \'bar\'
#  at line 3
ok 3 - foo # TODO later not now never always
not ok 4 - bar # TODO later not now never always
#  Failed (TODO) test \'bar\'
#  at line 7'
done_testing

