#!/bin/bash
. tap.sh

tap_is 'fail' 'not ok 1
#  Failed test'

tap_is 'fail "Lady Whiskers"' "not ok 1 - Lady Whiskers
#  Failed test 'Lady Whiskers'"

done_testing

