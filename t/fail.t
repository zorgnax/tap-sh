#!/bin/bash
. t/test.sh
tap_is 'fail
fail "Lady Whiskers"' $'not ok 1
#  Failed test at line 1
not ok 2 - Lady Whiskers
#  Failed test \'Lady Whiskers\'
#  at line 2'
done_testing

