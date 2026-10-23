# PR 1055, round 1: fault-around for committed private memory

Head `a75abd3f6`, base `b48c7dd9d`. Paths are masked: `<home>`, `<checkouts>`, `<tmp>`.

- `logs/ci-host-1.log`: `cargo run -- --ci host` at `a75abd3f6`, exit 0 (last line `exit=0`).
- QEMU runs use the scratch harness entries in `patches/zz-harness.patch` and the bench in `patches/zz_touch_scratch.rs`; neither is in the PR. Each is `cargo test --test toyos-build -- <entry> --nocapture`.
  - `logs/zz-virt-head3-{1,2}.log`: `zz_scratch_mem_virt` at head, aarch64 `virt` under HVF, exit 0.
  - `logs/zz-virt-noaround-{1,2}.log`: the same session with `AROUND = PAGE` (fault-around off), exit 0.
  - `logs/zz-virt-mutation-noclip.log`: `patches/mutation-noclip.patch` applied (run not clipped at the range's end), exit 1: the kernel panics at boot (`unpromise` underflow in `release`). Restored in the same command.
  - `logs/zz-q35-head.log`: `zz_scratch_mem_q35` at head, x86-64 q35 under TCG, exit 0 (functional only; TCG timing is meaningless).
- `patches/faultprof.patch`: the scratch probe on the T14 `*-prof` images (not in the PR).
- `patches/remap-wip.patch`: the set-aside `vm_remap` primitive, its std/libc hooks and `mmap_stress` cases.
