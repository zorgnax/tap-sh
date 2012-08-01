#!/bin/bash
. tap.sh

tap_is 'diag foo' '# foo'

tap_is $'diag $\'foo\\nbar\'' $'# foo\n# bar'

tap_is 'diag ""' '# '

tap_is $'diag <<EOF\nhello\nworld!\nEOF' $'# hello\n# world!'

done_testing
