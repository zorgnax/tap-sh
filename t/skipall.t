#!/bin/bash
. t/test.sh
tap_is $'(skip_all)
(skip_all "this is a description")
if true; then
    skip_all "skippy skip skip on skip"
fi
echo "doesn\'t happen"' $'1..0 # SKIP
1..0 # SKIP this is a description
1..0 # SKIP skippy skip skip on skip
doesn\'t happen'
done_testing

