#!/bin/bash
. t/test.sh
tap_is $'val_ok 0
val_ok 0 "foo"
val_ok <<EOVALUE 0
hello world
EOVALUE
val_ok 1
val_ok 1 "foo"
val_ok 2
val_ok 255
val_ok 256
val_ok 257
val_ok 1000000
val_ok 1000000000000
val_ok
val_ok ""
val_ok "" "foo"
val_ok "this is a string with spaces"
val_ok <<EOVALUE
hello world
foo bar baz
EOVALUE
val_ok <<EOVALUE "foo"
hello world
foo bar baz
EOVALUE' $'ok 1
ok 2 - foo
ok 3
not ok 4
#  Failed test at line 6
not ok 5 - foo
#  Failed test \'foo\'
#  at line 7
not ok 6
#  Failed test at line 8
not ok 7
#  Failed test at line 9
not ok 8
#  Failed test at line 10
not ok 9
#  Failed test at line 11
not ok 10
#  Failed test at line 12
not ok 11
#  Failed test at line 13
not ok 12
#  Failed test at line 14
not ok 13
#  Failed test at line 15
not ok 14 - foo
#  Failed test \'foo\'
#  at line 16
not ok 15
#  Failed test at line 17
not ok 16
#  Failed test at line 18
not ok 17
#  Failed test at line 22'
done_testing

