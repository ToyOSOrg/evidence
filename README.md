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
