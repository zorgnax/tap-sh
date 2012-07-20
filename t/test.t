#!/bin/bash
. tap.sh

run ./t/valok
is "$GOT" <<EOEXPECTED "val_ok"
ok 1
ok 2 - foo
ok 3
not ok 4
#  Failed test at ./t/valok line 8
not ok 5 - foo
#  Failed test 'foo'
#  at ./t/valok line 9
not ok 6
#  Failed test at ./t/valok line 10
not ok 7
#  Failed test at ./t/valok line 11
not ok 8
#  Failed test at ./t/valok line 12
not ok 9
#  Failed test at ./t/valok line 13
not ok 10
#  Failed test at ./t/valok line 14
not ok 11
#  Failed test at ./t/valok line 15
not ok 12
#  Failed test at ./t/valok line 16
not ok 13
#  Failed test at ./t/valok line 17
not ok 14 - foo
#  Failed test 'foo'
#  at ./t/valok line 18
not ok 15
#  Failed test at ./t/valok line 19
not ok 16
#  Failed test at ./t/valok line 20
not ok 17
#  Failed test at ./t/valok line 24
EOEXPECTED

