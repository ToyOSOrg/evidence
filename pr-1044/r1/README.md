# ToyOS #1044, round 1

Revision: ToyOS 10f6137a6 (tree identical to the run; ae4c4131b only fills
the PR number into the issue record). Host: development Mac (Apple M4 Pro).

- `ci-host.log`: `cargo run -- --ci host` on the working tree of 10f6137a6,
  exit 0 (last line). The `FAILED` lines inside are other components'
  negative controls, which the harness expects to fail.
- `controls/`: negative controls for each verification rule. `run.sh`
  applies each `m*.patch` to `lib/crypto/src/ed25519.rs`, builds, runs
  `cargo test --features portable,sign --test ed25519_verdicts`, and
  restores the file. `summary.txt` is its output: every mutation builds
  (exit 0) and fails the tests (exit 101); per-mutation logs beside it.
  - m1 drops the small-order key refusal; m2 the small-order R refusal;
    m3 the y < p check; m4 the negative-zero check; m5 reduces S instead
    of refusing S >= L; m6 replaces the cofactorless comparison with the
    cofactored one (8([S]B - [k]A) against 8R).
- `classify/`: a scratch black-box classifier (curve25519-dalek 4.1.3,
  ed25519-dalek 2.2.0, ring 0.17.14 from crates.io), not ToyOS code.
  `speccheck.txt` classifies the 12 "Taming the many EdDSAs" cases (key and
  R canonicality and order, S < L, both equations with k over the bytes
  as sent and over re-encoded points) with verify_strict's and ring's
  verdicts. `probe.txt` gives ring's and dalek's verdicts on a constructed
  cofactorless-valid signature under each of the 14 small-order encodings,
  and dalek's decoding of the 38 encodings with y >= p. The committed
  tests' expected verdicts were checked against these outputs.
