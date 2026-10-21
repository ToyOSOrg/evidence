# ToyOSOrg/ToyOS#977, round 1 (small pipe writes land whole)

Head `584d4f246242c9707652658f2aed1ba72affffc2`, base `b48aab819` (#973).
Host: macOS on Apple silicon, 14 cores; x86_64 guests under QEMU. Paths masked: `~` is the user's home, `<user>` a personal name, `$TMPDIR` the per-user temp directory, `<checkout key>` the checkout's throwaway signing key.

| file | command | revision | exit |
|---|---|---|---|
| ci-host.log | `cargo run -- --ci host` | 584d4f246's tree before the issue file's deletion (staged, uncommitted) | 0 (88 steps) |
| build-only-x86_64.log | `cargo run -- --build-only` | 584d4f246's source tree, uncommitted | 0 |
| build-only-aarch64.log | `cargo run -- --build-only --arch aarch64` | the same | 0 |
| guest-qemu.log | `cargo test --test toyos-build -- console_image_boots libc_children` | 584d4f246 | 0 (2/2) |
| controls/ | `run.sh`: each patch applied with `git apply`, built (`--no-run`), `cargo test -p kernel --lib --features sched-check pipe::`, reverted; then the restored tree | 584d4f246 | every control builds (0) and reds (101); restored 0 |

The commit adds only the issue deletion and no code to the tree the host checks and builds ran on.

Controls (`controls/summary.txt` has the red test names):
- c1 `Landing::Pipe` lands as far as it fits (the old behaviour): whole-or-wait, readiness retry, reader-leaving and the competing writers' no-tear test red.
- c2 an empty write wants one byte of room (the old `want.max(1)`): empty-write and wake-iff-lands red.
- c3 `writable` ignores the reader: reader-leaving red.
- c4 a waiter wakes at one byte of room (the old `has_space(id, 1)`): wake-iff-lands red (woken to be refused).
- c5 a waiter wants one byte more than its write: wake-iff-lands red (a missed wake).
- c6 (the test model's poll, not product code) writable at one byte: the readiness-retry test red, i.e. it catches a busy retry.
