crypto-25519 round 1: Linux binaries for the T14 and the AMD bench (x86_64-unknown-linux-musl,
static-pie, shipped-profile settings: opt-level 2, debug assertions and overflow checks on).

Built with nightly-2026-07-22 (the toyos toolchain's base) from standalone exports of lib/crypto
(standalone.sh: `git archive <commit> lib/crypto`, its own [workspace] with [profile.toyos]'s
settings, ring/rcgen/rustls-ring dev-dependencies removed, as #1036/#1043's binaries), with
  cargo +nightly-2026-07-22 test --features std,sign,wpa2 --profile toyos --target x86_64-unknown-linux-musl --lib --no-run

  toyos_crypto-tests-6ea592362         the branch's unit tests (four-word field, BMI2/ADX kernels)
  toyos_crypto-tests-6ea592362-m{1,2,3} the same with mN.patch applied to the kernels (controls)
  toyos_crypto-probe-base-40e528614    main + probe25519.rs (never lands): per-operation timings
  toyos_crypto-probe-head-6ea592362    the branch + the same probe
  probe25519-1                         field-form probe (proto-src.tgz): 5x51 vs 4x64 portable vs 4x64 ADX,
                                       and a square variant with doubling and diagonals on two flag chains

Run on each bench's Linux, CPU otherwise idle, one at a time:
  ./toyos_crypto-tests-6ea592362 --skip the_register_saving_sha256_block --nocapture 2>&1 | tail -40
  for m in m1 m2 m3; do ./toyos_crypto-tests-6ea592362-$m field25519:: x25519:: ed25519::; echo "$m exit=$?"; done
  ./toyos_crypto-probe-base-40e528614 probe_25519 --ignored --nocapture --test-threads=1
  ./toyos_crypto-probe-head-6ea592362 probe_25519 --ignored --nocapture --test-threads=1
  ./toyos_crypto-probe-base-40e528614 probe_25519 --ignored --nocapture --test-threads=1   (again, for drift)
  ./probe25519-1

Expected:
  - tests: all pass, and the output says "f25519 path: the BMI2/ADX kernels" (both benches have
    BMI2/ADX). (`--skip` only if the CPU lacks SHA-NI; both benches have it, so it may be dropped.)
  - m1 (a high half on the wrong flag chain), m2 (the second fold's 38 dropped from mul), m3 (square's
    doubling loses its top carry): each fails, at least in
    field25519::radix64::tests::words_up_to_2_256_match_integers_and_the_portable_path, exit 101.
  - probe-base vs probe-head: x25519/agree, x25519/public, ed25519/sign/64, ed25519/verify/64,
    f25519/invert, mul and square chains. Decides whether the four-word field is the method.
  - probe25519-1: f64adx/ladder against f51/ladder, f64adxdual against f64adx; prints "kernels match
    the portable words".
