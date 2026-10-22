# Generated-code inspection of P-256/P-384 agreement and key generation (item 8a)

- Toolchain and method: as in pr-992/r2 (ToyOS sysroot `rustc 1.99.0-dev`, `[profile.toyos]`, `x86_64-unknown-toyos` and `aarch64-unknown-toyos`, `branches.py` from `SecretKey::agree` and `SecretKey::public_key`).
- Every branch in `Point::mul` is one of:
  - the 52 (P-256) or 77 (P-384) window loop's counter;
  - the five doublings' counter;
  - `booth`'s tests of its public bit position (`word < N`, `shift > 58`).
- `Point::lookup`: its loop over the 16 entries, at a stride of 96 or 144 bytes. The aarch64 P-384 branch takes its flags from `subs x22, x22, #144`; the earlier `cmp x21, #0` is overwritten before it. Every entry is read; the choice and the negation of Y are masks.
- `Residue::mul`: its row counter.
- `affine`/`to_be`/`agree`/`public_key`: as before: the public inversion exponent's bits, `affine`'s infinity check (constant outcome), and `copy_nonoverlapping`'s debug overlap check on addresses.
