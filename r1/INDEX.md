# Review round 1 of ToyOSOrg/ToyOS#980

Tested head: 470d9bb9813a7253c361d4d9e7325fddc01a8d23 (clean tree; head.txt).

- controls/run.log: `cargo test malloc_blocks` in sdk/libc/arch, unpatched and under each control patch, at head. It records the head and the sha256 of malloc.rs and malloc_blocks.rs, before and after (19be4b2b…, the head's file). Unpatched: exit 0. c1 to c5: exit 101, each reds its own test. c6 (saturating_mul): exit 0, the same behaviour.
- ci-host.log: `cargo run -- --ci host`, exit 0.
- build-x86_64.log, build-aarch64.log: `cargo run -- --build-only --arch …`, exit 0 each.
- guest.log: `cargo test --test toyos-build -- c_aligned_alloc libc_children`, exit 1, because the harness refuses the filter `c_aligned_alloc`. That binary is a shared-boot member: it runs in the T14 `testcases` boot (or the interactive --debug mode), never as a QEMU row.
- libc_children.log: `cargo test --test toyos-build -- libc_children`, exit 0.
- metal/request.txt, metal-prepare.log: `cargo test --test toyos-build -- --metal --metal-readback <dir> c_aligned_alloc`, exit 2. The image is staged and no machine was touched.
