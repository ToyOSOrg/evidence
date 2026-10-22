# Generated-code inspection of #992's secret paths, at 41e89b9ec

## How

- Compiler: the ToyOS sysroot toolchain, `rustc 1.99.0-dev` (sysroot key a03cb6dab349a212).
- Profile: `[profile.toyos]` of `tests/guest/rust-tests` (opt-level 2, debug assertions and overflow checks on), as every guest binary ships. `toyos-crypto` has the `sign` feature, as the guest workspace enables it.
- Command, per target (`x86_64-unknown-toyos`, `aarch64-unknown-toyos`):
  `RUSTUP_TOOLCHAIN=<sysroot> cargo rustc -p toyos-crypto --profile toyos --target <target> --lib -- --emit asm`, run in `tests/guest/rust-tests`.
- `branches.py` walks the static call graph inside the crate from each secret entry point. It lists every function reached, its calls, and every conditional branch with its context. For aarch64 `b.cond` it also gives the nearest earlier flag-setting instruction.
- Entry points:
  - P-256 and P-384: `SecretKey::agree`, `SecretKey::public_key`;
  - Ed25519: `SigningKey::sign`, `SigningKey::from_seed`;
  - X25519: `SecretKey::agree`, `SecretKey::public_key`.
- The files `{x86,arm}-{p256,p384,ed25519,x25519}.txt` are the script's output.

## Branches: every conditional branch reached, classified by reading

| path | x86-64 | aarch64 | classification |
|---|---|---|---|
| P-256 | 19 | 18 | Loop counters in `Point::mul` and `Residue::mul`. Bounds checks on the public output length in `to_be`. Bits of the public exponent p − 2 in `invert`. `affine`'s infinity check, and `agree`'s and `public_key`'s test of its result: always finite for a validated scalar and point, so the outcome never varies. |
| P-384 | 14 | 14 | The same, with N = 6. |
| X25519 | 8 | 8 | The 32-byte decode loop and the 255-step ladder counter, both public. `square_times`' counter. Slice bounds in `bytes` (constant indices). `agree`'s refusal of an all-zero result, which the module contract discloses. |
| Ed25519 sign | 44 | 122 | The hash's public lengths and its round index (on aarch64, `compress512`'s `cbz x5` is the round counter, from `sub x5, x5, #1; cmn x5, #5`). Loop counters in `Point::mul`, `S::reduce` and `S::mul`. Bounds checks in `bytes`. |

- No conditional branch in `Point::double`, `Point::add`, `Point::select`, `Residue::mul/add/sub` or the 2^255 − 19 field operations depends on anything but a loop counter.
- Masks come from `ct::mask` through the register barrier: an empty `InlineAsm` followed by `neg`.
- On aarch64 two loop branches have their flag setter far back: `Point::mul` (Ed25519) on `cmn x22, #1`, and the X25519 ladder on `cmn x7, #1`. In both, x22 and x7 are the loop index (`lsr x10, x7, #3` and `and x11, x7, #7` are i / 8 and i % 8). No flag-setting instruction lies between the setter and the branch.

## Erasure in the shipped code (x86-64)

- `x86-4p256NtB5_9SecretKey5agree.s`, `p256::SecretKey::agree`, after `to_be` writes the output:
  - volatile zero stores over x (4 words), y (4 words, split across slots) and the product `Workspace` (6 × 16 bytes; each 16-byte volatile store is lowered as store-to-temporary, load, store-to-destination);
  - then the consumed secret scalar (4 words);
  - each group is followed by a `#MEMBARRIER` (the compiler fence).
  - The local output `Secret<32>` is built at −96(%rbp) and copied by value into the caller's `SharedSecret`. That local copy is not erased: it is a by-value move, which the contract lists as not erased.
- `x86-6x255198multiply.s`: after `Tight::bytes`, the shared value's `Workspace` and the ladder `Workspace` are overwritten with zeros.
