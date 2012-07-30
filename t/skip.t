#!/bin/bash
. t/test.sh
tap_is $'skip true 3 || {
    ok true foo
    ok false bar
}
skip false 3 || {
    ok true baz
    ok false bax
}
skip true 3 "a description" || {
    ok true hello
    ok false world
}
skip false 3 "a description" || {
    ok true herp
    ok false derp
}' $'ok 1 - # skip
ok 2 - # skip
ok 3 - # skip
ok 4 - baz
not ok 5 - bax
#  Failed test \'bax\'
#  at line 7
ok 6 - # skip a description
ok 7 - # skip a description
ok 8 - # skip a description
ok 9 - herp
not ok 10 - derp
#  Failed test \'derp\'
#  at line 15'
done_testing

