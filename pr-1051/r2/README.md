# pr-1051 r2: controls n2 and n3 with every test target

r1's control command stopped at the first failing target (the lib unit tests), so r1 measured nothing
about the integration vectors under n2 and n3. This round reruns both at 76bf8b418, applied with `git apply`,
run and reverted with `git apply -R` in the same command:
`cd lib/crypto && cargo test --no-fail-fast --features portable -- mlkem keccak`.

- n2 (a lane absorbed at a position ≡ 4 mod 8): exit 101. Only `keccak::tests::splits_do_not_change_the_output`
  fails. NIST ACVP, Wycheproof, the RustCrypto differential, the fuzz and the lib's NIST keygen pass:
  no ML-KEM absorb sits at such a position. The patch is regenerated for the head's `is_multiple_of`.
- n3 (the inverse NTT's sum left unreduced): exit 101. The bounds test fails, and so do the differential,
  both fuzz targets, ACVP and Wycheproof (i16 overflow). r1's statement that the vectors pass n3 was
  wrong. The bounds test is still the only one at the edges of the stated input ranges.

The head after this round is 1d3d91b4e (a comment and a test range, no code change), so these
results stand for it.
