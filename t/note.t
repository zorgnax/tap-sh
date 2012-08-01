#!/bin/bash
. tap.sh

tap_is 'note foo' $'# foo'

tap_is $'note $\'foo\\nbar\'' $'# foo\n# bar'

tap_is 'note ""' '# '

tap_is 'note <<EOF
hello
world!
EOF' '# hello
# world!'

done_testing

