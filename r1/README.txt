chacha-avx2 round 1: which AVX2 ChaCha20-Poly1305 shape the benches reward, and whether the T14's AVX-512 path holds.
x86_64-unknown-linux-musl, static-pie, no dynamic libraries. One set of binaries serves both benches (T14, AMD bench).

The probe is poly1305-inline's crypto-oracles (ring 0.17.14, OpenSSL 3.5.5, AWS-LC 5.11.0, same pins and sampler), with
three additions (src/parts.rs in probe-src.tgz):
  - rows chacha20/xor/{1024,16384,65536} and poly1305/{1024,16384,65536}: each half of the AEAD alone, ours beside
    OpenSSL (EVP ChaCha20, EVP_MAC Poly1305) and AWS-LC (CRYPTO_chacha_20, CRYPTO_poly1305_*); ring has neither;
  - "oracles: clock X ns per cycle" at start and end: 2^28 dependent adds, best of five, to read ns as core cycles.
toyos-crypto is built incrementally in [profile.toyos]'s settings (opt-level 2, 256 CGUs, debug assertions on).

  crypto-oracles-r1-base        main b48c7dd9d: 6 blocks per AVX2 batch, open in two passes, block 0 separate
  crypto-oracles-r1-A           the branch at fe9a2f22b (work-r1-A.diff): AVX2 8 blocks as four pairs of rows; one-pass stitched
                                open; Poly1305 in all 10 double rounds; block 0 in the first batch; stitched tails;
                                VPSHUFB for the 16-bit rotation
  crypto-oracles-r1-A+bmi2      A with BMI2 on the stitched code (MULX for the scalar Poly1305)    (v-bmi2.patch)
  crypto-oracles-r1-A+noopaque  A, the 16-bit rotation left to LLVM (VPSHUFLW+VPSHUFHW)          (v-noopaque.patch)
  crypto-oracles-r1-B           A with the AVX2 bulk in the word-per-register layout (8 blocks, no
                                diagonal shuffles), for xor and the stitched batches             (v-word.patch)
  crypto-oracles-r1-B+bmi2      B with BMI2 as above
  toyos_crypto-r1-A, differential-r1-A
                                toyos-crypto's unit tests and its differential tests (against ring and RustCrypto) at
                                A, opt-level 2, debug assertions on. The unit tests include two new ones that call the
                                AVX2 kernels directly, so they run on the T14's AVX2 as well as the AMD's.

On the T14 (AVX-512VL) the dispatch keeps today's AVX-512 paths for seal, open and xor in every binary; its rows
should not move. A and B differ on the AMD only.

Each oracle binary first holds every library to toyos-crypto's answer at every AEAD length 0..1153 B (AAD 0, 5, 17)
and on every row's inputs, including 16 and 64 KiB (a mismatch exits 101 before timing), then times the rows named.
All of them pass that check on QEMU TCG with AVX2 and no AVX-512 (development Mac), whose timing means nothing.

Run on each bench, CPU otherwise idle, one at a time (about 40 s per oracle run):
  sha256sum -c SHA256SUMS
  for b in base A B A+bmi2 B+bmi2 A+noopaque base A; do
    taskset -c 2 ./crypto-oracles-r1-$b chacha20-poly1305/ chacha20-poly1305-openssh/ chacha20/ poly1305/ \
      >> oracle-$b.txt 2>&1; echo "exit=$?" >> oracle-$b.txt
  done
  (base and A run twice, appended to the same file, for drift between runs)
  ./toyos_crypto-r1-A chacha poly1305 aead > test-toyos_crypto.txt 2>&1; echo "exit=$?" >> test-toyos_crypto.txt
  ./differential-r1-A aead openssh > test-differential.txt 2>&1; echo "exit=$?" >> test-differential.txt
Please return every file whole, and `uname -r` and `lscpu | head -20` once per bench.

Expected:
  oracle-*: exit=0; "oracles: isa=..." and two "oracles: clock" lines; rows
    "oracle: <row> | toyos ns | ring ns | openssl ns | aws-lc ns | spread | toyos/ring | toyos/openssl | toyos/aws-lc"
    for chacha20-poly1305/{key,seal,open,reject}/{0,64,1024,16384,65536}, the OpenSSH rows,
    chacha20/xor/{1024,16384,65536} and poly1305/{1024,16384,65536}.
  test-*.txt: exit=0 and "test result: ok"; test-toyos_crypto.txt names
    arch::x86_64::chacha::tests::the_avx2_stream_matches_one_block_at_a_time,
    arch::x86_64::chacha::tests::the_avx2_aead_pass_matches_rfc_8439_composed and
    aead::tests::a_forged_chacha_record_opens_to_zeros, each "ok".
  On the AMD, A's reject rows rise toward ring's: a one-pass open decrypts before the tag is known (approved C1).

The binaries embed build paths from the development Mac (debug info, OpenSSL's flags string): do not publish them;
publish outputs, hashes and the source.
