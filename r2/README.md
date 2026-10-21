# ToyOSOrg/ToyOS#975, round 2 (review r1's fixes)

Every check ran at the committed head `8dde655b3321d302369d6a3f316f5c85ebb7dd5a`, with a clean tree (`checks.txt`). Masking as in r1.

| file | command | exit |
|---|---|---|
| mutations/ | base `cargo test -p fileserver --lib` (65 pass), then 4 patches each applied, tested, reverted | base 0; each 101 on its own test; restored 0 |
| ci-host.log | `cargo run -- --ci host` | 0 (88 steps) |
| build-x86.log, build-aarch64.log | `cargo run -- --build-only [--arch aarch64]` | 0, 0 |
| guest.log | 7 QEMU rows in `checks.sh` | 0 (7/7) |
| metal-staging/fix-* | `--metal --metal-readback`, 6 binaries | 2 = staged, 2 images |
| metal-staging/control-* | the same for `an_export_shares_its_descriptions` with `mutations/settled-drains-nothing.patch` applied, then reverted | 2 = staged, 1 image; restored 0 |

Round 1's T14 run at `337e74c0a` was 6/6 PASS, as posted on the PR; this round's images are restaged and not yet run.
