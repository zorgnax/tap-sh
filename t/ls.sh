#!/bin/bash
. tap.sh

# put self into a temp directory, deleted on exit,
# populated with some files
temp=$(mktemp -d) && cd $temp && trap 'rm -rf $d' 0
mkdir -p dir/subdir && touch dir/subdir/file2 && ln -s f symlink

ok - <<EOCOMMAND 'ls runs successfully'
ls
EOCOMMAND
is "$GOT" $'dir\nsymlink' 'ls output is as expected'
run_like 'ls -l' '[d-]([r-][w-][x-]){3}' 'has file mode'
val_ok "$RETVAL" 'ls -l returns successfully'

done_testing

