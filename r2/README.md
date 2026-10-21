# ToyOSOrg/ToyOS#973, round 2 (review r1's fixes)

Head `b705b266cdcb9b432bc1fd693960e0ca3af37a7a` (on `da07292cc`, `96d307a12`; base `e62ebc084`). Host: macOS on Apple silicon, 14 cores; x86_64 guests under QEMU TCG. Masking as in r1.

| file | command | revision | exit |
|---|---|---|---|
| ci-host.log | `cargo run -- --ci host` | `b705b266c`'s tree before its issue-text edit (`issues/a-pipe-write-…md` prose only) | 0 (87 steps) |
| build-only-x86_64.log, build-only-aarch64.log | `cargo run -- --build-only [--arch aarch64]` | same | 0, 0 |
| mutations/ | `run.sh`: host base, then each patch applied, built, `cargo test -p kernel --lib --features sched-check message::`, reverted | `b705b266c` | base 0 (4 pass); window-ignores-pins 101 (2 red); admit-takes-handles-without-bytes 101 (1 red); restored 0 |
| guest-qemu.log | `cargo test --test toyos-build -- <12 rows>` | `b705b266c` | 0 (12/12) |
| metal-staging/fix-* | `--metal --metal-readback` of 11 binaries | `b705b266c` | 2 = staged, 3 images |
| metal-staging/kernel-control-* | the same for 2 binaries with `mutations/read-ignores-pins.patch` applied, then reverted | `b705b266c` + patch | 2 = staged, 1 image; restored 0 |

Metal is staged, not run.
