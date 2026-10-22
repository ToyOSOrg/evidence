# ToyOSOrg/ToyOS#1001, round 2 (review r1 fixes, rebased onto #998)

Head `f7ab5c6efc5a80850b4d028877e1d3658724bab0` on `106a9e09e`, clean tree before and after (`checks.txt`). Masked as in r1.

| file | command | exit |
|---|---|---|
| libc-copies.log | `cargo test -p toyos-libc-copies` (signal dispositions and `raise`, error texts against `errno.h`) | 0 |
| ci-host.log | `cargo run -- --ci host` | 0 |
| build-x86.log, build-aarch64.log | `--build-only [--arch aarch64]` | 0, 0 |
| guest.log | `libc_children console_image_boots nvme_disk_boots` | 0 (3/3) |
| metal-staging/ | testcases: `std_fs` (exclusive create over a file, a dangling link and a directory) and 141 corpus cases | 2 = staged, not run |

`checks-disk-full.txt` is a first attempt the host's disk cut short. Round 1's two controls (`r1/mutations`) cover code unchanged since.

**The error texts.** Round 1's table was written from memory of glibc's wording, not read from glibc's source or from a host's `strerror` in this work; since it matched glibc verbatim, round 2 replaces it with texts taken from POSIX's own description of each code in `<errno.h>` (IEEE Std 1003.1-2017), worded neutrally where POSIX gives none.
