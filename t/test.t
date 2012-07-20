#!/bin/bash
. tap.sh

plan 3

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

run ./t/valnok
is "$GOT" <<EOEXPECTED "val_nok"
not ok 1
#  Failed test at ./t/valnok line 3
not ok 2 - foo
#  Failed test 'foo'
#  at ./t/valnok line 4
not ok 3
#  Failed test at ./t/valnok line 5
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
ok 17
EOEXPECTED

run ./t/plan
is "$GOT" <<EOEXPECTED "plan"
1..-2
1..0
1..1
1..2
1..1000000
1..1000000000000
tap.sh: line 15: [: hello world: integer expression expected
EOEXPECTED

done_testing

