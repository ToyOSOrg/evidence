# ToyOSOrg/ToyOS#975, round 1

Head `337e74c0a3f592300baa179cd6d600376afc6de8` on `b48aab819`. Every check ran on that head's tree, uncommitted (`checks.txt` records its diff hash `566e954d6…`, which `mutations/summary.txt` shows restored). Host: macOS on Apple silicon, 14 cores; x86_64 guests under QEMU TCG. Masked: `~` home, `<user>` a personal name, `$TMPDIR`, `<checkout key>`.

| file | command | exit |
|---|---|---|
| ci-host.log | `cargo run -- --ci host` | 0 (88 steps) |
| build-x86.log, build-aarch64.log | `cargo run -- --build-only [--arch aarch64]` | 0, 0 |
| guest.log | `cargo test --test toyos-build -- <7 rows in checks.sh>` | 0 (7/7) |
| mutations/ | base `cargo test -p fileserver --lib`, then each patch applied, tested, reverted | base 0; each mutation 101 on its own test; restored 0 |
| metal-staging/ | `--metal --metal-readback` of 6 binaries | 2 = staged, 2 images, not run |
