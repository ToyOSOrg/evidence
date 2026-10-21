# ToyOSOrg/ToyOS#978, round 1

Every check ran at the committed head `7c60bc1bde26b4443ed1800516e37653297393d9` on `e74dbf183`, with a clean tree (`checks3.txt`). Host: macOS on Apple silicon, 14 cores; x86_64 guests under QEMU TCG. Masked: `~` home, `<user>` a personal name, `$TMPDIR`, `<checkout key>`.

| file | command | exit |
|---|---|---|
| mutations/ | `cargo test -p toyos --lib fd::`, then 4 patches each applied, tested, reverted | base 0; each 101 on its own test; restored 0 |
| ci-host3.log | `cargo run -- --ci host` | 0 (88 steps) |
| build-x86.log, build-aarch64-2.log | `cargo run -- --build-only [--arch aarch64]` | 0, 0 |
| guest3.log | 12 QEMU rows (`checks2.sh`) | 0 (12/12) |
| guest-bar.log | `cargo test --test toyos-build -- bar_map_again` | 0 (1/1) |
| guest-first-run-red.log | the first QEMU run, before the two C tests moved to EBADF: `libc_children` red on `spawn_cloexec` and `spawn_signaled`'s handle arm | 1 |
| metal-staging/ | `--metal --metal-readback` of 16 shared-boot binaries | 2 = staged, 3 images, not run |
