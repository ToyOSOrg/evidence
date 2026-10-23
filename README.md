# ToyOS PR #1049: the AVX2 Poly1305 kernel inlines whatever the build's partitioning

Base: main 4dc75f542. Fix: c9a3f65e1 (branch wt/poly1305-inline). Paths are masked ($HOME, $DEV, $SCRATCH, $TMP).
No binaries are published: they embed build paths.

## x86_64 disassembly of `toyos_crypto::arch::x86_64::poly1305::blocks`

`source/tools/calls.py` takes a function's llvm-objdump output and finds its loops (backward branches). It lists
each call, resolving GOT slots through the binary's R_X86_64_RELATIVE relocations and symbol table, and marks
whether the call is inside a loop.

ToyOS image (ToyOS toolchain, x86_64-unknown-toyos, [profile.toyos]), from `cargo run -- --build-only`,
non-incremental with `CARGO_INCREMENTAL=0`:
- `disasm/image/{fileserver,sshserver}-inc-c9a3f65e1.*`: no call in the loop; one `panic_const_add_overflow` after it.
- `disasm/image/{fileserver,sshserver}-noninc-c9a3f65e1.*`: the same.
- `disasm/image/{fileserver,sshserver}-noninc-4dc75f542.*` (control: the whole change reverted, via
  `source/controls/revert-whole-change.patch`): `Multiplier::product` called twice in the loop and twice after it.
  `IntoIter::<__m256i, 5>::reduce` and the add closure are out of line.

Linux probe (nightly-2026-07-22, x86_64-unknown-linux-musl, toyos-crypto at opt-level 2, 256 CGUs, debug assertions):
- `disasm/probe/crypto-oracles-shipped-{inc,noninc}-{4dc75f542,c9a3f65e1}.*`: the same picture. The base
  non-incremental build calls `product` in the loop; the other three don't. The incremental base and fix `blocks`
  are instruction-identical.
- `*.arch-calls.txt`: every `toyos_crypto::arch::x86_64` function's calls. In the fixed builds no loop holds a call
  other than a panic path.
- `*.arch-syms.txt`, `*.core-generics.txt`: out-of-line arch helpers and core generics over toyos_crypto items.
- `crypto-oracles-shipped-noninc-c9a3f65e1+product-outlined.*`: the scratch `#[inline(never)]` control
  (`source/controls/product-outlined.patch`), which reproduces calls in the loop.
- `logs/remarks-noninc-*-poly1305.txt`: LLVM `-Cremark=inline`, non-incremental. Base: product not inlined into
  blocks, cost 825 against threshold 569. Fix: inlined, cost 250 against threshold 974.

## aarch64

`disasm/arm/`: aarch64-apple-darwin, the same toyos-crypto profile, both modes, base and fix. `sha256_blocks` and
`sha512_blocks` contain no calls in any of the four builds; codegen differs only in scheduling and registers.

## Checks at c9a3f65e1

- `logs/ci-host.log`: `cargo run -- --ci host`, exit 0, "Host: 102 step(s), all green".
- `logs/build-only.log`, `logs/build-only-noninc.log`, `logs/build-only-noninc-base.log`: exit 0 each.
- `logs/rosetta-test-*.log`: toyos-crypto's lib tests under Rosetta (x86_64-apple-darwin), base and fix alike:
  61 passed, and 2 environmental failures (Rosetta has no SHA-NI; the ACVP file sits outside the extracted copy).
  Rosetta admits no AVX2, so the AVX2 kernel doesn't run there.

## Staged for the benches (not yet run)

`staged/README.txt` and `staged/SHA256SUMS`: probe binaries (base and fix, incremental and not, plus the outlined
control) timing ChaCha20-Poly1305 at 0 B to 64 KiB against ring, OpenSSL and AWS-LC. Also toyos-crypto's unit and
differential tests for Linux and their one-wrong-limb mutant (`source/controls/product-wrong-term.patch`).
`source/` is the probe and build scripts.

## Bench results (round 1, both benches; `bench/{t14,amd}/`)

Every oracle run exited 0 after its agreement checks. toyos/ring, the median over samples of ours/theirs (above 1:
ours slower):

| build | T14 seal/open 1 KiB | 16 KiB | 64 KiB | AMD seal/open 1 KiB | 16 KiB | 64 KiB |
|---|---|---|---|---|---|---|
| inc, base 4dc75f542 | 1.038 / 1.041 | 0.869 / 0.879 | 0.862 / 0.870 | 1.489 / 1.428 | 1.165 / 1.364 | 1.146 / 1.345 |
| inc, fix c9a3f65e1 | 1.039 / 1.041 | 0.869 / 0.879 | 0.861 / 0.870 | 1.485 / 1.428 | 1.166 / 1.363 | 1.146 / 1.343 |
| noninc, base | 7.121 / 6.846 | 8.953 / 8.631 | 9.093 / 8.481 | 3.554 / 9.494 | 1.397 / 13.101 | 1.240 / 13.179 |
| noninc, fix | 1.038 / 1.034 | 0.874 / 0.873 | 0.866 / 0.865 | 1.507 / 1.419 | 1.204 / 1.361 | 1.189 / 1.388 |
| noninc, fix (repeat) | 1.037 / 1.043 | 0.874 / 0.883 | 0.866 / 0.875 | 1.499 / 1.422 | 1.201 / 1.360 | 1.186 / 1.347 |
| noninc, fix, `product` `#[inline(never)]` | 1.081 / 1.081 | 0.917 / 0.934 | 0.915 / 0.919 | 1.520 / 1.472 | 1.213 / 1.426 | 1.190 / 1.416 |

Tests at c9a3f65e1: `differential` passes and its wrong-limb mutant fails (exit 101, 4 AEAD/OpenSSH cases) on both
benches. `toyos_crypto` passes, but so does its mutant (exit 0 on both): no unit test reached the AVX2 kernel,
because `update` hands it only runs of 16 blocks or more and the integer test feeds pieces of at most 70 bytes.
6291dc4ad adds `the_avx2_blocks_match_the_portable_rounds`; `staged-r3b/` has its fixed and mutant binaries for a rerun.
