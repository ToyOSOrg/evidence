# Automated adversarial review A: field and curve arithmetic (tree 2af52e453)
This is a Claude model review, not an external audit.

## BLOCKER
None.

## NOTE
1. **`V<N>`'s "below the modulus" invariant is not held by the type** (`src/montgomery.rs:6`, `V(pub(crate) [u64; N])`).
   - `Mod::reduce` (`:60-72`) subtracts the modulus at most once, so a `V` at or above p would give a non-canonical result. `eq(&V::zero())` (`nist.rs:53,72-74,86`) would then stop being a reliable infinity test.
   - Every current constructor upholds the invariant (decode `nist.rs:132`; r and s `:188-193`; `ecc.rs:71-72`).
   - The digest and x reduction (`nist.rs:195`, `:201`) use one conditional subtract, `n.add(&V::zero(), z)`. That is correct only because n > 2^255 (P-256) and n > 2^383 (P-384), and it would be wrong for a third curve with n < 2^(64N-1).
   - Sound today; a latent trap for any new curve.
2. **No Wycheproof ECDH vectors** (`ecdh_secp256r1`/`secp384r1`) are in `tests/data`, so invalid-curve, off-curve and coordinate≥p peers have no standard oracle in the tree. From reading the code, the decoder (`nist.rs:123-152`) is sound: `04` only, coordinates < p, the curve equation checked, cofactor 1. Random differential tests against the `p256`/`p384` crates agreed.
3. **Ed25519 verification is cofactorless** (`ed25519.rs:151-153`). It rejects pure small-order A and R but accepts A or R with a small-order component. That matches the module doc and ed25519-dalek's `verify_strict`, but differs from cofactored or batch verifiers. This is a policy choice, not a bug.

## Checked and sound
- **Montgomery:**
  - the Newton −p⁻¹ converges in six steps;
  - R² is formed by 2·64·N doublings;
  - no overflow in mul, because the buffer covers 2N+1 ≤ 13 and the sum stays below 2R², so the carry assertion at `:126` is unreachable and the result stays below 2p;
  - `reduce` handles the carry, `sub` adds p back under a mask, and the inverse uses the exponent p−2;
  - conversions in and out are correct.
- **NIST curves:**
  - doubling uses dbl-2001-b with a=−3; addition uses the standard Jacobian formula;
  - P==Q is routed to doubling, and P==−Q gives Z=0, treated as infinity;
  - infinity inputs are handled;
  - scalar multiplication always performs the add and then selects;
  - k must satisfy 1 ≤ k < n.
- **ECDSA:** r and s in [1, n−1]; strict DER (no negatives, minimal encoding, length bounded); the digest is reduced mod n; infinity is refused; x is reduced mod n.
- **Field 2^255−19:**
  - three carry passes keep every limb below 2^51, including the 19-fold wrap;
  - `sub` adds 2p before subtracting;
  - `bytes()` canonicalises;
  - the exponents p−2 and (p+3)/8 are right, with the √−1 fix-up.
- **X25519:** follows RFC 7748 (a24=121665): masked swaps, bit 255 masked, non-canonical u accepted, an all-zero shared secret refused.
- **Ed25519:** y≥p and negative zero are rejected; S≥L, S≥2L and a top-bit S are rejected (`scalar25519.rs:45-56`); hwcd-3 addition is complete for a=−1 with non-square d; the bit-serial `S::reduce` and the signing arithmetic are correct.
- **Constant time:** no secret-dependent branch or index at the source level. In the aarch64 release assembly of the Mod/nist/F/S/x25519/ed25519 core routines, the only conditional branches are loop counters and bounds or assertion panics that are never taken. x86-64 code generation was not checked.

## How this was run
In a `git archive` copy, built with `--features sign --release`:
- the in-tree Wycheproof (X25519, Ed25519, ECDSA P-256/P-384), RFC 7748/8032 and differential tests all pass;
- throwaway checks, all passing:
  - 200k random and edge-pattern Montgomery mul/add/sub/encode_raw cases per modulus, against `BigUint`;
  - 200k chained field operations;
  - 200k checks of S-canonicality near multiples of L;
  - every non-canonical Ed25519 y in [p, 2^255) with both signs, as A and as R, plus negative zero;
  - 300 random P-256/P-384 key agreements against the `p256`/`p384` crates.
