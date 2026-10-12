# Automated adversarial review D: AVX2 ChaCha (2ca7abfc3) and provider in-place construction (f55746d1a)
This is a Claude model review, not an external audit.
- **The AVX2 path was executed under Rosetta 2 emulation** (`ROSETTA_ADVERTISE_AVX=1` on an M4 Pro, which advertises AVX/AVX2/OSXSAVE and XCR0=0x7). That is correctness evidence only, not real silicon.
- **It was built with nightly** for x86_64-apple-darwin, a different compiler from MSRV 1.89.

## What was executed
- With AVX admitted: all 25 lib and 9 differential tests pass. That includes `aead_all_algorithms_and_partial_blocks` up to 16384 bytes against RustCrypto `chacha20poly1305`, and the SSH differential up to 4096 bytes against `chacha20`.
- **The path was genuinely taken:** the author's stride mutation (`*4` to `*3`) fails 4 lib tests and 2 differential tests (exit 101) with AVX advertised, and passes without it.
- **Not executed:**
  - OSXSAVE set with XCR0 lacking YMM;
  - real Intel or AMD hardware;
  - timing.
- **Assembly read:** cross-built x86_64-unknown-linux-gnu release (the AVX2 batch, both provider constructors) and x86_64-unknown-uefi.

## BLOCKER
None.

## NOTE
1. **Key and keystream stay in the low XMM halves after the AVX2 routine.** `batches` ends with `vzeroupper`, which clears only bits 128-255. After return:
   - xmm4/xmm5 still hold the two 16-byte key halves (`vbroadcasti128 (%rdi)` and `16(%rdi)`);
   - xmm0-3 and xmm9-15 hold state and keystream rows.

   This is within the stated exclusion (README.md:131), but wider than the scalar path's residue. If YMM erasure is ever claimed, zero the state explicitly (`vzeroall`) in `src/arch/x86_64/avx2.rs` `batches`.
2. **The zero-storage invariant holds by reading, not by type.** `SealingKey::aes_storage` / `OpeningKey::aes_storage` (`src/aead.rs:46,115`) return fully usable keys with zero round keys and a zero H, and the ChaCha storage is the public `chacha20_poly1305([0;32], …)`. Both call sites (`src/rustls_provider/cipher.rs:39,55`) initialize right after `Box::new`. A future caller that forgets would silently encrypt under a zero key; a type that can't be used before initialization would make that unrepresentable.
3. **`self.h.0.fill(0)` in `Gcm::initialize` (`src/gcm.rs:37`) is dead** under the invariant.
4. **On ToyOS today, AVX2 is never admitted:** the kernel keeps CR4.OSXSAVE clear (ToyOS `kernel/src/arch/x86_64/fpu.rs:6-7`), so the crate refuses before XGETBV. That is correct. ToyOS enables XSAVE after its folder restructure.
5. **The `x86_avx_state` control covers only the pure `state_enabled` predicate.** That XGETBV runs only behind OSXSAVE was established from the assembly, not by a test.

## Checked and sound
- **Admission:**
  - in the assembly, leaf 1 ECX is tested against 0x1C000000 (XSAVE, OSXSAVE, AVX) before `__xgetbv`;
  - then XCR0 & 6 == 6, leaf ≥ 7, and leaf 7 EBX bit 5;
  - there is no path to `batches` that skips them;
  - the result is cached once per process as a bool;
  - it matches std's detection under Rosetta, both with and without AVX.
- **Counters:**
  - the IETF guard (count ≤ 2^32 − counter) prevents a carry into the nonce, and the test with nonce [0xff;12] would catch one;
  - the SSH `checked_add` guard keeps `first+3` from overflowing, and the `vpaddq` 64-bit carry across 2^32 was executed (the u32::MAX−1 cases);
  - the scalar tail resumes at `counter + done/64`;
  - lengths 0-1025 and 4096/16384 pass.
- **Lanes:**
  - `_mm256_set_epi64x(nonce, c+1, nonce, c)` lays out words 12-15 correctly;
  - the diagonal shuffles (0x39/0x4e/0x93 and their inverses) and the rot16/rot8 masks are correct.
- **XOR bounds:**
  - `store_pair` writes offsets i·16 and 64+i·16 (i<4) at base +0 and +128, within the 256-byte chunk;
  - loads and stores are VEX with no alignment requirement;
  - spills are only the public counter and nonce;
  - both guards refuse before any batch, with the data left unmodified (tested).
- **UEFI:** zero ymm, zero VEX, no xgetbv, `chacha_xor` returns 0; `target_os="none"` is still compile_error.
- **Provider order:**
  - in both `Algorithm::opening` and `sealing` the order is memcpy storage, `__rust_alloc`, memcpy to heap, `AeadKey::as_ref`, `Key::initialize`;
  - the secret is first read after allocation, and the record is never copied afterwards;
  - `Key::initialize` writes the ChaCha key to `(%rdi)`, expands AES into `16(%rdi)`, and computes H in place by a tail call to `Aes::encrypt`.
- **Panic and unwind:**
  - before allocation, nothing has read a secret;
  - during initialize, the drop path of `Box<Seal>`/`Box<Open>` runs, and the `Secret` drops wipe the partial schedule;
  - abort is excluded, as documented.
- **unsafe:**
  - none is added by the provider delta, which has no `MaybeUninit` or zeroed storage;
  - in the AVX2 delta, `batches` and `store_pair` are sound: the feature is admitted at runtime, and every range stays inside the chunk.
- **The `#[inline(never)]` claim is accurately narrow:** it covers the provider record copy only, and the ChaCha key passes through xmm0/xmm1. The author's count of 160 AVX instructions, all in `batches`, matches (159 + `vzeroupper`).
