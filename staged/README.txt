poly1305-inline round 1: the AVX2 Poly1305 kernel without the core iterator, on each bench's Linux.
x86_64-unknown-linux-musl, static-pie, no dynamic libraries. One set of binaries serves both benches (T14, AMD bench).

The probe is crypto-oracles round 2's (ring 0.17.14, OpenSSL 3.5.5, AWS-LC 5.11.0, same pins, same sampler), with
toyos-crypto taken from the named ToyOS revision and built in [profile.toyos]'s settings: opt-level 2, 256 codegen
units, debug assertions and overflow checks on; "inc" incrementally (as the image builds it), "noninc" not.
  4dc75f542  main, the measured base: Multiplier::product sums with into_iter().reduce
  c9a3f65e1  the fix (branch wt/poly1305-inline): explicit adds

  crypto-oracles-shipped-noninc-4dc75f542                   control: base, non-incremental (r1's 7-13x shape)
  crypto-oracles-shipped-inc-4dc75f542                      base, incremental (what ships today)
  crypto-oracles-shipped-noninc-c9a3f65e1                   fix, non-incremental
  crypto-oracles-shipped-inc-c9a3f65e1                      fix, incremental
  crypto-oracles-shipped-noninc-c9a3f65e1+product-outlined  fix with product forced #[inline(never)]: what the
                                                            kernel would cost if LLVM ever outlined it again
  toyos_crypto-c9a3f65e1, differential-c9a3f65e1            toyos-crypto's own unit tests and its differential
                                                            tests (against ring and RustCrypto), opt-level 2,
                                                            debug assertions on
  *+product-wrong-term                                      the same tests with one wrong limb product in the
                                                            AVX2 kernel (negative control: must FAIL)

Each oracle binary first holds every library to toyos-crypto's answer at every AEAD length 0..1153 B and on every
row's inputs (a mismatch exits 101 before timing), then times only the rows the arguments name.

Run on each bench, CPU otherwise idle, one at a time (about 15 s per oracle run):
  sha256sum -c SHA256SUMS
  for b in shipped-noninc-4dc75f542 shipped-inc-4dc75f542 shipped-noninc-c9a3f65e1 shipped-inc-c9a3f65e1 \
           shipped-noninc-c9a3f65e1+product-outlined shipped-noninc-c9a3f65e1; do
    taskset -c 2 ./crypto-oracles-$b chacha20-poly1305/ > oracle-$b.txt 2>&1; echo "exit=$?" >> oracle-$b.txt
  done
  (the last line repeats the fixed non-incremental binary for drift between runs)
  for t in toyos_crypto differential; do
    ./$t-c9a3f65e1 poly1305 aead openssh > test-$t.txt 2>&1; echo "exit=$?" >> test-$t.txt
    ./$t-c9a3f65e1+product-wrong-term poly1305 aead openssh > test-$t-wrong.txt 2>&1; echo "exit=$?" >> test-$t-wrong.txt
  done
  grep -o 'avx2' /proc/cpuinfo | head -1 >> test-toyos_crypto.txt
Please return every file whole, and `uname -r` and `lscpu | head -20` once per bench.

Expected:
  oracle-*: exit=0; lines "oracles: build=<profile> toyos-crypto=<rev>", the agreement lines, and the rows
    "oracle: chacha20-poly1305/{seal,open,reject}/{0,64,1024,16384,65536} | toyos ns | ring ns | ... | toyos/ring | ..."
    The fix should put noninc and inc together (both near today's shipped inc figure), and the base noninc control
    should reproduce r1's 7-13x toyos/ring at 1024..65536.
  test-toyos_crypto.txt, test-differential.txt: exit=0, "test result: ok".
  test-*-wrong.txt: exit=101 with FAILED Poly1305/AEAD cases (proves the tests reach the AVX2 kernel on the bench).
    Expected to fail: poly1305::tests::matches_integers_on_seeded_and_extreme_inputs; the differential AEAD and
    OpenSSH cases.

The binaries embed build paths from the development Mac (debug info, OpenSSL's flags string): do not publish them;
publish outputs, hashes and the source.
