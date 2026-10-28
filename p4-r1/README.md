# ToyOSOrg/ToyOS#1106, round 1: P4, every NIC driver a process of its own

Host: macOS arm64, QEMU x86-64 guests. Home and temporary paths masked as `~` and `<tmp>`.

| Log | Command | Revision | Exit |
|---|---|---|---|
| build-1.log | `cargo run -- --build-only` | working tree before 1dd4fb83a (supervisor edits since reverted) | 0 |
| guest-1.log | `cargo test --test toyos-build -- netstack_holders_exported_to_children a_link_ends_under_a_held_stream_and_comes_back udp_receive_times_out a_virtio_function_without_access_platform_is_refused iommu_virtio_platform` | 1dd4fb83a | 1: three reds, each the change's, fixed after |
| guest-2.log | the three reds again | wip after 1dd4fb83a | 1: the restart test's FIN, fixed after |
| guest-3.log | `… -- a_link_ends_under_a_held_stream_and_comes_back` | 1c610d4c7 | 0 |
| control-1.log | the same with `mutate-link-end-ends-netstack.patch` applied, then reverted | 1c610d4c7 + patch | 1, the job's own wait for the link's return |
| loom-1.log | `cargo test -p toyos-link --test ends_loom` | working tree, the want as two AcqRel swaps | 0 |
| loom-control-1.log | `cargo test -p toyos-link --features mutate-want-relaxed --test ends_loom` | the same | 101, loom's deadlock |
| ci-host-1.log | `cargo run -- --ci host` | the want as fences, before the rebase | 0, 106 steps |
| guest-4.log | the five network tests of guest-1 | 98c23c396 (rebased; differs from 8bdf49156 only in `lib/link/tests/ends_loom.rs`) | 0 |
| ci-host-2.log | `cargo run -- --ci host` | 98c23c396 | 134: the host's disk filled; clippy's `ends_loom` findings fixed in 8bdf49156 |
| ci-host-3.log | `cargo run -- --ci host` | 8bdf49156 | 0, 107 steps |
| metal-prep.log, metal-t14-request.txt | `cargo test --test toyos-build -- --metal --metal-readback <dir> i219_carries_netstacks_link i219_leaves_ulp_unarmed` | 8bdf49156 | 2: staged, no machine touched |
