# ToyOSOrg/ToyOS#977, round 2 (review r1's fixes)

Head `1fcbfd9d23b8cfd7f316fcb082a9c89c8d84a6aa`, rebased onto `e74dbf183` (#975, #976). Host and masking as in r1.

| file | command | revision | exit |
|---|---|---|---|
| ci-host.log | `cargo run -- --ci host` | 1fcbfd9d2 | 0 (88 steps) |
| build-only-x86_64.log | `cargo run -- --build-only` | 1fcbfd9d2 | 0 |
| build-only-aarch64.log | `cargo run -- --build-only --arch aarch64` | 1fcbfd9d2 | 0 |
| controls/c7* | `limits.h`'s `PIPE_BUF` set to 512 by `git apply`, `cargo test -p toyos-libc-copies pipe_buf`, reverted | 48f9c632e + round 2's working tree (= 1fcbfd9d2) | 101 (left 4096, right 512); restored 0 |

r1's controls c1–c6 and its QEMU smoke still apply. The r2 changes to `kernel/pure/pipe.rs` are only to its module comment, and the rebase brought in #976's scheduler placement, which these pipe paths do not touch. Host CI and both builds were rerun on the rebased head.
