#!/bin/bash
. tap.sh

tap_is 'fail' 'not ok 1
#  Failed test at line 1'

tap_is 'fail "Lady Whiskers"' "not ok 1 - Lady Whiskers
#  Failed test 'Lady Whiskers'
#  at line 1"

done_testing

