# crypto-oracles: toyos-crypto beside ring, OpenSSL and AWS-LC on the benches' Linux

Scratch probe; it never lands. toyos-crypto is at main 4dc75f542. The references are built from source and
pinned by crates.io checksum (`r1/README.txt`): ring 0.17.14, OpenSSL 3.5.5 (openssl-src 300.5.5+3.5.5) and
AWS-LC 5.11.0 (aws-lc-sys 0.46.0). Binaries are static-pie x86_64-unknown-linux-musl, cross-built on the
development Mac. The binaries are not published: they embed build paths. `probe-src-masked.tgz` is the
source that ran, with the scratch path in `build.sh` replaced by `<scratch>`. `SHA256SUMS` names the
unmasked tarball and the binaries as staged.

Before any timing, every library is held to toyos-crypto's answer. That covers each row's inputs, plus every
length 0..1153 B for the AEADs, the OpenSSH packet, SHA-2 and HMAC. Controls (`r1/controls/`, Rosetta,
exploratory): two OpenSSL-path mutants, each caught with exit 101.

## r1 (T14: i5-1135G7; AMD bench: Ryzen 7 4800U; both Ubuntu 24.04, kernel 6.8)

All six runs exited 0. Tables are in `r1/table.md`, with raw outputs per bench.

**The shipped column of r1's Poly1305 rows is a probe artefact, not the image's code.**
- Affected rows: ChaCha20-Poly1305 and the OpenSSH AEAD from 1 KiB up. On AMD, seal at 16 KiB and above is
  unaffected, because seal does not go through this kernel there.
- In r1, toyos-crypto was built non-incremental, with codegen-units 256 and debug assertions on. The image
  builds it incrementally: `[profile.toyos]` inherits `dev`, and toyos-crypto is a path dependency.
- Under r1's partitioning, LLVM left the AVX2 Poly1305 kernel's inner pieces out of line:
  `Multiplier::product`, the `Iterator::reduce` that sums its terms, and the add closure. That gives five
  calls per product with YMM passed through memory (`investigation/poly1305-calls.txt`).
- The image's `crypto_parity` (built at 15cba97f2, Poly1305 sources identical) and r2's incremental build
  contain no such calls.
- Their `toyos_crypto::arch::x86_64` kernels match symbol for symbol, within a few bytes
  (`investigation/{image,r2,r1}-arch.txt`). r1's do not match.
- `investigation/x1-no-reduce.patch` replaces the closure's `into_iter().reduce` with explicit adds. With
  it, even the non-incremental build inlines everything. The kernel's speed therefore rests on an inlining
  decision that the build mode can flip. This is a structural observation; the patch was not measured.

## r2

`r2/` holds the same probe with toyos-crypto built incrementally (`r2/README.txt`). Bench results are
pending.
