toyos-crypto's library unit-test binaries for x86_64-unknown-linux-musl (static-pie), at commit
7a1101024 (ChaCha20 short messages in one register set, rows from the key), and two mutants.

Built in a scratch worktree of 7a1101024 with:
  CC_x86_64_unknown_linux_musl=clang cargo +nightly-2026-07-22 test -p toyos-crypto \
    --features std,sign,wpa2 --release --target x86_64-unknown-linux-musl --lib --no-run
after removing three dev-dependencies (musl-devdeps.patch, the same as #1014's ADX run): ring, rcgen
and rustls's ring backend, which need C headers for Linux musl. The library source is 7a1101024's.

  toyos_crypto-tests-7a1101024        the commit
  toyos_crypto-tests-m1-lane-keys     m1-lane-keys.patch: AVX2/AVX-512 pair rows take a pair's two keys swapped
  toyos_crypto-tests-m2-quad-order    m2-quad-order.patch: the AVX-512 quad writes blocks 1 and 2 swapped

Run each on the bench's Linux:
  ./<binary> chacha:: aead:: ssh:: arch:: --nocapture
`arch::...features_match_host_detection` prints which paths the CPU admits (avx2, avx512vl).
Expected: the commit passes on every AVX2 machine. m1 fails `lanes_match_one_block_at_a_time` on
every AVX2 machine. m2 fails it, and `dispatched_streams_preserve_counter_carries_and_batch_tails`,
only where avx512vl is admitted (the T14), and passes on the AMD bench, which has no AVX-512.
