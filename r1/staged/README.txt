p256 round 1: toyos-crypto's P-256 at branch p256-speed 4a4cf1f2d against main 2a5b446b0, on each bench.
x86_64-unknown-linux-musl, static-pie, no dynamic libraries. One set serves both benches (T14, AMD bench).

Probe: crypto-oracles r2's (ring 0.17.14, OpenSSL 3.5.5, AWS-LC 5.11.0; toyos-crypto in [profile.toyos]'s
settings, incremental), with parts.rs replaced by P-256 part rows: each a dependent chain of one operation
through a scratch-only hook appended to the crate's nist.rs (probe-hooks/{base,head}.rs; never lands).
  crypto-oracles-2a5b446b0   main
  crypto-oracles-4a4cf1f2d   the branch: one CPUID check per agreement / public key / verification, field
                             kernels with operands in registers, the table by doubling, half-delta
                             divsteps, and verification's s inverted in variable time.
  toyos_crypto-4a4cf1f2d, differential-4a4cf1f2d
                             the crate's unit and differential tests at the branch (opt-level 2, assertions
                             on, features std,sign,wpa2,rustls-provider). Only tests that read no data file
                             are named below: the binaries look for data at development-Mac paths.

Run on each bench, CPU otherwise idle, one at a time (about a minute in all):
  sha256sum -c SHA256SUMS
  for b in 2a5b446b0 4a4cf1f2d 2a5b446b0 4a4cf1f2d; do
    taskset -c 2 ./crypto-oracles-$b p-256 >> oracle-$b.txt 2>&1; echo "exit=$?" >> oracle-$b.txt
  done
  ./toyos_crypto-4a4cf1f2d --nocapture nist:: montgomery:: test_arithmetic::nist test_arithmetic::public arch:: \
    > test-toyos_crypto.txt 2>&1; echo "exit=$?" >> test-toyos_crypto.txt
  ./differential-4a4cf1f2d p256 > test-differential.txt 2>&1; echo "exit=$?" >> test-differential.txt
Please return every file whole.

Expected:
  oracle-*: exit=0. Before timing, every library agrees with ours on P-256 agreement (fixed and ephemeral keys)
    and verification. Rows: p-256/ecdh and ecdsa-p-256-sha-256/verify/64 beside ring, OpenSSL and AWS-LC, then
    p-256-parts/* (ours alone, ns per operation), and the clock line (ns per cycle) at start and end.
  test-toyos_crypto.txt: exit=0, "test result: ok", and the lines "p-256 field path:" and "p-256 points in"
    naming toyos_crypto::arch::x86_64::P256Kernels (both benches have BMI2 and ADX).
  test-differential.txt: exit=0, "test result: ok" (seeded P-256 against RustCrypto and ring).
The binaries embed build paths from the development Mac: publish outputs, hashes and the source, not the binaries.
