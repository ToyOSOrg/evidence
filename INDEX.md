# ToyOSOrg/ToyOS#980: one C allocator

Tested head: e4e66e52d2b91694ceda205260dca7ddf539e6ea (branch wt/toyos-calloc, base origin/main 6f4d8dbdb).
Host: macOS on Apple silicon (aarch64-apple-darwin), 14 cores.

- exits.txt: each check's exit status.
- ci-host.log: `cargo run -- --ci host` on the final source of every host-built file (later edits touched only std's pal, which no host build compiles). Exit 0, 88 steps.
- build-x86_64.log, build-aarch64.log: `cargo run -- --build-only --arch {x86_64,aarch64}` on the head's tree. Exit 0 each.
- libc-*.log: `cargo build --release --target <t> --manifest-path sdk/libc/Cargo.toml [--features std-runtime]` against the sysroot the image build made. Exit 0, no warnings, in all four configurations.
- doom-symbols.txt: llvm-nm and llvm-objdump of both architectures' doom (std plus libtoyos_c.a). It has one definition each of calloc, free, malloc and realloc, and its calloc checks the product (mulq/seto, umulh).
- libc_children.log, libc_children-head.log: `cargo test --test toyos-build -- libc_children` (QEMU x86-64), before the pal namespacing and at the head. Exit 0 each.
- controls/: the negative controls for sdk/libc/arch/src/malloc_blocks.rs. Each patch was applied with git apply, run with `cargo test malloc_blocks` in sdk/libc/arch and reverted (run.log). c1 to c5 red; c6 (saturating_mul) green, because its behaviour is the same.
