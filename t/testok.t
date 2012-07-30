#!/bin/bash
. t/test.sh
tap_is $'test_ok -n "foo"
test_ok -n ""
test_ok -z "foo"
test_ok -z ""
test_ok "hello" = "world"
test_ok "hello" = "hello"
test_ok "hello" != "world"
test_ok "hello" != "hello"
test_ok 1 -eq 1
test_ok 1 -eq 2
test_ok 2 -ge 1
test_ok 1 -ge 2
test_ok 2 -gt 1
test_ok 1 -gt 2
test_ok 2 -le 1
test_ok 1 -le 2
test_ok 2 -lt 1
test_ok 1 -lt 2
test_ok 1 -ne 1
test_ok 1 -ne 2
test_ok foo -ef bar
test_ok foo -nt bar
test_ok foo -ot bar
test_ok -b foo
test_ok -c foo
test_ok -L foo
test_ok -f foo
test_ok -r foo
test_ok -n "foo" "baz"
test_ok -n "" "baz"
test_ok -z "foo" "baz"
test_ok -z "" "baz"
test_ok "hello" = "world" "baz"
test_ok "hello" = "hello" "baz"
test_ok "hello" != "world" "baz"
test_ok "hello" != "hello" "baz"
test_ok 1 -eq 1 "baz"
test_ok 1 -eq 2 "baz"
test_ok 2 -ge 1 "baz"
test_ok 1 -ge 2 "baz"
test_ok 2 -gt 1 "baz"
test_ok 1 -gt 2 "baz"
test_ok 2 -le 1 "baz"
test_ok 1 -le 2 "baz"
test_ok 2 -lt 1 "baz"
test_ok 1 -lt 2 "baz"
test_ok 1 -ne 1 "baz"
test_ok 1 -ne 2 "baz"
test_ok foo -ef bar "baz"
test_ok foo -nt bar "baz"
test_ok foo -ot bar "baz"
test_ok -b foo "baz"
test_ok -c foo "baz"
test_ok -L foo "baz"
test_ok -f foo "baz"
test_ok -r foo "baz"' $'ok 1
ok 2
not ok 3
#  Failed test at line 3
#     -z foo
ok 4
not ok 5
#  Failed test at line 5
#     hello
#         =
#     world
ok 6
ok 7
not ok 8
#  Failed test at line 8
#     hello
#         !=
#     hello
ok 9
not ok 10
#  Failed test at line 10
#     1
#         -eq
#     2
ok 11
not ok 12
#  Failed test at line 12
#     1
#         -ge
#     2
ok 13
not ok 14
#  Failed test at line 14
#     1
#         -gt
#     2
not ok 15
#  Failed test at line 15
#     2
#         -le
#     1
ok 16
not ok 17
#  Failed test at line 17
#     2
#         -lt
#     1
ok 18
not ok 19
#  Failed test at line 19
#     1
#         -ne
#     1
ok 20
not ok 21
#  Failed test at line 21
#     foo
#         -ef
#     bar
not ok 22
#  Failed test at line 22
#     foo
#         -nt
#     bar
not ok 23
#  Failed test at line 23
#     foo
#         -ot
#     bar
not ok 24
#  Failed test at line 24
#     -b foo
not ok 25
#  Failed test at line 25
#     -c foo
not ok 26
#  Failed test at line 26
#     -L foo
not ok 27
#  Failed test at line 27
#     -f foo
not ok 28
#  Failed test at line 28
#     -r foo
ok 29 - baz
ok 30 - baz
not ok 31 - baz
#  Failed test \'baz\'
#  at line 31
#     -z foo
ok 32 - baz
not ok 33 - baz
#  Failed test \'baz\'
#  at line 33
#     hello
#         =
#     world
ok 34 - baz
ok 35 - baz
not ok 36 - baz
#  Failed test \'baz\'
#  at line 36
#     hello
#         !=
#     hello
ok 37 - baz
not ok 38 - baz
#  Failed test \'baz\'
#  at line 38
#     1
#         -eq
#     2
ok 39 - baz
not ok 40 - baz
#  Failed test \'baz\'
#  at line 40
#     1
#         -ge
#     2
ok 41 - baz
not ok 42 - baz
#  Failed test \'baz\'
#  at line 42
#     1
#         -gt
#     2
not ok 43 - baz
#  Failed test \'baz\'
#  at line 43
#     2
#         -le
#     1
ok 44 - baz
not ok 45 - baz
#  Failed test \'baz\'
#  at line 45
#     2
#         -lt
#     1
ok 46 - baz
not ok 47 - baz
#  Failed test \'baz\'
#  at line 47
#     1
#         -ne
#     1
ok 48 - baz
not ok 49 - baz
#  Failed test \'baz\'
#  at line 49
#     foo
#         -ef
#     bar
not ok 50 - baz
#  Failed test \'baz\'
#  at line 50
#     foo
#         -nt
#     bar
not ok 51 - baz
#  Failed test \'baz\'
#  at line 51
#     foo
#         -ot
#     bar
not ok 52 - baz
#  Failed test \'baz\'
#  at line 52
#     -b foo
not ok 53 - baz
#  Failed test \'baz\'
#  at line 53
#     -c foo
not ok 54 - baz
#  Failed test \'baz\'
#  at line 54
#     -L foo
not ok 55 - baz
#  Failed test \'baz\'
#  at line 55
#     -f foo
not ok 56 - baz
#  Failed test \'baz\'
#  at line 56
#     -r foo'
done_testing

