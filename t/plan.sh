#!/bin/bash
. tap.sh

tap_is 'plan 0' '1..0'

tap_is 'plan 1' '1..1'

tap_is 'plan 2' '1..2'

tap_is 'plan 1000000' '1..1000000'

tap_is 'plan 1000000000000' '1..1000000000000'

tap_is 'plan "hello world"' '1..hello world'

done_testing

