#!/bin/bash
. t/test.sh
tap_is $'val_nok 0
val_nok 0 "foo"
val_nok <<EOVALUE 0
hello world
EOVALUE
val_nok 1
val_nok 1 "foo"
val_nok 2
val_nok 255
val_nok 256
val_nok 257
val_nok 1000000
val_nok 1000000000000
val_nok
val_nok ""
val_nok "" "foo"
val_nok "this is a string with spaces"
val_nok <<EOVALUE
hello world
foo bar baz
EOVALUE
val_nok <<EOVALUE "foo"
hello world
foo bar baz
EOVALUE' $'not ok 1
#  Failed test at line 1
not ok 2 - foo
#  Failed test \'foo\'
#  at line 2
not ok 3
#  Failed test at line 3
ok 4
ok 5 - foo
ok 6
ok 7
ok 8
ok 9
ok 10
ok 11
ok 12
ok 13
ok 14 - foo
ok 15
ok 16
ok 17'
done_testing
