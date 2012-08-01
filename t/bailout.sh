#!/bin/bash
. tap.sh

tap_is 'bail_out' 'Bail out!  '

tap_is 'bail_out "stop that"' 'Bail out!  stop that'

is "$RETVAL" "255" "bail_out returns 255"

done_testing

