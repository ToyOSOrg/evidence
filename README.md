# toyos-crypto

A standalone implementation of ToyOS's requested cryptographic primitives in
Rust. The default primitive core is `no_std`, allocation-free and dependency-free,
with no build script, C source, external assembler or host code generator.
An optional `rustls-provider` supplies thin adapters for unmodified rustls.
ToyOS integration, SSH framing, X.509 and SSHSIG parsing remain separate.

**Status: experimental and ready for review, not qualified for deployment.**
Correctness tests pass on native ARM64 macOS and both x86 Linux benches.
ARM AES/GHASH scheduling and hosted x86 AES/GHASH batching have been improved.
Matched Linux measurements still trail stock ring; AVX paths are in scope but
not implemented. Independent arithmetic review, current-source timing and
deployment qualification remain open. See [VALIDATION.md](VALIDATION.md) for the
design review, acceptance gaps and exact evidence. Passing vectors does not
establish that this implementation is safer than ring.

## Scope

One crate keeps private arithmetic and secret ownership inside a single review
boundary. Public modules expose only the algorithms with a named ToyOS consumer.
There is no general bignum API or speculative algorithm collection.

| Module | Implemented primitives | Consumer |
| --- | --- | --- |
| `hash` | SHA-256, SHA-384, SHA-512; checked streaming lengths | TLS, SSH, image and content hashing |
| `kdf` | HMAC for those hashes; HKDF extract/expand | TLS and SSH key schedules |
| `aead` | AES-128-GCM, AES-256-GCM, IETF ChaCha20-Poly1305 | TLS records |
| `x25519` | Public keys and single-use ECDH | TLS and SSH exchange |
| `ecc::p256`, `ecc::p384` | ECDH and strict DER ECDSA verification | TLS exchange and certificate signatures |
| `rsa` | 2048–4096-bit PKCS#1 v1.5 and PSS verification, SHA-256/384/512 | TLS certificate signatures |
| `ed25519` | Strict verification; optional signing | SSH keys, boot and update signing |
| `mlkem` | ML-KEM-768 key generation, encapsulation and decapsulation | TLS and SSH hybrid exchange |
| `hybrid` | ML-KEM secret followed by X25519 secret; raw TLS and SHA-256 SSH combiners | Consumer-specific hybrid key schedules |
| `ssh` | `chacha20-poly1305@openssh.com`, with a separate encrypted length key | SSH packets |
| `rustls_provider` | TLS 1.3 and TLS 1.2 ECDHE-AEAD provider, including X25519MLKEM768 | HTTPS clients through unmodified rustls |
| `wpa2` | SHA-1/HMAC internally, PBKDF2-HMAC-SHA1 with 4096 iterations, 802.11i PRF, AES-128 RFC 3394 unwrap | WPA2-Personal supplicant |

Private SHA-3/SHAKE implements ML-KEM's hashes. SHA-1 and AES block decryption
are compiled only with `wpa2`. There is no RSA signing, CBC, MD5, DES, RC4 or DSA.
P-256 arithmetic is private and can support a later SAE consumer; SAE and
hash-to-element are not implemented.

## Build

Rust 1.89 or later is required. The default build needs only `core`.

```text
cargo check --lib
cargo test --release --features std,sign,wpa2,rustls-provider -- --nocapture
cargo test --release --all-features -- --nocapture
cargo test --release -- --nocapture
cargo clippy --all-targets --all-features -- -D warnings
cargo fmt --check
cargo package
```

The pinned dev-dependencies are independent test oracles and JSON readers.
Provider tests use ring and rcgen, including ring's C/assembly host build tools;
those are test-only. Normal provider builds depend only on rustls and its Rust
support crates. The comparator is a separate package under `benchmarks/ring`.

| Feature | Contract |
| --- | --- |
| default | `no_std`, no allocation, verification and key exchange |
| `std` | Host capability metadata on AArch64 and host examples; enables rustls std support when the provider feature is active |
| `sign` | Ed25519 signing, for build-host signing or the SSH host-key consumer; leave off boot/update verification binaries |
| `wpa2` | The supplicant's restricted SHA-1 and AES unwrap interface |
| `portable` | Disables AES/CLMUL/PMULL dispatch for fallback testing |
| `rustls-provider` | Enables allocation and the optional rustls dependency; leaves protocol and certificate parsing upstream |

## rustls provider

Bind a static `rustls_provider::Backend` to the caller's implementation of
`rustls::crypto::SecureRandom`, then pass `Arc::new(backend.provider())` into
`rustls::ClientConfig::builder_with_provider`. The backend stores each group's
entropy source directly; it installs no global provider or RNG. Entropy failures
propagate to rustls. The default preference offers hybrid exchange first, followed
by X25519, P-256 and P-384; hybrid is offered only for TLS 1.3.

The provider includes all three TLS 1.3 ciphers and the six TLS 1.2 ECDHE-AEAD
suites. Certificate verification covers Ed25519, P-256/P-384 with SHA-256/384,
and RSA PKCS#1/PSS with SHA-256/384/512. TLS 1.3 mappings select the specified
curve first. AES traffic limits are conservatively set to 2^23 records.

QUIC and private-key loading are not advertised. HTTPS clients use
`with_no_client_auth`; a caller may supply its own certificate resolver when
private signing is needed. This is not yet a qualified ToyOS TLS replacement.

## API boundaries

`Random::fill` is the entire entropy interface. The caller must provide a CSPRNG
and return an error if a complete fill fails. The library has no entropy source
and does not implement the kernel's generator. The examples' deterministic
generators are test fixtures, not entropy providers.

Secret owners have no `Debug`, `Display` or `Clone`. Public and secret keys have
different types. X25519, P-256/P-384 ECDH and ML-KEM decapsulation consume their
secret owner. Shared secrets provide an explicitly borrowed `as_bytes` view for
the consumer's key schedule. Hash updates, one-shot hashing and HMAC/HKDF return
`Result`; length refusal occurs before state or caller output is modified.

AEAD sealing owns a monotonically increasing sequence and returns the nonce and
detached tag. The nonce is `iv XOR (0^32 || sequence_be64)`. Do not import the same
key/IV into multiple sealing owners. Types prevent rewinding one owner; they
cannot detect duplicate imports across processes or devices. Opening checks the
tag before changing ciphertext. The protocol must enforce its tighter traffic
key usage limits, replay policy, transcript binding and rekey policy.

The AEAD contract accepts 96-bit nonces and full 128-bit tags only. AES-192 is
outside scope. P-256/P-384 accept only fixed-size, uncompressed SEC 1 points;
ECDSA signatures use strict DER integers. RSA takes a minimal unsigned modulus
and an odd public exponent from 3 through `u32::MAX`. PSS requires the hash and
MGF1 hash to match and the salt length to equal the digest length, as in TLS.
This is a bounded modern-consumer interface, not every encoding or parameter
that a general-purpose RSA library permits.

Ed25519 rejects non-canonical encodings, non-canonical `S`, negative zero,
small-order public keys and small-order `R`, and verifies the cofactorless
equation. ML-KEM rejects non-canonical encapsulation keys. Its decapsulation
returns an implicitly rejected secret for malformed contents of a correctly
sized ciphertext; it deliberately does not expose a validity bit. Expanded
ML-KEM private-key import is not exposed.

OpenSSH's packet cipher is separate from IETF ChaCha20-Poly1305. Its length
decryption is an unauthenticated framing hint: the SSH caller must bound the
allocation and authenticate the entire packet before using the plaintext.

Owned keys, arithmetic state and explicit secret workspaces are overwritten
using volatile writes and a compiler fence. This cannot erase earlier moves,
caller-held byte copies, compiler spills, registers, or storage abandoned on
abort. Borrowing secret bytes puts their subsequent lifetime under the caller's
control. The source has content-independent schedules for secret arithmetic;
compiler and hardware qualification is still required.

## CPU and loader contract

On hosted and UEFI x86-64, CPUID admits AES-NI and PCLMULQDQ.
The crate supports the UEFI loader and userland. Bare-metal x86 (`target_os=none`)
and soft-float AArch64 kernel targets are unsupported and fail with an explicit
compile-time diagnostic. Their SIMD implementations are excluded before codegen. The crate's intrinsic and inline
assembly paths use legacy SSE encodings; no AVX path is implemented. Hosted
x86 uses four parallel AES CTR blocks, AES SubWord and four-block aggregated
CLMUL GHASH. The UEFI path retains its register-preserving per-block operations. The OS must
permit SIMD, preserve its state and expose a uniform feature set across CPUs on
which a key can execute. Deploy with a baseline target configuration rather than
globally enabling AVX through compiler flags.

AArch64 hosts with `std` use OS capability detection. Without `std`, the default
is portable. On a hard-float ABI, an OS may call `unsafe { cpu::initialize_aarch64() }` during
initialization to admit AES/PMULL from `ID_AA64ISAR0_EL1`; the caller must establish
register-read permission, SIMD permission and migration-safe capabilities.
Kernel and interrupt callers must preserve the interrupted context's SIMD state
around each crypto invocation; context-switch preservation alone is insufficient.
Reading that register speculatively in arbitrary EL0 code can trap. A no_std
userland startup bridge should instead obtain trusted OS capability metadata
and call `unsafe { cpu::initialize_aarch64_with_features(aes, pmull) }` before
importing keys, under the same SIMD and migration contract. This API does not
read an ID register. The ToyOS adapter that obtains those capabilities is an
integration task; absent admission the crate stays portable. SHA-2 is
currently portable; SHA-NI and ARM SHA2 acceleration remain future optimization.

The x86-64 UEFI path saves and restores every XMM register it uses inside each
assembly block. It builds for the soft-float UEFI target. This path has been
compiled, not exercised in firmware. Native ARM64 macOS acceleration and portable execution have been tested.
Windows runtime tests remain pending. The custom ToyOS targets were not built; integrating the
crate and qualifying the ToyOS compiler are separate work.

## Reproduce additional evidence

```text
# Run the mutation runner in an isolated clean COPY of the crate.
cargo run --release --features std --example negative_controls

# Real-hardware runs need CPU affinity/frequency control and enough samples.
cargo run --release --features std,sign,wpa2 --example timing -- 100000
# Optional: comma-separated seeds, routines, and raw sample export.
cargo run --release --features std,sign,wpa2 --example timing -- 100000 1,2,3 chacha,ssh,wpa2_hmac raw

# Run with separately controlled affinity, clocks and runtime-dispatch policy.
cargo run --release --manifest-path benchmarks/ring/Cargo.toml --example compare -- 2000
```

The timing example always labels output `no_verdict=true`. Its cloud smoke run
checks the harness, not constant time. The benchmark does not disable ring's
AVX dispatch. Native Linux results and their exact comparison policy are indexed
in `evidence/current/x86-pipeline/README.md`.

Unmodified third-party vector files, upstream URLs, licences and SHA-256 hashes
are recorded in [NOTICE](NOTICE). Source is licensed under MIT OR Apache-2.0.
