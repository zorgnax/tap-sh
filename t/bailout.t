#!/bin/bash
. t/test.sh
tap_is \
'(bail_out)
(bail_out "stop that")
' \
'Bail out!  
Bail out!  stop that'
done_testing

