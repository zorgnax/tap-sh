#!/bin/bash
. t/test.sh
tap_is $'plan 0
plan 1
plan 2
plan 1000000
plan 1000000000000
plan "hello world"' $'1..0
1..1
1..2
1..1000000
1..1000000000000
1..hello world'
done_testing
