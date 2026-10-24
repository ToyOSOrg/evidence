chacha-avx2 round 4, optional, AMD bench Linux only (about 2 minutes); review r1's suggestion on #1056.
Do 0 B to 192 B ChaCha20-Poly1305 records cost less through the short path (main's lanes path, tried first) than
through the one-pass kernel the head now sends them to? Same probe as before.

  crypto-oracles-ca676da20                  the head
  crypto-oracles-ca676da20+v-short-first    `aead` tries `short()` (1..=192 B) before the one-pass kernel (v-short-first.patch)

Run on the AMD bench, CPU otherwise idle:
  sha256sum -c SHA256SUMS
  for b in ca676da20 ca676da20+v-short-first ca676da20 ca676da20+v-short-first; do
    taskset -c 2 ./crypto-oracles-$b chacha20-poly1305/ >> oracle-$b.txt 2>&1; echo "exit=$?" >> oracle-$b.txt
  done
Expected: exit=0 each. Read seal, open and reject at 0, 64 and 1024 B (1 KiB is the control: unchanged by the patch).
