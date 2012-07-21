#!/bin/bash
. tap.sh

plan 16

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
1..0
1..1
1..2
1..1000000
1..1000000000000
tap.sh: line 14: [: hello world: integer expression expected
EOEXPECTED

run ./t/donetesting
is "$GOT" <<EOEXPECTED "done_testing"
1..0
1..55
# Looks like you planned 55 tests but ran 0.
1..0
1..1
ok 1
EOEXPECTED

run ./t/pass
is "$GOT" <<EOEXPECTED "pass"
ok 1
ok 2 - Ser Pounce
EOEXPECTED

run ./t/fail
is "$GOT" <<EOEXPECTED "fail"
not ok 1
#  Failed test at ./t/fail line 3
not ok 2 - Lady Whiskers
#  Failed test 'Lady Whiskers'
#  at ./t/fail line 4
EOEXPECTED

run "./t/note 2>/dev/null"
is "$GOT" <<EOEXPECTED "note"
# foo
# foo
# bar
# 
# hello
# world!
EOEXPECTED

run "./t/diag >/dev/null"
is "$GOT" <<EOEXPECTED "diag"
# foo
# foo
# bar
# 
# hello
# world!
EOEXPECTED

run ./t/run
is "$GOT" <<EOEXPECTED "run"
0
1
0
1
Tommen
Boots
EOEXPECTED

run ./t/ok
is "$GOT" <<EOEXPECTED "ok"
ok 1
0
ok 2 - foo
0
ok 3
0
ok 4 - foo
0
not ok 5
#  Failed test at ./t/ok line 15
1
not ok 6 - foo
#  Failed test 'foo'
#  at ./t/ok line 17
1
not ok 7
#  Failed test at ./t/ok line 19
1
not ok 8 - foo
#  Failed test 'foo'
#  at ./t/ok line 23
1
ok 9 - bar
0
[hello]
[world!]
EOEXPECTED

run ./t/nok
is "$GOT" <<EOEXPECTED "nok"
not ok 1
#  Failed test at ./t/nok line 3
1
not ok 2 - foo
#  Failed test 'foo'
#  at ./t/nok line 5
1
not ok 3
#  Failed test at ./t/nok line 7
1
not ok 4 - foo
#  Failed test 'foo'
#  at ./t/nok line 11
1
ok 5
0
ok 6 - foo
0
ok 7
0
ok 8 - foo
0
not ok 9 - bar
#  Failed test 'bar'
#  at ./t/nok line 27
1
[hello]
[world!]
EOEXPECTED

run ./t/is
is "$GOT" <<EOEXPECTED "is"
ok 1
ok 2 - foo
not ok 3
#  Failed test at ./t/is line 5
#          got: 'hello'
#     expected: 'world!'
not ok 4 - foo
#  Failed test 'foo'
#  at ./t/is line 6
#          got: 'hello'
#     expected: 'world!'
ok 5
ok 6
not ok 7
#  Failed test at ./t/is line 12
# @@ -1,6 +1,2 @@
#  hello
#  world!
# -and some more stuff
# -that i am expecting
# -to be there always
# -never
EOEXPECTED

run ./t/isnt
is "$GOT" <<EOEXPECTED "isnt"
not ok 1
#  Failed test at ./t/isnt line 3
#          got: 'hello'
#     expected: anything else
not ok 2 - foo
#  Failed test 'foo'
#  at ./t/isnt line 4
#          got: 'hello'
#     expected: anything else
ok 3
ok 4 - foo
not ok 5
#  Failed test at ./t/isnt line 7
# didn't expect:
# hello
# world!
not ok 6
#  Failed test at ./t/isnt line 8
# didn't expect:
# hello
# world!
ok 7
EOEXPECTED

run ./t/skip
is "$GOT" <<EOEXPECTED "skip"
ok 1 - # skip
ok 2 - # skip
ok 3 - # skip
ok 4 - baz
not ok 5 - bax
#  Failed test 'bax'
#  at ./t/skip line 9
ok 6 - # skip a description
ok 7 - # skip a description
ok 8 - # skip a description
ok 9 - herp
not ok 10 - derp
#  Failed test 'derp'
#  at ./t/skip line 17
EOEXPECTED

run ./t/skipall
is "$GOT" <<EOEXPECTED "skip_all"
1..0 # SKIP
1..0 # SKIP this is a description
1..0 # SKIP skippy skip skip on skip
EOEXPECTED

run ./t/todo
is "$GOT" <<EOEXPECTED "todo"
ok 1 - foo # TODO
not ok 2 - bar # TODO
#  Failed (TODO) test 'bar'
#  at ./t/todo line 5
ok 3 - foo # TODO later not now never always
not ok 4 - bar # TODO later not now never always
#  Failed (TODO) test 'bar'
#  at ./t/todo line 9
EOEXPECTED

done_testing

