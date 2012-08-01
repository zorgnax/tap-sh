#!/bin/bash
. tap.sh

tap_is 'skip_all' '1..0 # SKIP'

tap_is 'skip_all "herp derp"' '1..0 # SKIP herp derp'

tap_is 'if true; then skip_all "skippy skip skip on skip"; fi; echo foo' \
       '1..0 # SKIP skippy skip skip on skip'

done_testing

