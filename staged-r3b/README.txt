poly1305-inline round 1b: toyos-crypto's unit tests at 6291dc4ad (adds
arch::x86_64::poly1305::tests::the_avx2_blocks_match_the_portable_rounds), x86_64-unknown-linux-musl, static-pie,
opt-level 2 with debug assertions. One set for both benches.

  toyos_crypto-6291dc4ad                     the tests                         expected: exit=0, "test result: ok"
  toyos_crypto-6291dc4ad+product-wrong-term  one wrong limb product in the
                                             AVX2 kernel (negative control)    expected: exit=101, the new test FAILED

Run on each bench:
  sha256sum -c SHA256SUMS
  ./toyos_crypto-6291dc4ad poly1305 aead openssh > test-toyos_crypto.txt 2>&1; echo "exit=$?" >> test-toyos_crypto.txt
  ./toyos_crypto-6291dc4ad+product-wrong-term poly1305 aead openssh > test-toyos_crypto-wrong.txt 2>&1; echo "exit=$?" >> test-toyos_crypto-wrong.txt
Please return both files whole.
