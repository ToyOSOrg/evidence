# Generated-code inspection, item 8b

- Toolchain: the ToyOS sysroot (`rustc 1.99.0-dev`).
- Profile: `[profile.toyos]`.
- Targets: `x86_64-unknown-toyos` and `aarch64-unknown-toyos`.
- Method: `branches.py` walks the call graph from P-256 and P-384 `SecretKey::agree` and `SecretKey::public_key`. Calls through the PLT are now followed, which pulls in P-256's comb `base_mul`.

## Branches reached

- **`Point::mul`** (inlined into P-256 `agree`):
  - the window counter;
  - the five doublings' counter;
  - the `i == 0` test before the last addition's masked doubling (`cmpq $-1, %r13`, on the counter);
  - `booth`'s tests of its public bit position (`shift > 58`, `word < W`).
- **`base_mul`** (the comb):
  - the row loop (`cmpq $259` on 5i + 4);
  - `booth`'s `cmpq $59` and `cmpq $254`, on the public bit position.
- **`Affine::lookup` and `Point::lookup`:** the 16-entry loop counter only. Every entry is read.
- **P-256's `Residue::mul` and `square`:** straight-line code, with no branch at all.
  - mul: 260 instructions, 20 `mulq`.
  - square: 194 instructions, 14 `mulq`.
- **`add_public`:** branches on the values of the peer's public table points only. It builds P, 2P, ..., 16P from the public peer point.
- **`affine`, `to_be`, `public_key`, `agree`:**
  - the public inversion exponent (P-384's 4-bit windows, `ands #0xf`; P-256's addition chain has no branch);
  - `affine`'s infinity check, which never varies for valid inputs;
  - `copy_nonoverlapping`'s debug overlap check, on stack addresses.

## Found and fixed during the inspection

- **Overflow-checked additions on secret-derived values.** `+` in the new square, reduction and Booth/representative arithmetic would have compiled to branches in the shipped profile. All of them are wrapping or carry operations now.
- **Out-of-line iterator.** The first version of the lookups used `iter().enumerate().skip(1)`, which the shipped profile kept out of line as `Iterator::nth`. It was public but slow; the lookups index directly now.
