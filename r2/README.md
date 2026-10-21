# ToyOSOrg/ToyOS#988, round 2 (review r1 fixes)

Every check ran at the committed head `7cef3dd71abd6d8d525bf1bd68750da367a21cc1` on `a8ea09d20`, with rust `9d8bb4c347f` and a clean tree before and after (`checks.txt`). Masked as in r1.

| file | command | exit |
|---|---|---|
| toyos-lib.log | `cargo test -p toyos --lib` | 0 |
| libc-copies.log | `cargo test -p toyos-libc-copies` (17 path-resolution tests) | 0 |
| mutations/ | `no-kernel-handoff` (B2) and `last-name-links-only` (B3), each applied, `path_resolution` tested, reverted | 101 each, on the tests named in `checks.txt`'s logs; restored 0 |
| ci-host.log | `cargo run -- --ci host` | 0 |
| build-x86.log, build-aarch64.log | `cargo run -- --build-only [--arch aarch64]` | 0, 0 |
| guest.log | 12 QEMU rows plus `hosted_clang_hello` | 0 (13/13) |
| metal-staging/ | the testcases image only: `std_fs file_mtime disk_backtrace stream_handles` and the whole C corpus that has an `.expect` and is not declared not-run (`corpus.txt`, 140 cases, among them the new `212_full_table` and the corrected `206_libc_refusals`) | 2 = staged, 1 image, not run |

`metal-r1/` holds round 1's T14 readback logs at `2d3c5d8a6`, run by the coordinator: 9/10, with `206_libc_refusals` red on the stale `F_DUPFD_CLOEXEC` line that #978 left.
