p256 round 3: branch p256-speed 9dc8a7771 against round 2's cec7093d1 and main 2a5b446b0, in the same runs.
x86_64-unknown-linux-musl, static-pie. One set serves both benches. Probe and parts hooks as rounds 1 and 2;
crypto-oracles-2a5b446b0 and crypto-oracles-cec7093d1 are the earlier rounds' binaries (same hashes).
  crypto-oracles-9dc8a7771   round 2 with multiplication back in round 1's operand layout (a in registers, b0 in
                             RDX, b's other words one per row), squaring's mulx reduction and the AVX2 lookups kept.
  toyos_crypto-9dc8a7771, differential-9dc8a7771: the unit and differential tests at the branch.

Run on each bench, CPU otherwise idle, one at a time (about a minute and a half in all):
  sha256sum -c SHA256SUMS
  for b in 2a5b446b0 cec7093d1 9dc8a7771 2a5b446b0 cec7093d1 9dc8a7771; do
    taskset -c 2 ./crypto-oracles-$b p-256 >> oracle-$b.txt 2>&1; echo "exit=$?" >> oracle-$b.txt
  done
  ./toyos_crypto-9dc8a7771 --nocapture nist:: montgomery:: test_arithmetic::nist test_arithmetic::public arch:: \
    > test-toyos_crypto.txt 2>&1; echo "exit=$?" >> test-toyos_crypto.txt
  ./differential-9dc8a7771 p256 > test-differential.txt 2>&1; echo "exit=$?" >> test-differential.txt
Please return every file whole. Each oracle file's "toyos-crypto=<rev>" line names its build.

Expected:
  oracle-*: exit=0; rows as before. The decision is 9dc8a7771 against cec7093d1 within these runs: AMD doubling,
    additions and verify should return to round 1's ratio to main, the T14 should hold round 2's.
  test-toyos_crypto.txt: exit=0, "test result: ok" (21 tests), naming toyos_crypto::arch::x86_64::P256Kernels.
  test-differential.txt: exit=0, "test result: ok".
The binaries embed build paths from the development Mac: publish outputs, hashes and the source, not the binaries.
