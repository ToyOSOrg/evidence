# Machine-code inspection at 6ea592362 (crypto-25519 round 1)

Shipped profile (`[profile.toyos]`: opt-level 2, debug assertions and overflow checks on).

- **x86_64-unknown-toyos**: the guest binaries the staged images carry,
  `tests/guest/rust-tests/target/x86_64-unknown-toyos/toyos/crypto_constant_time{,_curves}`
  (copied to `bin/`, SHA-256 in `SHA256SUMS`), disassembled with
  `objdump -d --no-show-raw-insn -M intel` (GNU objdump 2.47).
- **x86_64-unknown-uefi**: the loader the staged images carry, `bin/bootloader.efi`.
- **AArch64**: `cargo build -p toyos-crypto --features sign --profile toyos --target aarch64-apple-darwin`,
  `objdump -dr` of the rlib (the toyos AArch64 sysroot is not built outside the image build; the
  representation there is the five limbs, unchanged).

`inspect.py` lists every control transfer and conditional select or set in the secret-path
functions (X25519 `agree`, `public_key`; Ed25519 `base_mul`, `Niels::select`, `add_niels`,
`Completed::{point,projective}`, `Projective::{double,encode}`, `sign`, `from_seed`; the field's
`invert`, `pow_2_250_1`, `square_times`, `bytes`, `select`, `swap`, `eq`, `is_zero`,
`is_negative` and the portable products), with the two instructions before each:
`branches-ct-x86-toyos.txt`, `branches-ctc-x86-toyos.txt`, `branches-aarch64.txt`.

## x86-64

The BMI2/ADX kernels are inlined: `agree` holds 196 `mulx` (one ladder step's nine
multiplications and squarings, plus the final multiplication), and its stack references fell from
1,368 (main 40e528614, five limbs, x86_64-apple-darwin rlib `agree.s`) to 726. The loader carries
the kernels (1,068 `mulx`, 768 `adox`).

Every transfer in those functions is one of:

| kind | shape | data |
|---|---|---|
| feature dispatch | `mov eax,[FEATURES]; test eax,eax; jns` (cache read) and `test eax,0x820; jne` (BMI2 bit 5, ADX bit 11) around each kernel, falling to `mul_portable`/`square_portable` calls | CPUID: public |
| loop counters | ladder `add r8,-1; jae`, `Niels::select` `cmp r10,0x358`, `base_mul` `cmp r13,0x20`/`0x41`, recoding `cmp rax,0x3f`, `square_times` `dec r14d; je` | constant counts |
| `copy_from_slice` overlap precondition | `sub; sub; cmovb; test; je` to `panic_nounwind_fmt` in `bytes` | stack addresses |
| carries to registers | `setb` after `adc`/`add` in the portable additions | arithmetic, no transfer |
| scalar bit | `bt eax,edx; setb sil` in the ladder | arithmetic, no transfer |
| all-zero shared secret | OR of the 32 output bytes, `setne; test; je` | the refusal, as on main |
| SHA-512 bookkeeping in `sign`/`from_seed` | buffer lengths and the bit count's shifts (`cmovne` on `test cl,0x40`) | message lengths: public |
| calls and returns | | |

No branch, `cmov` or `set` takes a secret field element, scalar digit or table index.

## AArch64

As before this change: the radix-51 code paths keep their form. Conditional instructions are
loop counters, `cset` of carries, `bytes`'s `copy_from_slice` precondition (`cbz` to
`panic_nounwind_fmt`), and in `Niels::select` one `cmp x1,#0; cset w22,eq` per table entry, where
LLVM computes the entry match `1 ^ nonzero(magnitude ^ (j + 1))` with a compare. `cset` is a
conditional select, not a transfer; the function and its codegen are unchanged by this branch.
