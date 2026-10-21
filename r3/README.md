# ToyOSOrg/ToyOS#988, round 3 (review r2 fixes)

Every check ran at the committed head `43270738e7504bf9ad6a6460e7c1d6d801fdddee` (base `a8ea09d20`; the `on` in `checks.txt` names its third parent, `2d3c5d8a6`), rust `9d8bb4c347f`, with a clean tree before and after. Masked as in r1.

| file | command | exit |
|---|---|---|
| toyos-lib.log, libc-copies.log | `cargo test -p toyos --lib`, `-p toyos-libc-copies` (18 path-resolution tests) | 0, 0 |
| mutations/ | three resolver controls, each applied, `path_resolution` tested, reverted: `handoff-at-the-first-name` (N1, r2's behaviour), `no-kernel-handoff` (B2), `last-name-links-only` (B3) | 101 each; the failing tests are in each log |
| ci-host.log | `cargo run -- --ci host` | 0 |
| build-x86.log, build-aarch64.log | `cargo run -- --build-only [--arch aarch64]` | 0, 0 |
| guest.log | 12 QEMU rows plus `hosted_clang_hello` | 0 (13/13) |
| metal-staging/ | proctreecase (`app_view`) and testcases (`std_fs file_mtime disk_backtrace stream_handles` and the 140 corpus cases of `corpus.txt`) | 2 = staged, 2 images, not run |

`metal-r2/testcases-kernel.log` is round 2's T14 readback at `7cef3dd71`, run by the coordinator: 144/145, with `212_full_table` red because the kernel's handle table filled first (N2).
