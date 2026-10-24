p256 round 2: toyos-crypto's P-256 at branch p256-speed cec7093d1 against main 2a5b446b0, on each bench.
x86_64-unknown-linux-musl, static-pie. One set serves both benches. Same probe and parts hooks as round 1;
crypto-oracles-2a5b446b0 is round 1's binary, unchanged (same hash).
  crypto-oracles-cec7093d1   round 1 (4a4cf1f2d) plus: multiplication and squaring reduce by mulx with p3 in
                             a register again (multiplication now takes b in registers and reads a from
                             memory), and the 16-entry table reads use AVX2.
  toyos_crypto-cec7093d1, differential-cec7093d1: the unit and differential tests at the branch.

Run on each bench, CPU otherwise idle, one at a time (about a minute in all):
  sha256sum -c SHA256SUMS
  for b in 2a5b446b0 cec7093d1 2a5b446b0 cec7093d1; do
    taskset -c 2 ./crypto-oracles-$b p-256 >> oracle-$b.txt 2>&1; echo "exit=$?" >> oracle-$b.txt
  done
  ./toyos_crypto-cec7093d1 --nocapture nist:: montgomery:: test_arithmetic::nist test_arithmetic::public arch:: \
    > test-toyos_crypto.txt 2>&1; echo "exit=$?" >> test-toyos_crypto.txt
  ./differential-cec7093d1 p256 > test-differential.txt 2>&1; echo "exit=$?" >> test-differential.txt
Please return every file whole. Each oracle file's "oracles: build=... toyos-crypto=<rev>" line names its build.

Expected:
  oracle-*: exit=0; rows as round 1 (p-256/ecdh, ecdsa-p-256-sha-256/verify/64, p-256-parts/*, clock lines).
  test-toyos_crypto.txt: exit=0, "test result: ok" (21 tests, among them the AVX2 table read against the
    portable one), with "p-256 field path:" and "p-256 points in" naming toyos_crypto::arch::x86_64::P256Kernels.
  test-differential.txt: exit=0, "test result: ok".
The binaries embed build paths from the development Mac: publish outputs, hashes and the source, not the binaries.
