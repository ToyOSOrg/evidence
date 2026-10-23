# Round 3: constant time at the head, and the emulation

- `t14-ct-7c860ab7b/`: the T14 `cryptoctcurvescase` boot at 7c860ab7b (#993's curves harness,
  1,000,000 measurements a routine), DOITM off, Intel signature 0x806c1, microcode 0xbe. Verdict
  passed. The harness's lines and cpu0's microcode line, from the boot's kernel log:
  - P-256 public key: pass, max |t| 1.72; P-256 agreement: pass, 2.78.
  - P-384 public key: pass, 2.79; P-384 agreement: pass, 1.49.
  - Ed25519 key derivation and signature: pass, 1.70.
  - Controls: null 2.57 and 1.79 (pass); leaky 455.97 and 1,005.05 (detected).
  The finding recorded at 7a36687d0 (P-256 public key and agreement, and P-384 agreement, leaking)
  does not reproduce on this code.
- `emulation/`: `emulate.py` executes the `asm!` templates of `lib/crypto/src/arch/x86_64/p256.rs`
  on named registers with CF and OF (an undefined flag read fails) and checks them against
  integers. `emulate.log`: its run on the review head's file (templates unchanged from
  7c860ab7b): 200,121 products and 200,011 squares match. Its negative controls (a dropped carry in
  each kernel and an inverted `cmov`) failed in the agent's runs; they are not logged here.
