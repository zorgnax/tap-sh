#!/bin/bash
. tap.sh

tap_is 'run true' ''

tap_is 'run false; echo $?' '1'

tap_is $'run - <<EOCMD\nexit 55\nEOCMD\necho $?' '55'

tap_is 'run "echo Tommen"; echo $GOT' 'Tommen'

tap_is 'run "echo Boots" FOO; echo $FOO' 'Boots'

done_testing

