# Design review and validation record

This is an author self-review, not the independent adversarial review requested
by ToyOS. It applies the production bar in ToyOS's root `CLAUDE.md` and
`.claude/agents/reviewer.md`, read at repository commit
`41ad7ecd2b8d009e40b6fb46bc8676b8fb52922f`. The implementation is standalone;
there is no ToyOS integration build or draft PR. The optional rustls provider
is implemented and undergoing consumer qualification.

## Current development evidence (2026-10-11)

The imported evidence below is a historical baseline, not evidence for the
subsequent edits. The current work adds interleaved ARM AES-CTR and four-block
PMULL GHASH, hardware SubWord, borrowed/wiped arithmetic workspaces and
independent modular-integer checks. Full logs for this development stage are
kept in `evidence/current/`; they are not shipped in the Cargo package.

At source commit `2b0f372ed19fce5e81e33824d4352ef59986dde7`, native Mac release
matrices passed in dispatched, portable and default configurations. Both native
x86 benches also passed 35 tests with 3,056 external fixtures. Nine isolated
mutations failed their exact tests; compiler errors did not count. This does
not supply a constant-time verdict or a controlled no-AVX benchmark.

The new `rustls-provider` feature allocates only at its adapter boundary and
depends on unmodified published rustls. It binds every group to caller entropy,
checks the outbound sequence against the primitive nonce owner, and uses
upstream record helpers and certificate parsing. Private-key loading and QUIC
are not supported. No ToyOS consumer is declared delivered.

Provider unit tests use independent ring, rcgen, RustCrypto curve and ML-KEM
oracles. They cover all nine record adapters; 60 TLS handshake configurations
with trusted-root/leaf chains and bidirectional application data; TLS 1.3 key
updates; hybrid-to-classical HelloRetryRequest; strict RSA DER; transcript
forks; HKDF; failed entropy; cross-hash ECDSA; and hybrid wire encodings and
secret order. The hybrid reference server combines independent primitives;
it is not an independent TLS protocol implementation (both peers use rustls).

Both native x86 hosts subsequently passed all 46 tests at provider source
`530d0fedecaff13cdabbdb8957554634e967823c`, including the provider matrix.
Twelve isolated mutations now fail their exact tests, including provider nonce
rewind and noncanonical DER integer/length controls. Debug, dispatched and
portable release, default features, lint, documentation and library MSRV gates
pass. An external no-std consumer confirms that optional provider builds do not
pull ring into normal dependencies; a default consumer has no dependencies.
See `evidence/current/README.md` for exact commands, source revisions and limits.

The performance target, independent cryptographic review, deployment timing,
complete official vector corpora, sustained fuzzing and ToyOS/firmware/runtime
portability qualification remain open. Later sections retain the imported
evidence's original limitations and results; they are not current ARM timings.

## Design and its roast

The clean-room design uses bounded storage and specification-level algorithms.
The core's dependency graph is one crate. Tests deliberately use independent
implementations as dev-dependencies. Keeping all arithmetic private avoids an
unbounded bignum API and keeps the secret owner and its implementation together.
It also concentrates a large amount of security-sensitive code in one new
review boundary. The broad algorithm coverage is not evidence of production
maturity.

Curve25519 uses five radix-2^51 field limbs and fixed carry passes. P-256/P-384
use four/six 64-bit limbs, full schoolbook multiplication, fixed Montgomery
reduction, and fixed exponentiation for inversion. This favors a small common
implementation over hand-specialized reduction. It is slower, and the private
`V<N>` type does not distinguish ordinary integers, Montgomery residues, field
elements and scalars. Public wrappers separate keys, but internal domain
confusion remains possible. An independent review must prove every conversion
and residue bound; passing ECDH/ECDSA vectors is insufficient.

No secret-dependent precomputed scalar table is used. X25519 uses a 255-step
Montgomery ladder; Edwards and NIST multiplication use fixed double/add/select
schedules. Masked NIST exceptional-case handling deserves particular review.
This simple arithmetic leaves substantial performance on the table. The
constant-time selection barrier uses a volatile load to prevent LLVM retaining
boolean provenance; it is not a compiler-level constant-time guarantee.

AES uses an algebraic table-free portable S-box and hardware round instructions
when admitted. GHASH uses a bitwise portable multiply or three carryless products
and a fixed polynomial reduction. The current ARM path schedules four blocks together and keeps CTR
keystream in vector registers. The imported host benchmark below measured the
earlier single-block implementation; the performance acceptance goal remains
**unproven**.
Multi-block AES/GHASH scheduling, better scalar arithmetic, SHA acceleration and
SIMD ChaCha are optimization candidates requiring their own evidence.

ML-KEM uses canonical coefficients modulo 3329, straightforward NTT arithmetic,
and constant-divisor expressions. Twiddle generation depends on public indices.
Decapsulation always re-encrypts and computes the rejection secret before
selecting. This is deliberately simple and has official known-answer coverage,
but arithmetic lowering and memory behavior need compiler/hardware review.

Secret storage is erased on drop using volatile writes, including explicit
hash schedules, sponge state, expanded AES keys and polynomial workspaces.
Erasure of all physical secret copies is not established: passing arrays by
value can leave prior storage, and compiler spills/registers are outside the
owned-storage guarantee. This does not satisfy a literal guarantee that every
secret intermediate anywhere in memory disappears.

## Secret-dependent routines: source arguments

These are review arguments, not real-hardware timing verdicts. Lengths,
algorithm choices, CPU features, and externally supplied encodings are public.
The final success/failure result of authentication is intentionally observable.

| Family | Schedule/address argument | Remaining obligation |
| --- | --- | --- |
| SHA-2, SHA-1 | Fixed compression rounds and sequential schedules; padding depends only on length; SHA-1 exists only inside WPA2 | Compiler lowering, arithmetic instruction latency and secret-state erasure |
| HMAC, HKDF, WPA2 PRF/PBKDF2 | Hashes inherit that argument; block/output counts are public; PBKDF2 is exactly 4096 iterations | Real-hardware testing including long/short key cases as distinct public-length classes |
| Comparisons and selection | Whole-slice OR of differences; no content-directed exit; masks select words without indexing | Inspect emitted code per compiler/target; final authentication branch is allowed disclosure |
| AES | Portable GF(2^8) inversion has fixed squaring/multiplication, no S-box lookup; hardware rounds have public round count | Hardware latency, dispatch permission, firmware register preservation and compiler code generation |
| GHASH/GCM | Portable 128 iterations; hardware three carryless products; fixed reduction; buffer access depends only on length | Hardware path review, multi-compiler assembly inspection and tag-compare timing |
| ChaCha/Poly1305 | 20 fixed ChaCha rounds; five 26-bit Poly1305 limbs and fixed carry/reduction; sequential input access | Limb-bound proof, compiler lowering and timing of AEAD and OpenSSH constructions |
| Curve25519 field/scalars | Product sums fit u128 for radix-2^51 inputs; three fixed carry passes; fixed exponentiation; fixed scalar reduction | Prove post-carry bounds at every caller; emitted selection code and multiplication latency |
| X25519 | 255 ladder steps, masked swaps, fixed inversion, final all-zero refusal | Real-hardware tests for secret scalars and adversarial peer classes |
| Ed25519 signing | Fixed hash/scalar schedules, 256-step fixed multiplication, complete Edwards additions; no secret table index | Complete-formula and scalar-bound proof, compiler review and real-hardware signing tests |
| P-256/P-384 ECDH | Fixed 256/384-step double/add/select; all exceptional cases selected with masks; inversion exponent is public | Proof that valid nonzero scalar/prime-order peer never reaches the infinity assertion; all carry and domain invariants |
| ML-KEM | Secret CBD/NTT/hash/re-encryption schedules fixed; matrix rejection depends on public rho; masked implicit rejection | Verify constant-divisor lowering on each target and timing across valid/invalid ciphertexts and secret keys |
| WPA2 unwrap | Public six-pass block count, table-free AES inverse, whole integrity compare; auth failure wipes output | Real-hardware unwrap timing and erasure review |

RSA and ECDSA/Ed25519 verification operate on public keys, public signatures and
public messages and may take input-dependent refusal paths. They are not secret
operations. Secret-key import can disclose validity; generation uses caller
entropy and, for NIST curves, four uniform candidates with masked selection.
The only disclosed generation result is whether a valid candidate exists.

For Montgomery multiplication, each inner accumulator is a 64x64-bit product
plus a 64-bit stored word and a carry. Its maximum is `2^128 - 1`. Reduced
operands are below the modulus; the final candidate is below twice the modulus,
so one masked subtraction suffices. Carry propagation always traverses its
fixed workspace. The assertions describe internal invariant failures. These
bounds and the limb-domain assumptions must be independently checked, including
debug builds with overflow checking and malformed public inputs.

## Correctness evidence

`evidence/` in the review archive contains complete logs. It is excluded from
the Cargo package to keep incidental execution records out of the distributed
library. The tests and original vector data remain in the Cargo package.

The external-vector runner executes **3,056 fixture cases** within the public
API contract: 2,986 Wycheproof cases and 70 NIST ML-KEM-768 ACVP cases. The
internal keygen test additionally compares all 2,400 expanded private-key bytes
for the same 25 NIST keygen cases without exposing a private-key import API.
Cases outside the API are counted and printed: non-96-bit AEAD nonces, truncated
tags, AES-192, and ML-KEM expanded-private-key import. They are not counted as
passed cases.

Inline FIPS/RFC vectors cover SHA-2, HMAC, HKDF, AES/GCM, ChaCha20-Poly1305,
X25519, Ed25519 and RFC 3394 unwrap. Differential tests cover message and block
boundaries, streaming, all three AEAD algorithms, ECDH and ECDSA on both NIST
curves, RSA at 2048 and 4096 bits with all supported hashes/paddings, OpenSSH's
distinct construction, WPA2 PMK derivation, and ML-KEM including implicit
rejection. The independent crates are pinned in `Cargo.lock`.
NIST curve boundary tests additionally compare scalar 1, 2 and n-1 and all nine
pairings per curve against the independent implementation; 0 and n are refused.
For validated finite prime-order peers and nonzero scalars, an infinity result
in ECDH is an internal arithmetic bug and panics rather than becoming an input
refusal. Public-point parsing still refuses malformed encodings with `Error`.

The gate commands and full logs are indexed below. Unless noted otherwise,
the compiler was Rust 1.99.0, using the baseline x86-64 Linux configuration.
The companion benchmark pins ring 0.17.14. No host name, machine serial number
or deployment key is needed to reproduce these checks.

| Gate | Command or configuration | Exit | Evidence file |
| --- | --- | --- | --- |
| Release, dispatched | `cargo test --release --features std,sign,wpa2 -- --nocapture` | 0 | `final-release.txt` |
| Release, portable | `cargo test --release --all-features -- --nocapture` | 0 | `final-portable.txt` |
| Default features | `cargo test --release -- --nocapture` | 0 | `final-default.txt` |
| Debug overflow checks | `cargo test --features std,sign,wpa2 -- --nocapture` | 0 | `final-debug.txt` |
| NIST scalar boundaries, debug | Exact `nist_curve_boundary_scalars` differential test | 0 | `final-boundary-debug.txt` |
| Lint | Clippy driver, all targets/features, `-D warnings` | 0 | `final-lint.txt` |
| Format | Rustfmt, edition 2024, `--check` on every Rust file | 0 | `final-format.txt` |
| Documentation | `cargo doc --no-deps --all-features`, `RUSTDOCFLAGS=-D warnings` | 0 | `final-doc.txt` |
| Runtime dependency tree | `cargo tree --edges normal` | 0 | `final-dependencies.txt` |
| Minimum Rust version | Rust 1.89.0, `cargo check --lib`, dispatched and all features | 0 each | `msrv.txt` |
| Target matrix | Six targets, no-std and consumer feature configurations | 0 each | `final-targets.txt` |
| Mutation runner | `cargo run --release --features std --example negative_controls` | 0 runner; 101 each mutant | `final-mutations.txt`, `mutations/` |
| Assembly scan | Baseline x86-64 release library, `--emit=asm` | 0 build | `final-assembly-build.txt`, `final-assembly-scan.txt` |
| Timing harness smoke | `cargo run --release --features std,sign,wpa2 --example timing -- 100` | 0; no timing verdict | `final-timing-smoke.txt` |
| Host throughput | Companion `compare` example, 2000 iterations | 0; target unmet | `final-benchmark.txt` |
| Package verification | `cargo package` | 0 | `final-package.txt` |

The target matrix includes x86-64 Linux, AArch64 Linux, x86-64 Windows GNU,
x86-64 macOS, AArch64 macOS and x86-64 UEFI. It also emits release library
objects for AArch64 Linux and the soft-float UEFI target. Only Linux x86-64 tests
were executed for this imported baseline. Subsequent ARM64 native tests are
recorded separately above. Rust 1.89 evidence covers the library, not oracle dependencies.

The baseline x86-64 assembly scan finds no AVX/YMM/ZMM use and no integer divide
inside ML-KEM. Two divides in AES expansion use the public loop offset and key
length. This limited scan is not a path-by-path constant-time audit. Global
compiler flags can change the instruction set, so it does not cover builds with
`target-cpu=native` or enabled AVX target features.

The recorded 16,384-byte host samples, in nanoseconds per byte, are shown below.
They were taken in one process with 2,000 iterations, after other local build
and test jobs had finished. Cloud scheduling, frequency and ring's dispatch
were not controlled. These numbers establish neither a T14 result nor a stable
cycles/byte result; they do show that this implementation has not demonstrated
the requested speed advantage.

| Algorithm | This crate | ring 0.17.14 |
| --- | ---: | ---: |
| AES-128-GCM | 3.657 | 0.163 |
| AES-256-GCM | 3.539 | 0.145 |
| ChaCha20-Poly1305 | 3.498 | 0.683 |

A portable invocation and a later default-feature invocation each could not
execute one test binary because the workspace had stored that executable with
mode 0644. Neither ran that test or reported an algorithm failure. After
restoring execute permission, the same commands passed. The original logs are
retained as `initial-probes/portable-execution-attempt.log` and
`initial-probes/default-execution-attempt.log`.

This is not the complete requested NIST CAVP corpus for AES, GCM, SHA, ECDSA
and HMAC. Expanded official corpora, sustained malformed-input fuzzing and
independent review remain open acceptance gates.

## Negative controls

The mutation runner first requires an unmodified passing baseline, then changes
one guard and runs its exact host test. Compiler failure does not count: the
runner requires exit 101 and a failed-test result. Every mutation is restored
before proceeding. Run only in an isolated copy because an interrupted process
can leave source modified.

| Mutation | Exact test | Required and recorded test exit |
| --- | --- | --- |
| Disable ChaCha AEAD tag comparison | `rfc8439_aead_and_authenticated_refusal` | 101 |
| Disable P-256 curve-equation validation | `malformed_public_boundaries` | 101 |
| Reduce Ed25519 S instead of requiring S < L | `rfc8032_empty_and_strict_rejection` | 101 |
| Disable Ed25519 signature length guard | `rfc8032_empty_and_strict_rejection` | 101 |
| Disable Ed25519 small-order public-key guard | `rfc8032_empty_and_strict_rejection` | 101 |
| Disable ML-KEM coefficient modulus guard | `malformed_public_boundaries` | 101 |

Each patch, full log and exit code is under `evidence/mutations/`. The original
scalar mutation survived the first test: rejecting an arbitrary high-bit S did
not exercise the canonical-range guard independently of the group equation.
`evidence/initial-probes/scalar-survived.log` records exit 0. The corrected
negative control adds the group order to a valid signature's S. The equation
still holds if range validation is removed, and the strengthened test now fails
under that mutation. This history is retained rather than treating the earlier
test as evidence it did not provide.

## Deployment acceptance blockers

1. **No independent cryptographic/arithmetic review.** This author review does
   not replace the adversarial reviewer or an audit.
2. **No real-hardware constant-time verdict.** The timing smoke run is cloud
   harness validation only. Repeat adequately sampled, affinity-controlled runs
   and assembly review on the T14 and representative AArch64 hardware for the
   deployment compiler configurations.
3. **Performance goal unmet.** The recorded host benchmark is slower than ring.
   It is not the T14 and does not suppress ring's AVX dispatch. No claim about
   the requested no-AVX cycles/byte target can be made from this result.
4. **Runtime portability not fully qualified.** Linux x86-64 tests execute here.
   Windows and UEFI checks are compilation/code-generation evidence only.
   Native ARM64 macOS now has runtime evidence. The custom ToyOS targets and firmware register preservation
   require their own builds and execution.
5. **Full vector/fuzz coverage remains incomplete.** The test corpora above are
   substantial independent evidence but do not satisfy every testing item in
   the brief. In particular, complete NIST CAVP coverage and sustained fuzzing
   have not been recorded.
6. **No universal secret-erasure guarantee.** The owned-storage contract is
   narrower than erasing compiler-created/caller-created copies. Deployment
   needs an explicit policy for those copies and abort behavior.

The artifact is a packageable implementation and reproducible review record.
It has not earned the brief's production, faster-than-ring or safer-than-ring
acceptance claims.

## Automated review follow-up and consumer scope

The crate supports the UEFI loader and userland; the kernel is outside scope.
Unsupported bare-metal x86 and soft-float AArch64 kernel targets now fail with
a clear compile-time diagnostic instead of an LLVM crash or future ABI warning.
No_std AArch64 userland can admit trusted OS capabilities without an EL1
register read through `cpu::initialize_aarch64_with_features`; ToyOS startup
integration remains pending.

ChaCha word state uses borrowed Drop-wiped workspaces. Computed opening tags
for GCM, ChaCha and SSH have secret owners. The NIST Montgomery constructor
enforces its high-bit modulus assumption; representation domains remain
untyped. Earlier expanded-key moves and compiler copies are still outside the
erasure guarantee and remain a concrete review concern.

Full automated model reports, dispositions, target rejection matrix, supported
compile checks, final ARM tests/lint/MSRV and twelve negative controls are in
`evidence/current/review-fixes/`. Model review is additional evidence, not an
external cryptographic audit. Previous native timing does not qualify the source
after these changes. Native x86 correctness revalidation at `2f262569` passed
46 tests on both hosts; complete evidence is retained in `evidence/current/`.
