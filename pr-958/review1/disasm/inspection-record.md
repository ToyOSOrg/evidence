# Emitted-code inspection of the symmetric routines (ruling 1)

**Binary:** the shipped `crypto_parity` guest binary at 1e6a536ba, target x86_64-unknown-toyos, profile `toyos` (opt-level 2, debug assertions and overflow checks on). Disassembled with GNU objdump 2.47.

**Files:**
- `final-toyos.dis`: the full disassembly.
- `final-inspection.txt`: per routine, its instruction and conditional-branch counts.
- `final-table-lookups.txt`: every indexed memory operand whose base register was loaded from a RIP-relative table address.

## Addresses

The scan is linear and does not follow control flow, so each hit was read in context. It reports two kinds.

- **The AES short path (`aesni::short_rounds`, both round counts), two hits each, false positives.** The RIP-relative `lea` into the base register sits on a bounds-check path ending in `panic_bounds_check`, which never returns. The indexed load is an aligned read of the GHASH key powers at 16 × the block count, which the public message length sets.
- **The only real static-table indexing:** `hash::compress256`/`compress512` and their BMI2 instantiation. Both read K256/K512 at `passes[pass]` and `k[i]`. The index is the round pass number, the same for every input.

- **AES:** S-box lookups don't exist on the instruction paths (AESENC). The portable S-box computes the inversion in GF(2^8) with masks; that path is unchanged.
- **GHASH:** uses no table on any path; CLMUL on the instruction paths, masked shift-and-add on the portable one.
- **ChaCha20 and Poly1305:** have no tables at all.
- **PSHUFB controls:** the shuffle masks (byte reversal, the rotates by 16 and 8) are constants held in registers. Data never indexes memory.
- **Every other indexed operand:** comes from walking buffers by whole chunks at offsets set by the public length, or from indexing fixed-size arrays (round keys, hash-key powers, state words) at compile-time or loop-counter indices.

## Branches

Every conditional branch in these routines tests one of the following:
- a public length (message, AAD, tail, batch count);
- the round count (10 or 14);
- the cached CPU feature word;
- a loop counter;
- a Rust bounds, overflow or debug-assertion check on such a value;
- the Option/None of a short-path size check (a length test).

Branches that depend on secret values were looked for at the points where a secret result is chosen. None exists:
- **Poly1305 final reduction:** `ct::select` over the borrow mask.
- **Tag comparison:** `ct::equal`, an OR-accumulate whose result passes through a volatile read.
- **GCM portable multiply:** masks from `ct::opaque`.
- **The new `block::word`/`write`/`terminated`/`place`:** branch only on the public length; the bytes are shifted and masked.

Authentication failure is a public outcome. Each open authenticates first and returns early without touching the ciphertext.

## Counter carries

The guest sweep against ring cannot reach a counter carry past 2^32 blocks. The carries are settled by inspection:
- **The vector ChaCha20 paths** form each block's counter as `counter.wrapping_add(j)` in 64 bits. They split it into low and high words per lane (`eight`, `counter_rows`), which is the original construction's 64-bit counter. For RFC 8439 the caller's bound keeps the low word from carrying into the nonce word.
- **GCM's 32-bit counter** is formed by `wrapping_add` on `u32` throughout, and GCM's length check bounds the block count below 2^32 − 2.

## Limits

- **Source-level tracing only.** The branch and index inputs were traced from the source to these categories; this is not a machine-checked data-flow proof. Statistical leakage testing is the stage-4 fixed-versus-random harness, a separate PR by ruling 1.
- **One target.** The UEFI loader target and AArch64 builds were not inspected. The x86 instruction modules don't compile there; those builds carry the portable paths, and the portable code this PR changed (`block.rs`, `secret.rs`, Poly1305 in radix 2^64, the SHA-2 round macro) has the same branch and address structure on every target, but its emitted code there is not inspected.
