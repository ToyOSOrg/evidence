# ToyOSOrg/ToyOS#1002 (memory stage 1: 4 KiB frames, tables in frames), round 1

Head now `e3ff36138` on `main` `68dbf80c7`. Logs masked (paths, emails, MAC and IPv4 addresses).

| file | command | revision | exit |
|---|---|---|---|
| s1-host2.log | `cargo run -- --ci host` | `20417add9` (same commit before two rebases onto `main`) | 0 |
| s1r-kbuild.log | kernel build, x86_64 and aarch64, toyos profile | `781f45281` (rebased onto `954b4587b`) | 0 |
| s1-build.log | `cargo run -- --build-only` | stage-1 tree before its commit | 0 |
| s1-guest-1.log, s1-nocapture.log | 13 QEMU rows (q35 and virt) | stage-1 tree before its commit | 0 |
| controls/frames-free-under-pin.* | `cargo test -p kernel --lib frames::` with a frame freed under a pin released at once | `20417add9` + patch | 101 (2 tests red) |
| controls/frames-never-whole.* | the same with a split superframe never made whole | `20417add9` + patch | 101 (4 tests red) |

The rebases changed no line of this commit's own diff (`git range-diff` reports it equal). The whole stack's head is checked in `pr-1010`, whose host CI and guest runs cover this code too.
