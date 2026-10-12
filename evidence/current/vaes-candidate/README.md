# Eight-block VAES/VPCLMUL candidate: local evidence

The candidate adds 256-bit VAES AES-128/256 CTR and VPCLMUL GHASH for complete
eight-block batches. Dispatch requires AVX2 CPU and XCR0 permission plus legacy
AES/PCLMUL and VAES/VPCLMUL feature bits. UEFI excludes it; portable forces
fallback. No global target-feature flags are used. This implementation follows
FIPS 197 / SP 800-38D and the documented Intel instruction semantics, not
another crypto implementation. Official Rust intrinsic references confirm
these intrinsics are stable since Rust 1.89:
https://doc.rust-lang.org/core/arch/x86_64/fn._mm256_aesenc_epi128.html
https://doc.rust-lang.org/core/arch/x86_64/fn._mm256_clmulepi64_epi128.html

Native ARM dispatched and portable regression suites each pass 48 tests.
Linux, Windows MSVC and UEFI library clippy pass; Linux portable and host
all-target/all-feature lint pass. Rust 1.89 host library check is ARM only.
The full x86 native suites are expected to contain 52 tests. Two new controls
mutate a VAES counter and a VPCLMUL power; they require an admitted host.
They are not counted as executed on ARM or on hosts without VAES/VPCLMUL.

The new x86 unit tests compile with rustc --test --emit=metadata for Linux,
using an isolated exact copy of the arch module, its children and secret.rs.
That check does not execute tests. Its first path-layout attempt failed and is
retained. The all-target Linux cross-clippy attempt failed because the test-only
ring dependency needs a cross C compiler absent from this Mac; the library-only
check succeeds. Neither failure counts as a negative control.

Full baseline Linux/UEFI release assembly is compressed losslessly. The
instruction inventory confines all AVX instructions to ChaCha batches and the
two new VAES/GHASH functions. UEFI contains none, and no XGETBV. The existing
OSXSAVE-before-XGETBV path is reused; the VAES path additionally tests leaf-1
mask 0x02000002 and leaf-7 ECX mask 0x600 before either new routine is entered.
GHASH's fixed register shuffles perform byte reflection without indexed memory.
Its powers and intermediate values can spill; the existing register/temporary
copy erasure exclusions remain. No new erasure guarantee is made.

Native correctness, mutation controls, matched performance and AES timing are
pending. ARM checks and cross-compilation do not establish native correctness
or performance of this implementation. There is no qualified integration pin.
