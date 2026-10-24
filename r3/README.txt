chacha-avx2 round 3 (optional, AMD bench only, about 2 minutes): why seal at 1 KiB reads 1.25 of ring at the head when
round 1's B+bmi2 read 1.17. Same probe as rounds 1 and 2 (probe-src.tgz of r2).

  crypto-oracles-035c36d30                     the head (rebased on main 3a19907ab; ChaCha code as 2c00ebbdc's, with
                                               the refusal through secret::wipe)
  crypto-oracles-035c36d30+v-tail-two-pairs    a stitched tail of up to two blocks runs two pairs, as round 1 did
  crypto-oracles-035c36d30+v-rows-over-256     a first or tail batch of eight blocks runs four pairs of rows, as
                                               round 1's first batch did

Run on the AMD bench, CPU otherwise idle:
  sha256sum -c SHA256SUMS
  for b in 035c36d30 035c36d30+v-tail-two-pairs 035c36d30+v-rows-over-256 035c36d30; do
    taskset -c 2 ./crypto-oracles-$b chacha20-poly1305/ chacha20-poly1305-openssh/ >> oracle-$b.txt 2>&1; echo "exit=$?" >> oracle-$b.txt
  done
Expected: exit=0 each (agreement at every length first). The variant whose seal/1024 drops toward 1.17 names the cause.
