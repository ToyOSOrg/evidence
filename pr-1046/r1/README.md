# PR #1046 round 1: 2^255 - 19 in four words with BMI2/ADX kernels (6ea592362, on main 40e528614)

Host and inspection evidence. Nothing here is a bench result; the bench runs are staged
(`linux/README.txt`, `linux/metal-request.txt`).

- `logs/ci-host-6ea592362.log`: `cargo run -- --ci host`, exit 0, 102 steps.
- `logs/test-toyos-*-6ea592362.log`: crate tests in `[profile.toyos]` with
  `--features std,sign,wpa2,rustls-provider`, on aarch64-apple-darwin (five limbs) and
  x86_64-apple-darwin under Rosetta (the portable four words: Rosetta has no BMI2/ADX; the
  SHA-NI block test is skipped, Rosetta has no SHA). Both exit 0.
- `logs/clippy-*.log`: `clippy.sh`, the crate's three forms on two Mac targets and both UEFI
  targets with the workspace's adopted lints and `-D warnings`. All exit 0.
- `controls/`: negative controls as checked patches against 6ea592362.
  - m1-m3 mutate the assembly kernels (a high half on the wrong flag chain; the second fold's 38
    dropped from `mul`; `square`'s doubling losing its top carry). No Mac CPU here has BMI2/ADX, so
    each runs in `emu/emulate.py` (a scratch emulator of the kernels' instructions with CF and OF
    kept apart, derived from #1036's): `emu-head.log` passes 22,400 products and 22,020 squares
    against integers; `emu-m1..m3.log` each fail. Their bench binaries are staged.
  - m4-m6 mutate the portable four words (the fold's second 38; the subtraction's second borrow;
    the encoding's final selection), run by `portable.sh` under Rosetta and restored:
    each build exit 0, each test exit 101; the failing tests are listed in `control-mN.log`. m4
    and m5 are caught only by `radix64::tests::words_up_to_2_256_match_integers_and_the_portable_path`
    (and m4 by the const-form check too): no decoded input reaches those carries.
- `inspection/`: machine code of the staged guests (x86_64-unknown-toyos), the staged loader
  (x86_64-unknown-uefi) and an aarch64 rlib; `README.md` classifies every transfer.
- `probe/mac-*.txt`: `probe25519.rs` on the development Mac (exploratory, under load), main
  against the branch, five limbs both: equal within noise.
- `linux/`: what the benches' Linux runs (recipe, checksums, probe source, patches; the binaries
  are in the orchestrator's scratch and match `SHA256SUMS`), and the staged metal request.
