# PR 1055, round 3: review r1 fixes at 6d826e313

- `ci-host-2.log`: `cargo run -- --ci host`, exit 0.
- `zz-virt-r2-{1,2}.log` (aarch64 virt, HVF) and `zz-q35-r2.log` (x86-64 q35, TCG): the scratch harness of `../r1/patches`; `mmap_stress` passes in each. HVF timings vary from session to session and are not compared with r1.
