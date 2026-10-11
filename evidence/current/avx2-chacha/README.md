# AVX2 ChaCha candidate awaiting native execution

The candidate runs four blocks as two pairs of 128-bit lanes. Each pair uses
four 256-bit row vectors; diagonal rounds permute words within each lane.
Feedforward and XOR stores preserve each original block's layout. IETF and
SSH share the same internal 64-bit counter layout: the IETF length guard
prevents carry into nonce word zero. Scalar tails retain their correct next
counter. Bounds are checked before any mutation.

CPUID must admit XSAVE, OSXSAVE and AVX before XGETBV executes. XCR0 must
enable both XMM and YMM, and leaf 7 must admit AVX2. The public result is cached
under a process-lifetime, migration-safe permission contract. UEFI excludes
the module, and the portable feature refuses AVX admission. No global compiler
AVX flags are used. This follows Intel SDM AVX detection and RFC 8439's round
and block definitions, without importing another implementation.

Recorded local gates:

- Native ARM release dispatched and portable suites: 48 tests each, exit 0.
- ARM all-target/all-feature clippy and Rust 1.89 host library check: exit 0.
  The minimum-version check does not compile the x86 module on this Mac.
- Linux x86, Windows MSVC and UEFI clippy, dispatched and portable: exit 0.
- Expanded independent SSH differential test, dispatched and portable: exit 0.
- Final formatting and all-target/all-feature host lint: exit 0.
- Baseline Linux assembly has 160 AVX instructions, all within the AVX2 batch
  routine, and an XGETBV helper reached through the guarded detector. UEFI
  assembly has neither AVX instructions nor XGETBV. Full assembly is retained
  losslessly, with the instruction-region inventory in assembly-inventory.json.

The inspected Linux batch body has only fixed-round and public-length loop
branches. Its observed stack slots hold nonce/counter material; this observation
does not establish a general compiler-copy or register-erasure guarantee.

The initial ARM test build failed because the test-length array had an ambiguous
integer type; specifying usize fixed it. That complete attempt is retained,
and no compiler failure counts as a negative control. New controls will mutate
the batch stride and omit YMM-state permission. The native x86 suite also
checks admission against the independent standard-library detector.

Native x86 execution, negative controls, paired stock-ring measurements and
current-source timing remain pending. Earlier SSE timing and throughput
evidence does not qualify the new path. VAES/VPCLMUL, AVX-512, physical provider
key-copy review, further vector/fuzz coverage, UEFI/ToyOS runtime and external
cryptographic review remain open. No delivery or speedup claim is made here.
