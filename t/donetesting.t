#!/bin/bash
. t/test.sh
tap_is '(done_testing)
plan 55
(done_testing)
plan 0
(done_testing)
plan 1
pass
(done_testing)' '1..0
1..55
# Looks like you planned 55 tests but ran 0.
1..0
1..1
ok 1'
done_testing

