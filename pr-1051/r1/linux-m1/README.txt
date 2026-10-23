mlkem round 1: toyos-crypto's ML-KEM-768 before and after the branch wt/mlkem-ct-speed, beside OpenSSL
and AWS-LC (ring has no ML-KEM), on each bench's Linux. x86_64-unknown-linux-musl, static-pie, no
dynamic libraries. The probe, its libraries and their pins are crypto-oracles round 2's unchanged
(ring 0.17.14, OpenSSL 3.5.5, AWS-LC 5.11.0, built from source); only toyos-crypto differs.

  crypto-oracles-shipped-base-a183718ea      toyos-crypto at main a183718ea, [profile.toyos]'s settings
                                             (opt-level 2, cgu 256, debug assertions and overflow checks
                                             on, incremental), the references in release settings
  crypto-oracles-shipped-mlkem-76bf8b418     the same at the branch head 76bf8b418
  crypto-oracles-unasserted-mlkem-76bf8b418  the branch head, toyos-crypto's assertions and overflow
                                             checks off
  probe-src.tgz                              the probe's source, Cargo.lock and build script (scratch)

Before timing, each binary holds OpenSSL and AWS-LC to toyos-crypto's ML-KEM by encapsulating to each
other both ways; a mismatch panics (exit 101) before any timing.

Run on each bench's Linux (T14 and AMD bench), CPU otherwise idle, one at a time, a few seconds each:
  sha256sum -c SHA256SUMS
  taskset -c 2 ./crypto-oracles-shipped-base-a183718ea     ml-kem > base.txt         2>&1; echo "exit=$?" >> base.txt
  taskset -c 2 ./crypto-oracles-shipped-mlkem-76bf8b418    ml-kem > mlkem-1.txt      2>&1; echo "exit=$?" >> mlkem-1.txt
  taskset -c 2 ./crypto-oracles-unasserted-mlkem-76bf8b418 ml-kem > unasserted.txt   2>&1; echo "exit=$?" >> unasserted.txt
  taskset -c 2 ./crypto-oracles-shipped-mlkem-76bf8b418    ml-kem > mlkem-2.txt      2>&1; echo "exit=$?" >> mlkem-2.txt
  (return all four files whole, and `uname -r` and `lscpu | head -20` once)

Expected: exit=0, a first line naming toyos-crypto=<the revision in the file name>, and the three rows ml-kem-768/keygen, ml-kem-768/encapsulate and
ml-kem-768/keygen+decapsulate as `oracle: <row> | toyos ns | ring ns | openssl ns | aws-lc ns | ...`
lines (ring "-"), with the per-sample `samples:` lines before them, as in round 2's README.
