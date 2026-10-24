chacha-avx2 round 2: the final head 2c00ebbdc against main b48c7dd9d, and its unit tests' teeth, on each bench.
x86_64-unknown-linux-musl, static-pie, no dynamic libraries. One set serves both benches (T14, AMD bench).

Probe as round 1 (same source, probe-src.tgz; toyos-crypto incrementally in [profile.toyos] settings):
  crypto-oracles-b48c7dd9d   main (round 1's base binary, unchanged)
  crypto-oracles-2c00ebbdc   the branch head: round 1's B+bmi2 (word layout, MULX), plus
                             - an open that runs past its first batch takes one data block with the key, not seven
                               (round 1's open 1 KiB stayed at 1.41 of ring);
                             - first and tail batches of up to two blocks run one pair (round 1's 64 B rows rose);
                             - OpenSSH payloads through the same one-pass kernel.
toyos_crypto-2c00ebbdc, differential-2c00ebbdc
                             toyos-crypto's unit tests and differential tests at the head (opt-level 2, assertions on,
                             features std,sign,wpa2,rustls-provider)
toyos_crypto-2c00ebbdc+mN-*  the unit tests with one mutation each (mN-*.patch beside them); every one must FAIL.
                             All eleven fail on QEMU TCG with AVX2 (development Mac); on the bench they show that the
                             unit tests, not only differential, reach the AVX2 paths. On the T14 the dispatch keeps
                             AVX-512, so the tests that call the AVX2 kernels directly are what catch m1-m9 there,
                             and m11 (in ssh.rs's one-pass route, which the T14 never takes) should pass.

Run on each bench, CPU otherwise idle, one at a time:
  sha256sum -c SHA256SUMS
  for b in b48c7dd9d 2c00ebbdc b48c7dd9d 2c00ebbdc; do
    taskset -c 2 ./crypto-oracles-$b chacha20-poly1305/ chacha20-poly1305-openssh/ chacha20/ poly1305/ \
      >> oracle-$b.txt 2>&1; echo "exit=$?" >> oracle-$b.txt
  done
  ./toyos_crypto-2c00ebbdc chacha poly1305 aead ssh rustls > test-toyos_crypto.txt 2>&1; echo "exit=$?" >> test-toyos_crypto.txt
  ./differential-2c00ebbdc aead openssh > test-differential.txt 2>&1; echo "exit=$?" >> test-differential.txt
  for m in toyos_crypto-2c00ebbdc+m*; do
    ./$m chacha poly1305 aead ssh > test-${m#toyos_crypto-2c00ebbdc+}.txt 2>&1; echo "exit=$?" >> test-${m#toyos_crypto-2c00ebbdc+}.txt
  done
Please return every file whole.

Expected:
  oracle-*: exit=0 (every library agrees with ours at every AEAD and OpenSSH length to 1153 B before timing).
  test-toyos_crypto.txt, test-differential.txt: exit=0, "test result: ok".
  test-m*.txt: exit=101, with at least one FAILED among the chacha, aead and ssh tests; on the T14, all but m11.
The binaries embed build paths from the development Mac: publish outputs, hashes and the source, not the binaries.
