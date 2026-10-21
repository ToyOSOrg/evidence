# ToyOSOrg/ToyOS#978, round 2 (review r1 fixes)

Every check ran at the committed head `cbe0caeeff096910600185ff587725dfdf586a29` on `7c60bc1bd` (base `e74dbf183`), with a clean tree before and after (`checks.txt`). Host: macOS on Apple silicon; x86_64 guests under QEMU TCG. Masked: `~` home, `<user>` a personal name, `$TMPDIR`, `<checkout key>`.

| file | command | exit |
|---|---|---|
| mutations/ | `cargo test -p toyos --lib fd::` (9 tests), then 7 patches each applied, tested, reverted | base 0; each 101 on its own test (`checks.txt`); restored 0 |
| libc-copies.log | `cargo test -p toyos-libc-copies` | 0 (83) |
| ci-host.log | `cargo run -- --ci host` | 0 (88 steps) |
| build-x86.log, build-aarch64.log | `cargo run -- --build-only [--arch aarch64]` | 0, 0 |
| guest.log | 12 QEMU rows (`checks.sh`), `libc_children` with the new `poll_closed.c` | 0 (12/12) |
| metal-staging/ | `--metal --metal-readback` of the 16 shared-boot binaries | 2 = staged, 3 images, not run |
| metal-staging-control/ | the same of `stream_handles` alone, `mutations/guest-copy-passes-streams.patch` applied and then reverted | 2 = staged, 1 image, not run |
| sizes/ | `readelf -SW` of four programs at base `e74dbf183` (`build-x86-base.log`) and at head | see below |

## The empty table's size (B3)

calc's `.data` is 0x16a8 bytes at base, 0x356c0 at `7c60bc1bd`, and 0x16a8 at head. compositor's is 0x4200 at base and 0x15f8 at head, since `net::stream`'s tables are now all-zero too. Every measured program's `.bss` grows by 0x2ac20 (175 KiB, zero-filled and demand-paged by the kernel loader). The 0x356c0 figure is from the round 1 build of `7c60bc1bd`; it is not in this directory.

## Red first attempt

`checks-attempt1-red.txt` and `ci-host-attempt1-red.log` record the first run at `7a16a2519`. The new clippy shape (B4) was red on a `mem::forget` that the repository's disallowed-methods list refuses, and on blank lines inside four test doc comments. In the same run the `dup-makes-a-new-object` control passed (exit 0): that mutation leaks a reference to the original object, and no test counted live objects. Both are fixed at head, where a test asserts that no object outlives its descriptors and the control is red.
