# note: automated review E of the eight-block VAES/VPCLMUL GCM candidate (automated review, not external audit): no BLOCKER, 6 NOTEs
re: 0042

**Automated review, not external audit.** A Claude model reviewed `3985c25568194d0ccf4c042bf029a7092b20ff01` in three ways: reading the source, rebuilding the release assembly, and checking against a software model. Every file:line is at that commit.

**Nothing ran on VAES silicon.**
- Rosetta 2 with `ROSETTA_ADVERTISE_AVX=1` reports leaf-7 ECX = 0.
- A VAES/VPCLMUL probe dies with SIGILL (exit 132).
- The t14 runs r0068–r0076 are the first execution of this path.

## What was done
- **Read:**
  - `src/arch/x86_64/vaes.rs`;
  - the dispatch in `src/arch/x86_64.rs` and the admission in `avx2.rs`;
  - `gcm.rs` and `aes.rs`;
  - `examples/negative_controls.rs`;
  - `tests/differential.rs` and `tests/wycheproof.rs`.
- **Assembly rebuilt** with Rust 1.98.1 (`cargo rustc --release --lib -- --emit asm`):
  - **x86_64-unknown-linux-gnu** (`std,rustls-provider`):
    - `avx2::batches`, `vaes::ctr` and `vaes::hash_blocks` are instruction-identical to your `x86_64-unknown-linux-gnu.s.gz` after label renumbering.
    - VEX/YMM instructions per function: 160, 75 and 467. Outside those three functions there are none, apart from the `xgetbv` in core's `__xgetbv`.
    - There is no `zmm`, no mask register and no xmm/ymm16–31 operand anywhere, so no EVEX encoding.
  - **x86_64-unknown-uefi** (`rustls-provider,sign,wpa2`): no VEX, no YMM and no XGETBV, and no `vaes` or `avx2` symbol.
  - **x86_64-unknown-none:** still stops at the `compile_error!`.
- **Model:** a lane-exact software model of `vaes.rs`. Each intrinsic is modelled per Intel's definition on two u128 lanes.
  - The model was compared against SP 800-38D Algorithms 1 and 2, transcribed separately. That reference reproduces the GHASH `f38cbb1ad69223dcc3457ae5b6b0f885` of the McGrew–Viega GCM test case 2.
  - 8,400 GHASH cases agree (200 random H and initial states × 0–41 blocks).
  - Each of four mutants is detected:
    - H^8/H^7 lanes swapped;
    - H^8 := H^7;
    - y XORed into lane 1;
    - the tail multiplied by H^2.
  - Every CTR input block is `nonce ‖ be32(j+2)`, from 128 B to 16 KiB, for both nonces tried.
  - **Limit:** the model encodes this reviewer's reading of the intrinsics. It is not hardware, and it is not independent of that reading.

## BLOCKER
None.

## NOTE
1. **Secret residue is wider than on the SSE path.** It stays within README.md:131-135 and VALIDATION.md:95-97, as your evidence README says.
   - **`vaes::hash_blocks` spills the H powers.**
     - The compiler hoists H^1…H^8 and their Karatsuba folds out of the loop.
     - It spills them in 16 stores across −128(%rsp)…+127(%rsp), and they are never wiped.
     - The SSE `hash_blocks` spills 7 × 16 bytes.
     - Squaring is a bijection on GF(2^128), so H^2, H^4 and H^8 each yield H.
   - **`vaes::ctr` returns with key material in registers.** `vzeroupper` clears only bits 128–255, and only ymm9 is overwritten by the output XOR. After return:
     - xmm0 holds round key 0, which for AES-128 is the key itself;
     - xmm13 holds round key `rounds−1`;
     - xmm10–12 hold three keystream blocks of the last batch.
   - The SSE `ctr` also keeps round key 0 in xmm0.
   - If register or spill erasure is ever claimed, both functions need `vzeroall` and a wiped frame.
2. **The two controls kill one specific mutant each. Neither covers lane order or tails.**
   - **`x86_vaes_counter`** (negative_controls.rs:114-121) changes `+ 2` to `+ 3` at vaes.rs:63.
     - Every batch counter shifts by one, so the CTR comparison (vaes.rs:228-241) goes red from 128 B on.
     - **It kills:** a wrong batch counter base.
     - **It does not exercise:**
       - lane order inside `counter_pair` (vaes.rs:38-47);
       - the pair stride (vaes.rs:64-67);
       - the store order (vaes.rs:84-90);
       - the tail counter (vaes.rs:95).
   - **`x86_vpclmul_power`** (negative_controls.rs:122-129) replaces H^8 with H^7 at vaes.rs:156.
     - The lane-0 basis bits (vaes.rs:261-273) go red.
     - **It kills:** a wrong top power.
     - **It does not exercise:**
       - the pairing order (vaes.rs:157-160);
       - y's lane (vaes.rs:165);
       - the tail multiplier (vaes.rs:189-192).
   - **The unit test does kill each of those, by reading:**
     - a swapped lane or stride: CTR at n ≥ 128;
     - the tail counter: n = 129, 255, 257, 383, 385;
     - a swapped pair or y in lane 1: the lane-0/1 basis bits, and the stream with state 0x91 at n ≥ 8;
     - the tail multiplier: n = 9–15, 17–23, 25–31, 33.
   - So the tests catch a wrong lane order, a wrong power and a wrong tail. The record demonstrates only the two mutants above.
   - Two one-line controls would put lane order and tails on the record: `let p0 = pair(h8, h7);` → `pair(h7, h8)`, and `+ 2` → `+ 3` at vaes.rs:95.
3. **Each new test makes several claims.** This is against HANDOVER.md:91.
   - **vaes.rs:220-283** asserts four things:
     - CTR equivalence;
     - final-pair serialization;
     - GHASH lane/bit;
     - GHASH partial batches.
   - **vaes.rs:201-219** mixes the mask predicate with host detection.
   - Both controls name the same test, so a control's exit code does not say which claim went red; only the log's assertion message does.
   - **The "final pair" check (vaes.rs:242-256) uses an input the batch loop never produces.**
     - It feeds `counter_pair` u32::MAX−1.
     - With at most 2^32−2 blocks (gcm.rs:63), the last batch has `first` = 2^32−14 and ends at counter 2^32−7.
     - MAX−1 and MAX come from the scalar tail (vaes.rs:93-99).
     - The check therefore proves the helper's lane order at the top of the u32 range, not at the end of a message.
     - For the same reason, the `wrapping_add` at vaes.rs:39 never wraps.
4. **The admission's OS-state gate and CPUID register are shown by reading and assembly, not by a test.** This is the same limit as review D NOTE 5.
   - The host comparison (vaes.rs:209-217) cannot see either mutation below on the two benches:
     - **Dropping `super::avx2::available()` (vaes.rs:17):** both benches enable YMM.
     - **Reading `.ebx` instead of `.ecx` (vaes.rs:26):**
       - On t14, EBX bits 9 and 10 (ERMS, INVPCID) are set just like ECX's VAES and VPCLMULQDQ bits.
       - On amd, both sides stay false, assuming Zen 2 lacks INVPCID. That rests on published feature lists and was not measured.
   - What does show both is the assembly:
     - every one of the four XGETBV calls follows `testl $0x1C000000` on leaf-1 ECX;
     - the VAES admission tests `$0x02000002` on leaf-1 ECX and `andl $0x600` on the leaf-7 ECX output.
   - **Keep `avx2` in both oracles.**
     - In Rust 1.98, `is_x86_feature_detected!("vaes")` and `("vpclmulqdq")` follow CPUID alone: std_detect `os/x86.rs:122-123` sits outside its `os_avx_support` block.
     - Your test oracle and the control skip (negative_controls.rs:190-200) are correct only because each also requires `avx2`, which std does gate on XCR0.
5. **MSRV 1.89 is unverified for x86.**
   - Cargo.toml declares `rust-version = "1.89"`.
   - Your evidence README:15 says the 1.89 check is ARM-only, so 1.89 has never compiled `vaes.rs`.
   - Rust 1.98's stdarch marks `_mm256_aesenc_epi128` and `_mm256_clmulepi64_epi128` stable `since = "1.89"`, under `target_feature(enable = "vaes")` and `("vpclmulqdq")`. So a build is expected to succeed, but none has been shown.
   - This Mac has no x86 std for 1.89.
6. **The H powers are recomputed on every call.**
   - vaes.rs:150-156 runs seven reduced multiplies, each three carry-less products and a reduction, on every call with at least 8 blocks.
   - `tag` makes one such call for AAD and one for data (gcm.rs:71-87).
   - For a single 128-byte batch, that setup (21 xmm products, 7 reductions) exceeds the batch itself (12 ymm products, 1 reduction).
   - The SSE path recomputes three powers per call.
   - Keeping H^1…H^8 in `Gcm`, wiped with `h`, would take the setup off every record. 0040's small-record rows will show whether it matters.

## Checked and sound
- **Admission:**
  - **OS state first.** vaes.rs:17 runs avx2.rs:14-43 first:
    - portable refuses (avx2.rs:15);
    - leaf-1 ECX must show XSAVE, OSXSAVE and AVX before XGETBV runs (avx2.rs:8, 34);
    - XCR0 & 6 must equal 6 (avx2.rs:11);
    - the max leaf must be at least 7, and leaf-7 EBX bit 5 must be set (avx2.rs:40-41).
  - **CPUID bits.** vaes.rs:7-11 and 26 then require, matching the SDM's CPUID enumeration:
    - leaf-1 ECX bit 25 (AES-NI) and bit 1 (PCLMULQDQ);
    - leaf-7.0 ECX bit 9 (VAES) and bit 10 (VPCLMULQDQ).
  - **Instructions covered.** VEX.256 VAESENC, VAESENCLAST and VPCLMULQDQ, the VEX.128 AES/PCLMUL forms inlined into the tails, and the AVX2 integer ops are all covered by that.
  - **AVX-512 is neither used nor needed,** so leaving XCR0 bits 5–7 unchecked is right.
  - **Call sites.** In the release build there is one call site each: a tail jump to `vaes::ctr` and a call to `vaes::hash_blocks`. Both are behind the length guard and both admission caches.
  - **Caching.** The cache is a Relaxed `AtomicU8` holding a public bool; a race only recomputes it.
  - **On ToyOS today** CR4.OSXSAVE is clear, so the path is refused at avx2.rs:34, before XGETBV.
- **Lane order:**
  - **CTR (vaes.rs:33-49, 59-67, 84-90):**
    - `_mm256_set_epi32` takes e7…e0, so e3 holds `be32(first)` in bytes 12–15 and e7 holds `be32(first+1)` in bytes 28–31.
    - Over the broadcast `nonce ‖ 0`, block j of batch i gets counter 8i+j+2, which is SP 800-38D's inc32(J0) sequence for a 96-bit IV.
    - The tail resumes at `8·batches + i + 2` (vaes.rs:95).
  - **GHASH (vaes.rs:157-169):**
    - Block 2k is in lane 0, paired with H^8, H^6, H^4 and H^2; block 2k+1 is in lane 1, paired with H^7, H^5, H^3 and H^1. `pair` puts its first argument in lane 0 (vaes.rs:137-139).
    - y enters lane 0 of the first register only.
    - The result is (y+x0)H^8 + x1H^7 + … + x7H, which equals eight steps of Algorithm 2.
- **Powers and reduction:**
  - **Powers.** The exponents at vaes.rs:150-156 are 2, 3, 4, 5, 6, 7 and 8.
  - **Bit order.**
    - `reflect` (vaes.rs:106-116) is a per-byte bit reversal: the nibble table is correct, and the 16-bit shifts cannot carry across bytes after masking.
    - It equals `reflect_bytes` (x86_64.rs:255-272). Register bit k is therefore the coefficient of x^k in SP 800-38D's bit order.
    - No one-bit post-shift is needed, unlike the white paper's byte-reflected form.
  - **Multiply.** `product` (vaes.rs:120-133) is the white paper's Karatsuba with three carry-less products. The `_mm256_s{l,r}li_si256::<8>` shifts act within each 128-bit lane.
  - **Aggregated reduction.** Summing unreduced products across lanes and registers, then reducing once (vaes.rs:175-186), is the white paper's aggregated reduction. It is valid because reduction mod P is GF(2)-linear.
  - **`reduce_vectors`** (x86_64.rs:288-320) folds high·x^128 as high·(x^7+x^2+x+1):
    - the 128-bit shifts are built from 64-bit shifts with 63/62/57 carries;
    - the overflow `(h>>127)⊕(h>>126)⊕(h>>121)` is folded once more and cannot overflow again;
    - it is correct for any 256-bit input.
- **Bounds and tails:**
  - **CTR memory.**
    - Four 32-byte unaligned accesses at 0, 32, 64 and 96 inside each `[u8; 128]`.
    - The tail is processed in 16-byte chunks, the last one partial via `zip`.
    - Round-key offsets stay at or below 240, since `rounds` is 10 or 14 (aes.rs:53, 56, 72-76).
  - **GHASH memory.**
    - Four 32-byte loads inside each `[[u8; 16]; 8]`.
    - At most 7 tail blocks.
  - **Counter range.**
    - gcm.rs:63 refuses more than 2^36−32 bytes before any CTR or GHASH.
    - So batch counters stay at or below 2^32−7, tail counters at or below u32::MAX, and no u32 arithmetic overflows.
  - **Order.** `open` still compares the tag before decrypting (gcm.rs:137-141).
  - **Shipped codegen.**
    - In the release library, both functions enter their batch loop without an empty check. LLVM proved from the only call sites (x86_64.rs:238, 366) that a batch exists.
    - The unit-test build calls them with shorter inputs and compiles a different shape.
    - **Wycheproof** reaches the shipped shape:
      - tcId 19-26 and 108-115: ciphertext of 128–513 B;
      - tcId 31-38 and 120-127: AAD of 128–513 B.
    - **The RustCrypto `aes-gcm` differential** also reaches it at 128 B–16 KiB. Its AAD is at most 33 B, so only Wycheproof reaches the VAES GHASH over AAD.
    - **gcm.rs:164-190** does too, at 8–19 blocks against the portable multiply.
- **Target isolation:**
  - `mod vaes` is `cfg(not(target_os = "uefi"))` (x86_64.rs:13-14).
  - The kernel targets hit `compile_error!` (arch/mod.rs:10-16).
  - The four `#[inline]` target-feature helpers are inlined only into the two admitted functions.
  - Each function has one exit, and `vzeroupper` runs before it.
- **Secret independence:**
  - Branches, loop counts and addresses depend only on lengths, the public round count and the cached admission bit.
  - `reflect`'s PSHUFB indexes a register constant (vaes.rs:107-115). There is no table in memory.
  - Whether VAESENC and VPCLMULQDQ run in data-independent time is a hardware property that reading cannot establish. 0041 on t14 is the only sweep that reaches this path, since amd has no VAES.
