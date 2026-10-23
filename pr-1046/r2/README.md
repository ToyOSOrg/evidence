# PR #1046 round 2: the Linux runs of 6ea592362 on the T14 (i5-1135G7) and the AMD bench (Ryzen 7 4800U)

Binaries and recipe: `README.txt` (round 1's `linux/`, checksums there). Run by the orchestrator.

- **Unit tests at 6ea592362**, ADX kernels admitted on both ("f25519 path: the BMI2/ADX kernels"):
  62 passed, 1 failed, exit 101, on both. The one failure is
  `mlkem::tests::nist_expanded_keygen_secret_matches`, `Os { code: 2, NotFound }`: it reads
  `tests/acvp/` relative to the build tree's `CARGO_MANIFEST_DIR`, absent on a bench. Every 25519
  test passed, among them `x25519::tests::public_keys_by_the_comb_are_the_ladders`,
  `ed25519::tests::the_comb_agrees_with_straus` and
  `radix64::tests::words_up_to_2_256_match_integers_and_the_portable_path`. The x25519 panics in
  the logs belong to the m1 and m3 sections.
- **Mutants**: m1, m2, m3 each exit 101 on both benches; m2 only by the words test.
- **Probe, main 40e528614 (twice) against the branch**, medians (ns):

| row | T14 main | T14 branch | ratio | AMD main | AMD branch | ratio |
|---|---|---|---|---|---|---|
| x25519/agree | 36724 | 35947 | 0.979 | 39793 | 37176 | 0.934 |
| x25519/public | 14955 | 11695 | 0.782 | 16023 | 12303 | 0.768 |
| ed25519/sign/64 | 16350 | 13030 | 0.797 | 17128 | 13518 | 0.789 |
| ed25519/verify/64 | 50139 | 39837 | 0.795 | 51623 | 41876 | 0.811 |
| f25519/invert | 3558 | 2811 | 0.790 | 3485 | 3233 | 0.928 |

  The second main run agrees with the first within 1%.
- **probe25519-1** (field forms): ladder five limbs 36.79 µs, four words ADX 35.07 µs on the T14;
  39.98 and 35.87 on the AMD. The dual-chain square changes nothing on either (square chains
  97.8 vs 98.1 ns on the T14).
