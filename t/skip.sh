#!/bin/bash
. tap.sh

tap_is 'skip true 3 || {
    ok true foo
    ok false bar
}' 'ok 1 - # skip
ok 2 - # skip
ok 3 - # skip'

tap_is 'skip false 3 || {
    ok true baz
    ok false bax
}' "ok 1 - baz
not ok 2 - bax
#  Failed test 'bax'"

tap_is 'skip true 3 "a description" || {
    ok true hello
    ok false world
}' 'ok 1 - # skip a description
ok 2 - # skip a description
ok 3 - # skip a description'

tap_is 'skip false 3 "a description" || {
    ok true herp
    ok false derp
}' "ok 1 - herp
not ok 2 - derp
#  Failed test 'derp'"

done_testing

