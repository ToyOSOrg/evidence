# ToyOSOrg/ToyOS#988, round 1

Every check ran at the committed head `2d3c5d8a6d8df989958b337bba02811eed35dac7` on `a8ea09d20`, with rust `9d8bb4c347f` and a clean tree before and after (`checks.txt`). Host: macOS on Apple silicon; x86_64 guests under QEMU TCG. Masked: `~` home, `<user>` a personal name, `$TMPDIR`, `<checkout key>`.

| file | command | exit |
|---|---|---|
| toyos-lib.log | `cargo test -p toyos --lib` | 0 |
| libc-copies.log | `cargo test -p toyos-libc-copies` (errno codes, served `realpath` resolution) | 0 |
| ci-host.log | `cargo run -- --ci host` | 0 |
| build-x86.log, build-aarch64.log | `cargo run -- --build-only [--arch aarch64]` | 0, 0 |
| guest.log | 12 QEMU rows plus `hosted_clang_hello` (`checks.sh`) | 0 (13/13) |
| metal-staging/ | `--metal --metal-readback` of `std_fs file_mtime disk_backtrace app_view stream_handles 211_home_files 210_stat_identity 206_libc_refusals 202_stat_mtime` | 2 = staged, 2 images, not run |

The first staging attempt also named `40_stdio`, which is no metal member, and was refused (`stage-attempt1-red.log`). `checks-attempt1-disk-full.txt` is an earlier run that the host's disk cut short. `guest-wip-before-rebase.log` is a 4-row QEMU run of the work in progress before the rebase.
