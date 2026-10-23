# PR #1046 round 4: AMD bench (Ryzen 7 4800U, signature 0x860f01, microcode 0x860010d) at 23840e4ed

Run by the orchestrator. `cryptocase` (judge, `crypto_instrument`) and `cryptoctcase`
(`crypto_secret_timing`): both passed, judge exit 0 (`amd-verdicts.txt`, `amd-judge-23840e4ed.log`).

| row (ours / ring, shipped build) | 23840e4ed | unasserted column |
|---|---|---|
| x25519/ecdh | 1.225 | 1.237 |
| ed25519/sign/64 | 1.116 | 1.120 |
| ed25519/verify/64 | 0.743 (pass) | 0.751 |

Medians, ns: X25519 49,745 against ring 40,642; sign 13,209 against 11,825; verify 41,625
against 55,946. No AMD judge of main's 25519 rows since #932's first measurement exists to
compare with.

Constant time, 1,000,000 measurements a routine (threshold 4.5): X25519 agreement max |t| 3.32,
public key 2.65; null controls 1.82 and 1.04; leaky controls 210.6 and 194.7.

`cryptoctcurvescase` (Ed25519) is staged at 23840e4ed and not yet run. 23840e4ed differs from
the measured 6ea592362 only by the rebase (crate tree identical) and an issue record.
