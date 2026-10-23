crypto-oracles round 2: toyos-crypto beside ring, OpenSSL and AWS-LC on each bench's Linux.
x86_64-unknown-linux-musl, static-pie, no dynamic libraries (the bench's own libcrypto is not used).

  crypto-oracles-shipped-r2-4dc75f542     toyos-crypto (main 4dc75f542, feature "sign") in [profile.toyos]'s
                                       settings: opt-level 2, codegen-units 256, debug assertions and
                                       overflow checks on,
                                       built incrementally as the guest is. The references in release settings (opt-level 3,
                                       assertions off), as their users ship them.
  crypto-oracles-unasserted-r2-4dc75f542  the same, toyos-crypto with debug assertions and overflow checks off.
  probe-src.tgz                        the probe's source, Cargo.lock and build.sh (scratch; never lands).

Libraries, all built from source on the development Mac, pinned in Cargo.lock by crates.io checksum:
  ring 0.17.14 (stock crates.io)            a4689e6c2294d81e88dc6261c768b63bc4fcdb852be6d1352498b114f61383b7
  openssl-src 300.5.5+3.5.5 (OpenSSL 3.5.5) 3f1787d533e03597a7934fd0a765f0d28e94ecc5fb7789f8053b1e699a56f709
    via openssl 0.10.81 / openssl-sys 0.9.117 (vendored); Configure linux-x86_64, assembly on, -O2
  aws-lc-sys 0.46.0 (AWS-LC 5.11.0)         f1622d8446a2d4b2ce0c7eefc73dd43a99779028d5ee5c2dd8073a658ba8a2bc
    via aws-lc-rs 1.18.2, its cc builder (no CMake), s2n-bignum and the generated perlasm included
  musl 1.2.5 headers for the C builds       a9a118bbe84d8764da0ea0d28b3ab3fae8477fc7e4085d90102b8596fc7c75e4
Built with nightly-2026-07-22, Apple clang 21 (--target=x86_64-unknown-linux-musl), llvm-ar and rust-lld
from that toolchain (build.sh).

Before timing, each binary holds every library to toyos-crypto's answer: on every row's inputs, and at every
length 0..1153 B for AEAD seal/open/reject (AAD 0, 5, 17 B), the OpenSSH packet, SHA-256/384/512 and HMAC.
Key agreements are checked on fixed private keys (OpenSSL, AWS-LC) and by agreeing with ours both ways (all
three); verifications must give ours's verdict on the signature and on it with one bit flipped; ML-KEM by
encapsulating to each other both ways. A mismatch panics (exit 101) before any timing.

Run on each bench's Linux (T14 and AMD bench), CPU otherwise idle, one at a time, about 30 s each:
  sha256sum -c SHA256SUMS
  taskset -c 2 ./crypto-oracles-shipped-r2-4dc75f542    > shipped-1.txt   2>&1; echo "exit=$?" >> shipped-1.txt
  taskset -c 2 ./crypto-oracles-unasserted-r2-4dc75f542 > unasserted.txt  2>&1; echo "exit=$?" >> unasserted.txt
  taskset -c 2 ./crypto-oracles-shipped-r2-4dc75f542    > shipped-2.txt   2>&1; echo "exit=$?" >> shipped-2.txt
  (the second shipped run is for drift between runs; please return all three files whole, and `uname -r`
  and `lscpu | head -20` once)

Expected: exit=0, and in order the lines
  oracles: build=... / oracles: openssl=OpenSSL 3.5.5 27 Jan 2026 / oracles: isa=<what the CPU admits>
  oracles: every library computes ours's answer at every length to 1153 B
  oracles: every row's inputs checked against ours (88 rows)
  oracles: round 1..3 of 3 done (on stderr)
  samples: <row> <backend> <30 per-sample ns/op>       (toyos-a, toyos-b, ring, openssl, aws-lc)
  oracle: <row> | toyos ns | ring ns | openssl ns | aws-lc ns | spread | toyos/ring | toyos/openssl | toyos/aws-lc
  oracles: end, 88 rows
"toyos ns" is the median of (A+B)/2; a ratio is the median over samples of ours/theirs (above 1: ours slower);
spread is the 90th percentile of |A/B - 1| between the two toyos instances. "-": the library has no such
operation through the API used (ring: ML-KEM; OpenSSL: no OpenSSH AEAD key object).
Optional arguments filter rows by substring, e.g. `./crypto-oracles-shipped-r2-4dc75f542 chacha20-poly1305/ x25519`.

Round 2 differs from round 1 in one build setting only: toyos-crypto is compiled incrementally, as cargo
compiles it in the image's [profile.toyos] (dev-derived, a path dependency). Round 1's non-incremental
partitioning left the AVX2 Poly1305 kernel's Multiplier::product, Iterator::reduce and its add closure out
of line in the asserted build (5 calls per product, YMM through memory), which the image does not do; its
shipped ChaCha20-Poly1305 rows are not the image's. Same run commands.
