# Exploratory: toyos-crypto against ring on the development Mac (not a verdict)

For ToyOS PR #913. Source: toyos-crypto `2b3f92c0dc6a7b77aaeff57d1291cab8dba78494`,
exported with `git archive` into `<scratch>/src-2b3f92c`. That repository has no remote yet; its publication is a decision #913 asks for.
Host: Apple M4 Pro, macOS, rustc 1.98.1 (48a229cea 2026-09-01), stock ring 0.17.14.
The host was heavily shared while it ran: load average 45–59 on 14 cores (`uptime`
straight after). Frequency, affinity and other tenants were not controlled. These
numbers give an order of magnitude only. They are not cycle counts, and they are not
a parity verdict. Parity verdicts come only from metal.

`bench/` is the harness. It interleaves nine samples per operation, ours then ring,
after a warmup, and reports the median ns/op of each. Ed25519 signatures were checked
equal to ring's before timing. The RSA input is case 1 of Wycheproof's
`rsa_signature_2048_sha256_test.json`, a valid signature. Key setup is inside each
timed operation for both crates; ring generates its ephemeral keys from `SystemRandom`.

| Check | Command | Exit | Log |
|---|---|---|---|
| Build | `CARGO_TARGET_DIR=<scratch>/bench/target cargo build --release` in `bench/` | 0 | `build.log` |
| Runs 1–3 | `./bench/target/release/asym-compare <src>/tests/data/rsa_signature_2048_sha256_test.json` | 0, 0, 0 | `asym-run{1,2,3}.csv` |
| Crate host tests at the ToyOS host opt level | `CARGO_PROFILE_DEV_OPT_LEVEL=2 cargo test --locked --features std,sign,wpa2,rustls-provider` in `<src>` | 0 | `crate-host-tests.log` (48 tests; 1:04 wall including a cold build of 100 crates) |

Across the three runs, ours/ring ranged:

| Operation | ours/ring |
|---|---|
| SHA-256, 16 KiB | 6.9–25.9 |
| SHA-512, 16 KiB | 1.8–6.2 |
| SHA-256, 64 B | 5.0–21.4 |
| HKDF-SHA256 extract+expand 32 B | 1.9–9.8 |
| X25519 keygen + agree | 5.3–6.2 |
| P-256 keygen + agree | 28.9–55.0 |
| Ed25519 sign, 256 B | 49.7–189.6 |
| Ed25519 verify, 256 B | 29.6–47.4 |
| ECDSA P-256 verify, 256 B | 13.8–86.3 |
| RSA-2048 PKCS#1 SHA-256 verify | 20.3–90.1 |

Even the smallest ratio in each row is large enough that the gap is not noise. The
spread within a row is noise from the shared host.
