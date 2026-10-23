aes-gcm round 2: toyos-crypto's AES-GCM at the PR head beside main, beside ring 0.17.14, OpenSSL 3.5.5 and
AWS-LC 5.11.0, on each bench's Linux. Same probe, sampler and shipped profile as round 1.

  probe-base-02301e02b   main (02301e02b), the PR's base
  probe-full-7dcf12a5a   the PR head: G1, G2 (schoolbook kept), G3, G4, and G5 as round 1's a5 measured it
                         (round keys reloaded every step). Since round 1 it also:
                         - restores main's AES-NI round loop: round 1's split loop scheduled AES-256's
                           last rounds block by block, and AES-256 seal on the AMD bench fell 30%
                           (1.03 -> 1.35 against ring);
                         - builds the 512-bit key's powers in registers (key setup rose 177 -> 246 ns on
                           the T14 in round 1).

The agreement checks are round 1's (every library at every AEAD length to 1153 B, AES-GCM to 4200 B and at
16383, 16401, 65536, 65553, 1 MiB+17 and 1 MiB+4096 B with AAD 0..800 B, and no plaintext after a refusal).

Run on each bench's Linux, CPU otherwise idle, one at a time (AES rows only):
  sha256sum -c SHA256SUMS
  for b in base-02301e02b full-7dcf12a5a full-7dcf12a5a base-02301e02b; do
    taskset -c 2 ./probe-$b aes- > $b-$((++i)).txt 2>&1; echo "exit=$?" >> $b-$i.txt
  done
  Both benches. Please return every file whole, with `uname -r` and `lscpu | head -20` once per bench.
Expected: exit=0 for all. Rows to read first: AMD aes-256-gcm seal and open (the restored and the now
rolled AES-NI loops), and the key rows on both benches.
