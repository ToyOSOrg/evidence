# PR #1046 round 3: T14 boots at 6ea592362 (run by the orchestrator)

`cryptocase` (judge), `cryptoctcase` and `cryptoctcurvescase`: all passed, judge exit 0
(`t14-verdicts.txt`, `t14-judge-6ea592362.log`).

| row (ours / ring, shipped build) | main 40e528614 | 6ea592362 | unasserted column |
|---|---|---|---|
| x25519/ecdh | 1.391 | 1.276 | 1.273 |
| ed25519/sign/64 | 1.365 | 1.088 | 1.099 |
| ed25519/verify/64 | 1.038 | 0.819 (pass) | 0.817 |

Main's figures are #1043's T14 judge (`pr-1043/r3`). Medians, ns: X25519 53,601 against ring 42,018;
sign 14,069 against 12,920; verify 43,491 against 53,093.

Constant time, 1,000,000 measurements a routine, max Welch |t| (threshold 4.5):
- X25519 agreement 2.30, X25519 public key 1.83 (`cryptoctcase`);
- Ed25519 key derivation and signature, 64 B, 2.58 (`cryptoctcurvescase`);
- leaky controls detected at 1258 to 1309; null controls passed at 1.25 to 2.29.

The branch was then rebased onto main 69727e365 as 3be4d6bbb; main changed nothing under
`lib/crypto` or the crypto guest programs in between (`git log 40e528614..69727e365 -- lib/crypto
tests/guest/rust-tests/src/bin/crypto_*` is empty) and the crate's tree is identical, so these
results apply to the rebased head.

- `ci-host-3be4d6bbb.log`: `cargo run -- --ci host` at the rebased head, exit 0, 102 steps.
- AMD `cryptocase` and `cryptoctcase` are staged at 23840e4ed (3be4d6bbb plus an issue record), not run.
