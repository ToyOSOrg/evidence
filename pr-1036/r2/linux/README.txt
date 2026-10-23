Round 2 of the P-256 kernels: the field operations inline into the point formulas (the round-1
probe showed an out-of-line `Residue::mul` call costing about as much as the kernel). Built as
round 1's (musl-devdeps.patch; `cargo +nightly-2026-07-22 test -p toyos-crypto --features
std,sign,wpa2 --release --target x86_64-unknown-linux-musl --lib --no-run`).

  toyos_crypto-tests-inline-cios-7c860ab7b       5f9bca079 (CIOS multiplication) + inlining
  toyos_crypto-tests-inline-separated-d719a6435  97eb589dd (whole product, then reduction) + inlining
  toyos_crypto-probe-inline-cios                 7c860ab7b + probe.patch (round 1's probe)
  toyos_crypto-probe-inline-separated            d719a6435 + probe.patch

Run on each bench's Linux, CPU otherwise idle:
  ./toyos_crypto-tests-inline-cios-7c860ab7b test_arithmetic:: nist:: ecc:: --nocapture
  ./toyos_crypto-tests-inline-separated-d719a6435 test_arithmetic:: nist:: ecc:: --nocapture
  ./toyos_crypto-probe-inline-cios probe_timings --ignored --nocapture --test-threads=1
  ./toyos_crypto-probe-inline-separated probe_timings --ignored --nocapture --test-threads=1

Expected: both test binaries pass with "p-256 field path: the BMI2/ADX kernels". The probes print
the same parts as round 1; `point/double`, `field/invert`, `mul/variable`, `ecdh/whole` and
`verify/whole` against round 1's decide the form.
