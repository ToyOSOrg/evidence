# Machine-code inspection of `divsteps::invert` at 48d06c8e1 (#1043 r2)

Shipped profile (`[profile.toyos]`: opt-level 2, debug assertions and overflow checks on), library
build, not a test build:

    cargo build -p toyos-crypto --profile toyos --target x86_64-apple-darwin
    cargo build -p toyos-crypto --profile toyos --target aarch64-apple-darwin
    objdump -d --no-show-raw-insn -M intel target/x86_64-apple-darwin/toyos/libtoyos_crypto.rlib
    objdump -d --no-show-raw-insn target/aarch64-apple-darwin/toyos/libtoyos_crypto.rlib

(GNU objdump 2.47, `objdump-version.txt`.) `divsteps::invert` is not inlined: each modulus
is one monomorphised function, `...divsteps6invert...nist9P256FieldKj4_...` and
`...nist9P384FieldKj6_...`. Their full disassembly is in `invert-*.s`.
The order instances are the same code with other constants, and `all-*.s` holds them.

Every control transfer in the four functions (`branches.txt`, conditions shown below):

| kind | x86_64 P-256 | x86_64 P-384 | aarch64 P-256 | aarch64 P-384 | condition |
|---|---|---|---|---|---|
| 62-step divstep loop | 1eb | 1aca | 144 | 11c4 | `dec eax` / `subs w8, #1`, a constant count |
| limb loops of `apply`/`update` | (unrolled) | 1c01, 1e16 | (unrolled) | (unrolled) | `cmp r8, 7`, a constant count |
| batch loop | 9b7 | 1e40 | 638 | 1908 | `cmp ..., 12` / `0x12` (18), a constant count |
| `debug_assert!` low 62 bits zero (`apply`, `update`) | 28a, 395 | 1b16, 1d05 | 1a0, 258 | 1220, 12dc | `test`/`tst` of bits the matrix always clears: never taken |
| `assert_eq!(rest, 0)` | 9e5 | 1e75 | 650 | 1930 | g's limbs, zero by Theorem 11.2: never taken |
| return | b9a | 20cd | 75c | 1aac | |
| panic calls | bae, bc6, bef | 20e1, 20f9, 2122 | 774, 78c, 7b4 | 1ac4, 1adc, 1b04 | only behind the asserts. On x86_64 the `call` targets read as the next instruction because the relocations to `core::panicking` are unresolved in the rlib |

The divstep loop's body is branch-free mask arithmetic, and it has no memory access indexed by
data. The masks come from `sar`/`asr` of η and from g's low bit, through the register barrier.
No `cmov`/`csel` is selected on an operand. The only operand-dependent comparisons are the
asserts' tests, whose values are constant (always zero) for every valid input.
