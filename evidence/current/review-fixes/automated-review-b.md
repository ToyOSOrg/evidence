# Automated adversarial review B: AES/GHASH, ChaCha, SSH cipher, dispatch, UEFI, erasure, unsafe (tree 2af52e453)
This is a Claude model review, not an external audit.
- Run on an arm64 Mac, with both the ARM AES/PMULL path and the portable path.
- **The x86 code paths were not executed**, because no x86 std target is installed. x86 rests on reading the source, cross-builds, and the emitted UEFI assembly.

## BLOCKER
1. **The crate doesn't compile for `x86_64-unknown-none`** (the ToyOS kernel target), even with `--features portable`. `cargo build --lib --target x86_64-unknown-none` stops with `rustc-LLVM ERROR: Do not know how to split the result of this operator!` in debug, release and portable builds.
   - **Cause:** `src/arch/x86_64.rs:77-130` selects the SSE-intrinsics path for anything that isn't UEFI (`#[cfg(not(target_os = "uefi"))]`), and that includes soft-float `none`. ToyOS sets `none` at `src/arch.rs:83`. A bisect confirmed it: widening the cfgs to `any(uefi, none)` builds.
   - **The naive fix is unsafe:** the ToyOS kernel saves no XMM state around its own code (ToyOS `kernel/src/arch/x86_64/idt/device_irq.rs:33`), so running the intrinsics path in the kernel would clobber the interrupted user's registers. The kernel needs the portable path, or the UEFI-style save and restore.
   - The author's target matrix (`evidence/final-targets.txt`) lists only `x86_64-unknown-uefi`, which is why this went unseen.
   - The kernel has no crypto consumer today, but the handover claims a `no_std` core usable by the kernel.

## NOTE
2. **AArch64 never uses hardware AES without `std`, and falls back to portable silently** (`src/arch/aarch64.rs:34-65`: without `std` and without `initialize_aarch64`, AES and PMULL are always off; x86 detects through CPUID with no such condition).
   - A randomized AEAD probe took 14.1 s without `std` against 0.11 s with it.
   - `rustls-provider` doesn't imply `std`, so a ToyOS aarch64 consumer stays portable unless it enables `std` and the fork's `std_detect` reports the features.
3. **`aarch64-unknown-none-softfloat` builds only with `aarch64_softfloat_neon` future-incompatibility warnings** at all 8 `#[target_feature(enable="aes,neon")]` sites ("will become a hard error").
   - Safe today, because the hardware path stays off unless `initialize_aarch64` is called.
   - But that function's safety contract doesn't say that kernel or EL1 callers would clobber unsaved user FP state.
4. **Moves leave secret copies, shown in the generated code.** In the AArch64 release assembly of `Tls13AeadAlgorithm::encrypter`:
   - `sealing()` builds the key in a stack buffer of about 624 bytes;
   - `memcpy` copies it into the `Seal` slot;
   - `__rust_alloc` and a second `memcpy` move it to the heap.

   Both stack copies hold the expanded AES schedule and H (or the ChaCha key) and are never wiped, for every traffic key. In source: `aead.rs:31-56,86-101` (Gcm moved into Key) and `cipher.rs:25-34` (the `[u8; N]` from `try_into`).
5. **Unwiped copies in source:**
   - `chacha.rs:52-57`: `state: [u32;16]` holds the key words and is `Copy`. `rounds(state)` wipes only its own copy, and `words()` returns its array by value.
   - `gcm.rs:119`: in `Gcm::open`, the expected tag is a plain `[u8;16]` that isn't wiped on failure. It would allow a forgery for that exact (nonce, aad, ct).
   - `ssh.rs:17-18`, `ssh.rs:119`: the same pattern.

   Each is fixed by keeping the value in a `Secret`.

## Checked and sound
- **AES:**
  - key expansion is correct for 128 and 256 bits (SubWord at `at%32==16`, rcon via `xtime`);
  - the hardware SubWord trick on ARM is correct;
  - the portable S-box and the WPA2 inverse cipher are correct and free of tables and branches;
  - round-key loads stay inside the 240-byte schedule.
- **CTR counters:**
  - `Gcm::check` caps the length at 2^36−32 bytes, so the last counter is exactly 2^32−1 on both paths;
  - on ARM: at most 2^30−1 batches, a largest batch counter of 2^32−3, and the tail ending at 2^32−1;
  - the batch and tail indices are correct.
- **GHASH/POLYVAL:**
  - x86 native and UEFI: Karatsuba in reflected order, then the x^7+x^2+x+1 fold with its carry;
  - ARM: the `reduce_vector` lane carries, the H²/H³/H⁴ powers and the `(y+x0)H⁴+x1H³+x2H²+x3H` batching are correct;
  - tails take the per-block path;
  - the H-power checks and the exhaustive basis test pass on ARM under `std`.
- **Tags (GCM, ChaCha, SSH):**
  - the tag is computed over the ciphertext and compared with `ct::equal` before any XOR, and a refused open leaves the ciphertext unchanged;
  - a wrong tag length is refused, and nonces are 96-bit by type;
  - `SealingKey` refuses GCM once `next >= u32::MAX` and stays refused after `u64::MAX`.
- **ChaCha20-Poly1305:**
  - at most 2^32−1 blocks from counter 1, which is RFC 8439's 2^38−64 bytes;
  - the Poly1305 limbs peak around 2^57.6, which fits a u64 with room to spare.
- **OpenSSH packet cipher:**
  - K_2 is the first 32 bytes;
  - the length uses K_1 at counter 0 and the payload starts at counter 1;
  - the Poly1305 key comes from counter 0, and the MAC covers the encrypted length and payload;
  - the sequence is terminal after `u32::MAX`.
- **Dispatch:**
  - x86 admits on CPUID.1:ECX bit 25 (AES) and bit 1 (PCLMUL), with SSE2 the baseline;
  - ARM requires the ID_AA64ISAR0 AES field to be 1 or 2, and exactly 2 for PMULL;
  - the hardware flags are fixed per key at import, and `portable` disables every hardware path;
  - no path runs an instruction it didn't admit, and none skips the portable path wrongly.
- **UEFI soft-float:**
  - in the emitted `x86_64-unknown-uefi` assembly, XMM is used only inside the two `asm!` blocks (`Aes::encrypt`, `arch::ghash`);
  - XMM0-1 and XMM0-4 are saved first and restored last, and XMM6-15 are never touched;
  - the saved bytes and intermediates sit in `Secret` buffers;
  - `aarch64-unknown-uefi` is hard-float and stays portable unless initialized.
- **Unsafe:**
  - every intrinsic load and store stays inside its fixed array or 64-byte batch;
  - the transmutes are between same-size types;
  - the `asm!` memory effects are declared correctly (no `nomem`; inout pointers);
  - the volatile wipes and `ct::opaque` are sound.

## Runs
- **Full suite on ARM with hardware** (`--features std,wpa2,sign,rustls-provider`): green. It covers the Wycheproof AES-GCM and ChaCha20-Poly1305 suites, RFC 8439, NIST GCM and the OpenSSH differential.
- **The same suite with `portable`:** green.
- **A 3000-case randomized seal/open probe** against the `aes-gcm` and `chacha20poly1305` crates (lengths 0-3000, AAD 0-300, single-bit tag flips, truncated tags), hardware and portable: green.
- **Not executed:**
  - the x86 AES-NI and CLMUL paths (native and UEFI);
  - the 2^32 counter boundaries, which would need 64-256 GiB of data, so they rest on the arithmetic above.

## Suggestion
Add `x86_64-unknown-none` and `aarch64-unknown-none-softfloat` to the target matrix, built without warnings.
