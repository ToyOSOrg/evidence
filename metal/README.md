# #1219: the `testcases` boot staged at a336ce8dc

`staging-a336ce8dc.log`: `cargo test --test toyos-build -- --metal
--metal-readback <scratch>/metal-f2 boot:testcases` at a336ce8dc, on macOS
arm64, through the machine-wide build slot. Exit 2: the harness's `Staged`
verdict, which a staging run always gives because it judged nothing. It
built every x86_64 binary of `tests/guest/rust-tests` (`served_file_offset`
among them, with no compiler diagnostic), compiled the C corpus and staged
236 shared members among `testcases`'s 256 jobs (`../sweep/testcases-jobs-at-a336ce8dc.txt`).

`request.txt`: the two boots that run, `testcases` and
`testcases-watchdog`. The T14 has not run them.

The staged `testcases` image carries `206_libc_refusals`'s expectation as
committed at a336ce8dc, and no other `_SC_ARG_MAX` line:

    $ LC_ALL=C grep -a -o "sysconf _SC_ARG_MAX: [0-9]*, no errno" <scratch>/metal-f2/testcases/image.img | sort | uniq -c
       1 sysconf _SC_ARG_MAX: 2093056, no errno
    exit 0
