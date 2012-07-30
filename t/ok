#!/bin/bash
. t/test.sh
tap_is $'ok true
echo $?
ok true foo
echo $?
ok <<EOCMD
true
EOCMD
echo $?
ok <<EOCMD foo
true
EOCMD
echo $?
ok false
echo $?
ok false foo
echo $?
ok <<EOCMD
false
EOCMD
echo $?
ok <<EOCMD foo
false
EOCMD
echo $?
ok <<EOCMD bar
for f in hello world!; do
    echo [\\$f]
done
EOCMD
echo $?
echo "$GOT"' $'ok 1
0
ok 2 - foo
0
ok 3
0
not ok 4
#  Failed test at line 9
127
not ok 5
#  Failed test at line 13
1
not ok 6 - foo
#  Failed test \'foo\'
#  at line 15
1
ok 7
0
not ok 8
#  Failed test at line 21
127
not ok 9
#  Failed test at line 25
127
tap.sh: line 137: bar: command not found'
done_testing

