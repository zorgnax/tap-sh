NAME
====

tap.sh - Write tests in Bash


SYNOPSIS
========

    #!/bin/bash
    . tap.sh
    plan 5
    val_ok 0 'this is an ok value'
    ok '(exit 55)' '55 is truth'
    like 'maggot' '^keep|it|coming' 'yup'
    pass
    is 'energy' 'green' 'incredible'
    test_ok 55 -gt 1024 'blah'
    todo 'the foobar part is not implemented yet'
        run_is 'pissant' 'all your best aint good enough' 'syzzerp'
    odot
    its_totally_cool=yes
    skip 'i dont feel like it' 2 '[ "$its_totally_cool" ]' || {
        run_is 'valmorphanize --limosine' 'jet'
        run_is 'valmorphanize --your-face' 'woow'
    }
    done_testing

Returns:

    1..5
    ok 1 - this is an ok value
    not ok 2 - 55 is truth
    #  Failed test '55 is truth'
    #  at ./t/synopsis.sh line 6
    not ok 3 - yup
    #  Failed test 'yup'
    #  at ./t/synopsis.sh line 7
    #                    'maggot'
    #     doesn't match: '^keep|it|coming'
    ok 4
    not ok 5 - incredible
    #  Failed test 'incredible'
    #  at ./t/synopsis.sh line 9
    #          got: 'energy'
    #     expected: 'green'
    not ok 6 - blah
    #  Failed test 'blah'
    #  at ./t/synopsis.sh line 10
    #     55
    #         -gt
    #     1024
    not ok 7 - syzzerp # TODO the foobar part is not implemented yet
    #  Failed (TODO) test 'syzzerp'
    #  at ./t/synopsis.sh line 12
    #          got: 'tap.sh: line 149: pissant: command not found'
    #     expected: 'all your best aint good enough'
    ok 8 - # skip i dont feel like it
    ok 9 - # skip i dont feel like it
    # Looks like you planned 5 tests but ran 9.
    # Looks like you failed 4 tests of 9 run.


DESCRIPTION
===========

TAP is an easy-to-read convention for writing tests for your
software. This library intends to copy some of the standard functions
for generating it from the Test::More library in Perl, but tailored for
convenience when working with Bash.


FUNCTIONS
=========

-   plan <n>

    Plan <n> tests. If you don't know how many tests there are going to
    be leave this out. It will print a message like the following:

        1..5

-   val_ok <value> [<desc>]
-   val_nok <value> [<desc>]

    Tests whether a given value is 0. val_nok tests the opposite. Useful
    with return values from programs:

        test -f foo
        val_ok $? 'foo exists'

    Like all testing functions, it will print this on success:

        ok 1 - foo exists

    On failure it prints:

        not ok 1 - foo exists
        #  Failed test 'foo exists'
        #  at test.sh line 5

-   ok <cmd> [<desc>]
-   nok <cmd> [<desc>]
-   sub_ok <cmd> [<desc>]
-   sub_nok <cmd> [<desc>]

    Tests whether a given command returns successfully. nok does the
    oposite. This command is run in an eval so your shell will be
    influenced by what you run here. If you prefer not to have the
    command effect your current shell, you can run the command in
    (...) or use the sub_ok function. The command output is not shown,
    but placed in a variable called $GOT. It's retval in $RETVAL.

        ok '[ -f foo ]' 'foo exists'
    
    Prints something like this on failure:

        not ok 1 - foo exists
        #  Failed test 'foo exists'
        #  at test.sh line 5

    If the command is "-", then it will take the command from stdin.

        ok - <<EOCMD 'foo exists'
        [ -f foo ]
        EOCMD

    There can be more than one statement provided in the command. It is
    advisable to chain commands with && rather than any other way since
    a fauly command in the middle will short circuit the operation.

        ok '[ -f foo ] && [ -f bar ]'

-   pass [<desc>]
-   fail [<desc>]

    Equivalent to `ok true`. Useful for when the test takes up more than
    can be neatly fit in a string. fail is the opposite.

-   is <got> <expected> [<desc>]
-   isnt <got> <unexpected> [<desc>]
-   run_is <cmd> <expected> [<desc>]
-   run_isnt <cmd> <unexpected> [<desc>]
-   sub_run_is <cmd> <expected> [<desc>]
-   sub_run_isnt <cmd> <expected> [<desc>]

    Tests whether the string you got is what you expected. isnt tests that
    its not the unexpected. The `run_*` version of these commands take a
    command to run, similar to `ok` whose output will be matched agains
    the expected string. `sub_run_*` will run the command in a subprocess.

        is 'foo' 'bar' 'foo is bar'

    Prints:

        not ok 1 - foo is bar
        #  Failed test 'foo is bar'
        #  at ./test.sh line 4
        #          got: 'foo'
        #     expected: 'bar'

    For convenience, if either what you got or what you expected are more
    than one line, it will show a diff from the expected to what you got.

        is 'foo
        bar' 'foo
        baz'

    Prints:

        not ok 1
        #  Failed test at ./test.sh line 5
        # @@ -1,2 +1,2 @@
        #  foo
        # -baz
        # +bar

-   test_ok <op> <a> [<desc>]
-   test_ok <a> <op> <b> [<desc>]

    Works like the `test` program (a.k.a. `[`) in the shell, but only
    takes two or three arguments (doesn't handle chaining tests with
    -a or -o, yet). And gives a better error message that an equivalent
    `ok 'test ...'`.

        test_ok 55 -gt 1024 'blah'

    Prints:

        not ok 6 - blah
        #  Failed test 'blah'
        #  at ./t/synopsis.sh line 10
        #     55
        #         -gt
        #     1024

-   like <got> <regex> [<desc>]
-   unlike <got> <regex> [<desc>]
-   run_like <cmd> <regex> [<desc>]
-   run_unlike <cmd> <regex> [<desc>]
-   sub_run_like <cmd> <regex> [<desc>]
-   sub_run_unlike <cmd> <regex> [<desc>]

    Tests that a string matches a given regex. With `unlike` its the
    opposite. Internally uses bash's [[ "$got" =~ $regex ]], so the
    $BASH_REMATCH variable will be available to you after running this.
    The `run_*` variation takes a command and tests the regex against
    its output.

        run_like 'curl -q http://www.google.com' '<script.*>(.*?)</script>' \
            'google uses javascripts'
        echo "${BASH_REMATCH[1]}"

-   skip <desc> <n> [<cmd>] || {...}

    Skips <n> tests in a block of commands under a certain condition.

        skip 'need the herpderp package' 2 '[ ! "$HERPDERPVERSION" ]' || {
            ok 'herp';
            ok 'derp';
        }

    Prints:

        ok 1 - # skip need the herpderp package
        ok 2 - # skip need the herpderp package


-   skip_all [<desc>]

    Skips the entire test.

        skip_all 'its an amazing time'

    Prints:

        1..0 # SKIP its an amazing time

    and exits immediately.


-   todo [<desc>]
-   odot

    Mark a series of tests as not ready yet.

        todo 'everything wrapped together'
            ok 'echo little things'
            ok 'ls big things'
            nok 'ps ridiculous statistics'
        odot

    Prints:

        ok 1 # TODO everything wrapped together
        not ok 2 # TODO everything wrapped together
        #  Failed (TODO) test at ./test.sh line 6
        ok 3 # TODO everything wrapped together

-   bail_out [<desc>]

    Bail out of the test suite immediately.

        bail_out 'The social contract is broken.'
    
    Prints:

        Bail out!  The social contract is broken

    and exits immediately

- note [<mesg>]
- diag [<mesg>]

    Prints a message to the TAP output stream. `note` outputs to STDOUT and `diag` outputs to STDERR. You can use these functions as a filter:

        echo "hello" | note
        note "hello" # same thing

    Prints:

        # hello

-   run <cmd> [<var>] [<retval>]
-   sub_run <cmd> [<var>] [<retval>]

    Runs a command and saves its output in a variable, by default $GOT,
    and its retval another variable, by default in $RETVAL. If you pass
    a command of "-", The command comes from STDIN. `sub_run` will run
    the command in a sub process.

        run -<<EOCMD HERP
        ls
        EOCMD
        is "$HERP" "asdf"


A NOTE ON RUNNING TESTS IN ITS OWN DIRECTORY
============================================

Some tests such as those bundled with git or coreutils like to put the
program into a temporary directory filled with known collection of files
to test. Then delete those files after the test is run. Here's one way
to do it:

    #!/bin/bash
    . tap.sh
    temp=$(mktemp -d) && cd $temp && trap 'rm -rf $d' 0 &&
    mkdir -p dir/subdir && touch dir/subdir/file2 && ln -s f symlink
    # rest of the test goes here. plan ... done_testing

The test will start out in a sane directory, then no matter what happens
the directory will be deleted when the test is done. You may want to put
the above in a modified version of tap.sh to automatically do it as part
of your tests.

