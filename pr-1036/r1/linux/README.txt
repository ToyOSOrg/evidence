toyos-crypto's library unit-test binaries for x86_64-unknown-linux-musl (static-pie), built with
  CC_x86_64_unknown_linux_musl=clang cargo +nightly-2026-07-22 test -p toyos-crypto \
    --features std,sign,wpa2[,portable] --release --target x86_64-unknown-linux-musl --lib --no-run
after musl-devdeps.patch (ring, rcgen and rustls's ring backend removed: they need C headers for
Linux musl). The library source is as named.

  toyos_crypto-tests-5f9bca079           the commit: P-256 field multiplication and squaring on
                                         BMI2 and ADX
  toyos_crypto-tests-m1-reduction-carry  m1-reduction-carry.patch: one `adc` of the multiplication's
                                         first reduction step made an `add`, dropping a carry
  toyos_crypto-tests-m2-square-carry     m2-square-carry.patch: one `adc` of the squaring's last
                                         reduction step made an `add`
  toyos_crypto-probe-dispatch            probe 7699b58d1 (5f9bca079 plus timing tests and a
                                         separated-product kernel that never land), the CPU's paths
  toyos_crypto-probe-portable            the same probe built with `portable`: every path portable
  toyos_crypto-probe-separated           the same probe with probe-separated.patch: field
                                         multiplication by the whole product first, then the
                                         squaring kernel's reduction, instead of CIOS

Run on each bench's Linux (T14 and AMD bench), CPU otherwise idle:
  ./toyos_crypto-tests-5f9bca079 test_arithmetic:: nist:: ecc:: arch:: rsa:: --nocapture
  ./toyos_crypto-tests-m1-reduction-carry test_arithmetic:: nist:: ecc:: --nocapture
  ./toyos_crypto-tests-m2-square-carry test_arithmetic:: nist:: ecc:: --nocapture
  ./toyos_crypto-probe-dispatch probe --ignored --nocapture --test-threads=1
  ./toyos_crypto-probe-portable probe --ignored --nocapture --test-threads=1
  ./toyos_crypto-probe-separated probe --ignored --nocapture --test-threads=1

Expected:
- the commit passes; `nist_fields_and_orders_match_integers` prints "p-256 field path: the
  BMI2/ADX kernels" (both benches have BMI2 and ADX).
- m1 and m2 each fail `nist_fields_and_orders_match_integers` (and curve tests) on both benches.
- each probe prints its path first ("bmi2-adx" for dispatch, "portable" for portable), then
  `probe <part> median=… min=…` lines for P-256 and RSA parts. Exploratory, not judge rows. The
  three builds' `ecdh/whole`, `verify/whole`, `point/double` and `field/*-chain` lines decide
  between CIOS and the separated product for multiplication.
