toyos-crypto library unit-test binaries for x86_64-unknown-linux-musl (static-pie), shipped
profile settings (debug assertions and overflow checks on), built with
  CC_x86_64_unknown_linux_musl=clang cargo +nightly-2026-07-22 test -p toyos-crypto \
    --features std,sign,wpa2 --profile toyos --target x86_64-unknown-linux-musl --lib --no-run
after musl-devdeps.patch (ring, rcgen and rustls's ring backend removed, as #1036's binaries).

  toyos_crypto-tests-2e63ea523   the landing commit (divsteps inversion), on #1036's head 7c860ab7b
  toyos_crypto-probe-a8b67bb45   2e63ea523 + probe (never lands): Fermat forms beside divsteps

Run on each bench's Linux (T14 and AMD), CPU otherwise idle:
  ./toyos_crypto-tests-2e63ea523 test_arithmetic:: nist:: ecc:: divsteps:: --nocapture
  ./toyos_crypto-probe-a8b67bb45 probe_ --ignored --nocapture --test-threads=1

Expected: the tests pass and print "p-256 field path: the BMI2/ADX kernels" (both benches have
BMI2/ADX). The probe prints, per bench:
  field/invert-{fermat,divsteps}, order/invert-{fermat,divsteps}, p384-{field,order}/invert-*,
  order/invert-divsteps-early (variable-time early exit, decides whether verify should take it),
  f25519/invert-{fermat,divsteps} (whether X25519/Ed25519 should follow), and mul/*, ecdh/whole,
  verify/whole, comparable with #1036's p2-binary probe rows (those were --release builds).
