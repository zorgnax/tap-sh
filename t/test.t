#!/bin/bash
. tap.sh

plan 20

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
1..hello world
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

run ./t/bailout
is "$GOT" <<EOEXPECTED "bail_out"
Bail out!  
Bail out!  stop that
EOEXPECTED

run ./t/testok
is "$GOT" <<EOEXPECTED "test_ok"
ok 1
ok 2
not ok 3
#  Failed test at ./t/testok line 5
#     -z foo
ok 4
not ok 5
#  Failed test at ./t/testok line 7
#     hello
#         =
#     world
ok 6
ok 7
not ok 8
#  Failed test at ./t/testok line 10
#     hello
#         !=
#     hello
ok 9
not ok 10
#  Failed test at ./t/testok line 12
#     1
#         -eq
#     2
ok 11
not ok 12
#  Failed test at ./t/testok line 14
#     1
#         -ge
#     2
ok 13
not ok 14
#  Failed test at ./t/testok line 16
#     1
#         -gt
#     2
not ok 15
#  Failed test at ./t/testok line 17
#     2
#         -le
#     1
ok 16
not ok 17
#  Failed test at ./t/testok line 19
#     2
#         -lt
#     1
ok 18
not ok 19
#  Failed test at ./t/testok line 21
#     1
#         -ne
#     1
ok 20
not ok 21
#  Failed test at ./t/testok line 23
#     foo
#         -ef
#     bar
not ok 22
#  Failed test at ./t/testok line 24
#     foo
#         -nt
#     bar
not ok 23
#  Failed test at ./t/testok line 25
#     foo
#         -ot
#     bar
not ok 24
#  Failed test at ./t/testok line 26
#     -b foo
not ok 25
#  Failed test at ./t/testok line 27
#     -c foo
not ok 26
#  Failed test at ./t/testok line 28
#     -L foo
not ok 27
#  Failed test at ./t/testok line 29
#     -f foo
not ok 28
#  Failed test at ./t/testok line 30
#     -r foo
ok 29 - baz
ok 30 - baz
not ok 31 - baz
#  Failed test 'baz'
#  at ./t/testok line 33
#     -z foo
ok 32 - baz
not ok 33 - baz
#  Failed test 'baz'
#  at ./t/testok line 35
#     hello
#         =
#     world
ok 34 - baz
ok 35 - baz
not ok 36 - baz
#  Failed test 'baz'
#  at ./t/testok line 38
#     hello
#         !=
#     hello
ok 37 - baz
not ok 38 - baz
#  Failed test 'baz'
#  at ./t/testok line 40
#     1
#         -eq
#     2
ok 39 - baz
not ok 40 - baz
#  Failed test 'baz'
#  at ./t/testok line 42
#     1
#         -ge
#     2
ok 41 - baz
not ok 42 - baz
#  Failed test 'baz'
#  at ./t/testok line 44
#     1
#         -gt
#     2
not ok 43 - baz
#  Failed test 'baz'
#  at ./t/testok line 45
#     2
#         -le
#     1
ok 44 - baz
not ok 45 - baz
#  Failed test 'baz'
#  at ./t/testok line 47
#     2
#         -lt
#     1
ok 46 - baz
not ok 47 - baz
#  Failed test 'baz'
#  at ./t/testok line 49
#     1
#         -ne
#     1
ok 48 - baz
not ok 49 - baz
#  Failed test 'baz'
#  at ./t/testok line 51
#     foo
#         -ef
#     bar
not ok 50 - baz
#  Failed test 'baz'
#  at ./t/testok line 52
#     foo
#         -nt
#     bar
not ok 51 - baz
#  Failed test 'baz'
#  at ./t/testok line 53
#     foo
#         -ot
#     bar
not ok 52 - baz
#  Failed test 'baz'
#  at ./t/testok line 54
#     -b foo
not ok 53 - baz
#  Failed test 'baz'
#  at ./t/testok line 55
#     -c foo
not ok 54 - baz
#  Failed test 'baz'
#  at ./t/testok line 56
#     -L foo
not ok 55 - baz
#  Failed test 'baz'
#  at ./t/testok line 57
#     -f foo
not ok 56 - baz
#  Failed test 'baz'
#  at ./t/testok line 58
#     -r foo
EOEXPECTED

run ./t/like
is "$GOT" <<EOEXPECTED "like"
ok 1
ok 2
not ok 3
#  Failed test at ./t/like line 5
#                    'foo'
#     doesn't match: 'b'
ok 4
not ok 5
#  Failed test at ./t/like line 7
#                    'strangerl'
#     doesn't match: '^s.(r).*\1$'
ok 6
ok 7
crone one
ok 8 - baz
ok 9 - baz
not ok 10 - baz
#  Failed test 'baz'
#  at ./t/like line 13
#                    'foo'
#     doesn't match: 'b'
ok 11 - baz
not ok 12 - baz
#  Failed test 'baz'
#  at ./t/like line 15
#                    'strangerl'
#     doesn't match: '^s.(r).*\1$'
ok 13 - baz
ok 14 - baz
crone one
EOEXPECTED

run ./t/unlike
is "$GOT" <<EOEXPECTED "unlike"
not ok 1
#  Failed test at ./t/unlike line 3
#                    'foo'
#           matches: ''
not ok 2
#  Failed test at ./t/unlike line 4
#                    'foo'
#           matches: 'o'
ok 3
not ok 4
#  Failed test at ./t/unlike line 6
#                    'stranger'
#           matches: '^s.(r).*\1$'
ok 5
not ok 6
#  Failed test at ./t/unlike line 8
#                    'strangerlurr'
#           matches: '^s.(r).*\1$'
not ok 7
#  Failed test at ./t/unlike line 9
#                    'crone'
#           matches: 'cr([e-o]*)'
crone one
not ok 8 - baz
#  Failed test 'baz'
#  at ./t/unlike line 11
#                    'foo'
#           matches: ''
not ok 9 - baz
#  Failed test 'baz'
#  at ./t/unlike line 12
#                    'foo'
#           matches: 'o'
ok 10 - baz
not ok 11 - baz
#  Failed test 'baz'
#  at ./t/unlike line 14
#                    'stranger'
#           matches: '^s.(r).*\1$'
ok 12 - baz
not ok 13 - baz
#  Failed test 'baz'
#  at ./t/unlike line 16
#                    'strangerlurr'
#           matches: '^s.(r).*\1$'
not ok 14 - baz
#  Failed test 'baz'
#  at ./t/unlike line 17
#                    'crone'
#           matches: 'cr([e-o]*)'
crone one
EOEXPECTED

done_testing

