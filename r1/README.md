# ToyOSOrg/ToyOS#1008 (memory stage 3a: the vm_* lifecycle calls), round 1

Head now `d4e282fe5`. Its rebase onto #1003's new head also brought osbench round 2 from `main`, whose ToyOS `protect`, `unmap_part` and stack notes this commit now serves; that part is checked only at the stack head (`pr-1010`).

| file | command | revision | exit |
|---|---|---|---|
| lc-build.log | `cargo run -- --build-only` | worktree of `cd246a7e2` | 0 |
| lc-guest1.log | 18 shared tests in one boot plus 8 QEMU rows | same | 1: `allocator_stress` (no charge until #1010), `abuse_kernel_addr` (needs the test kernel; see guest2) |
| lc-guest2.log | `abuse_kernel_addr tlb_shootdown_waits` on the test kernel (`SWEEP_PARAMS=revoked-backing-selftest`) | worktree with the `abuse_kernel_addr` fix | 0 |
| lc-host.log | `cargo run -- --ci host` | `d851d99e8` | 0 |
| controls/protect-none-keeps-leaf.* | `mmap_stress` with `vm_protect(None)` leaving a present leaf mapped | `d851d99e8` + patch | red: "a protected-none page was readable" |
