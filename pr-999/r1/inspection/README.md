# Generated-code inspection of the comb's secret paths (item 7)

- Toolchain: the ToyOS sysroot, `rustc 1.99.0-dev`; `[profile.toyos]` of `tests/guest/rust-tests`; `x86_64-unknown-toyos` and `aarch64-unknown-toyos`.
- Command: `cargo rustc -p toyos-crypto --profile toyos --target <target> --lib -- --emit asm`.
- Walked by `branches.py` from `SigningKey::sign`, `SigningKey::from_seed` and `x25519::SecretKey::public_key`. The output is `x86-comb.txt` and `arm-comb.txt`.

## Found and fixed during the inspection

- **What it found.** The radix-16 recoding's `+=`/`-=` on the secret i8 digits compiled to overflow-check branches: `addb …; jo` on x86-64, and `cmp w, w, sxtb; b.ne` on aarch64.
- **Why it mattered.** No branch was ever taken. Their condition, though, was computed from secret digits.
- **The fix.** The recoding now uses wrapping operations, and both listings here are after that change.

## Classification of every branch reached

- **`base_mul`:** the recoding loop counter (63) and the two 32-row loops. Row addresses advance by 960 bytes on a public counter.
- **`Niels::select`:** its loop over all eight 120-byte entries, a public counter. The choice and the negation are masks.
- **`barrett`, `mul_add`, `square_times`:** loop counters.
- **`Tight::bytes`, `S::bytes`, and `SigningKey::from_seed`'s `je …_11` group:** `copy_nonoverlapping`'s debug overlap check, on stack addresses (public).
- **`sign`, `from_seed`, and the hash on aarch64:** public message and buffer lengths, the 32-byte slice-length check, the hash's round counter, and `update`'s error result.
