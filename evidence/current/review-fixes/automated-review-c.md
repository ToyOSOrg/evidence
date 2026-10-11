# Automated adversarial review C: rustls provider, RSA, ECDSA, ML-KEM hybrid (tree 2af52e453)
This is a Claude model review, not an external audit. The tree's suite passed (45 tests), and so did every extra check listed below.

## BLOCKER
None.

## NOTE
1. **A sealer refusal is a panic.** rustls 0.23.45 `.unwrap()`s `encrypt` (`record_layer.rs:113-117`), so every refusal in `Seal::encrypt` aborts the process: the sequence check (`src/rustls_provider/cipher.rs:127`), the size check (`:130`) and the GCM counter cap (`src/aead.rs:70`).
   - None is reachable through rustls today: it resets seq on each new sealer, never hands over more than 16384 bytes, and its 2^23 record limit sits far below the u32 cap.
   - Separately, `:131` reports a local oversize as `PeerSentOversizedRecord`, which wrongly blames the peer.
2. **No check on the randomness.** `Backend::new` (`mod.rs:32`) accepts any `&'static dyn SecureRandom` with no health check, so a constant source gives predictable keys:
   - X25519 makes a valid key from all-zero bytes (`x25519.rs:17-26`);
   - ML-KEM key generation is fully determined by its 64-byte seed;
   - only P-256/P-384 notice a bad source, and only for invalid output.

   Read errors do propagate (`kx.rs:17`, tested). Seeding rests on the caller alone, and no type enforces it.
3. **Extra round trip against classical-only servers.** `hybrid_component`/`complete_hybrid_component` are not implemented. With X25519MLKEM768 offered first, only the 1216-byte hybrid share is sent, so a server without ML-KEM forces a HelloRetryRequest (the tree's `default_hybrid_offer_retries_with_classical_ring_server` shows it). ring and aws-lc-rs send the X25519 component alongside.
4. **RSA keys are capped at 4096 bits** (`rsa.rs:64`, `verify.rs:89`, more than 530 bytes refused). ring allows up to 8192. This is interoperability, not security.
5. **Policy: TLS 1.2 is advertised**, but only six ECDHE+AEAD suites: no CBC, no RSA key exchange, no SHA-1, no finite-field groups (`mod.rs:57-67, 124-136`). Whether that fits ToyOS's zero-legacy rule is for the owner to decide.

## Checked and sound
- **Nonces:**
  - the sealer owns its counter and computes iv XOR seq, taking no nonce from outside (`aead.rs:58-83`), and seq must equal its own count (`cipher.rs:127`);
  - TLS 1.2 GCM nonces are the fixed 4 bytes plus an explicit part of key-block XOR seq, as ring does;
  - ChaCha20-Poly1305 nonces are IV XOR seq;
  - each traffic key gets exactly one sealer, and a key update makes a new one at zero;
  - the authenticated record headers are right for TLS 1.3 (with the tag) and TLS 1.2 (plaintext);
  - short records are refused before any underflow.
- **RSA DER** (`verify.rs:47-102`):
  - lengths use the shortest form, long form at most 2 bytes, no leading zero, nothing below 128 in long form;
  - integers are minimal and non-negative, with nothing trailing;
  - keys must be at least 2048 bits with an odd modulus and an odd e from 3 to 2^32. e=1, e=2, an even modulus, 2047 bits and a 5-byte e are all refused (run);
  - the signature is exactly the modulus length and below the modulus.
- **PKCS#1 v1.5 (the Bleichenbacher '06 class):** the full expected encoding is rebuilt and compared exactly (`rsa.rs:186-207`). Six malformed encodings, each signed with an e=3 key, were all refused: trailing garbage, an absent NULL, block type 2, a non-FF padding byte, a long-form length inside DigestInfo, and fewer than 8 padding bytes. The well-formed encoding was accepted.
- **PSS** (`rsa.rs:210-249`):
  - the salt length equals the hash length, MGF1 uses the same hash, and a zero salt is refused;
  - the trailer, the top-bit mask and the leading zero byte when the modulus length ≡1 mod 8 are all checked;
  - it agrees with the `rsa` crate at 2049, 3073, 4095 and 4096 bits, with SHA-256, -384 and -512, for both PKCS#1 and PSS.
- **ECDSA:**
  - a SHA-384 hash on P-256 is truncated to its leftmost bytes, and a SHA-256 hash on P-384 is left-padded (`verify.rs:145-153`), per SEC 1;
  - a hash value of n or more is reduced (`nist.rs:195`), confirmed against `p256` and `p384`;
  - the DER is strict (`nist.rs:209-246`): short form only, minimal integers, nothing trailing, r and s in [1, n−1];
  - TLS 1.3 maps each scheme to its matching curve first.
- **X25519MLKEM768:**
  - the order is the ML-KEM key (1184) then X25519 (32); the server sends the ciphertext (1088) then X25519; the secret is ML-KEM's then X25519's (`kx.rs:53-69,144-153`, `hybrid.rs:20-25`), as the IETF draft specifies;
  - lengths are exact, and an all-zero X25519 result is refused.
  - FIPS 203: a key coefficient of 3329 or more is refused (`mlkem.rs:191-204`; coefficients 3329 and 4095 were tested through the provider), and the ciphertext length is checked;
  - implicit rejection compares in constant time and returns J(z‖c), matching RustCrypto `ml-kem` 0.2.1 byte for byte, with identical public keys from the same seed;
  - key generation uses G(d‖3) and encapsulation G(m‖H(ek)).
- **Advertised = implemented:**
  - the advertised suites, the four groups (the hybrid in TLS 1.3 only) and the ECDSA P-256/P-384, Ed25519, PSS and PKCS#1 schemes over SHA-256/384/512 are all implemented;
  - nothing with SHA-1, P-521 or a finite-field group is advertised;
  - loading a signing key is refused;
  - Ed25519 refuses small-order keys and R values, and non-canonical S.
