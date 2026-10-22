# ToyOSOrg/ToyOS#1003 (memory stage 2: one inventory, 4 KiB owned leaves, objects), round 1

Head now `46c3fe0c2` on #1002. Masked as in pr-1002.

| file | command | revision | exit |
|---|---|---|---|
| s2r-host.log | `cargo run -- --ci host` | `33f835fe8` (before the second rebase and the `abuse_kernel_addr` fix) | 0 |
| s2-host2.log | `cargo run -- --ci host`, red only from a full disk (`No space left on device` in every red control) | `207e1f71b` | 1 |
| s2r-kbuild.log | kernel build, both architectures | `33f835fe8` | 0 |
| s2-guest-1/2/3.log | QEMU rows (q35 and virt); guest-1's two reds were `virt_readonly_copyout`'s premise, fixed before guest-3 | stage-2 tree before its last amends | 1, 0, 0 |
| s2-sweep2.log, s2-sweep3.log | every shared Rust guest test in one q35 boot (`scratch-sweep.patch`, scratch only, not committed) | `43e831f47`+worktree | 1 (see below) |
| s2-sweep-proctree.log, s2-sweep-stat.log | the reds of sweep 2 on their own images | `43e831f47`+worktree | 0 |
| controls/vm-free-not-coalesced.*, vm-split-loses-offset.* | `cargo test -p kernel --lib vm::` with free ranges never joined / a split object range keeping its offset | `95711dd83` + patch | 101, 101 |
| controls/space-no-revoke.* | `futex_wake_counts` with the clear primitive's futex revocation removed, and `space-revoke-base.log` without the patch | `95711dd83` + patch | red, 0 |

Sweep 2's reds: `allocator_stress` (no strict charge until #1010), and `launch_toctou`, `process_tree`, `readdir_bound`, `stat_identity`, which need their own image or a /tmp state nothing else in the boot shares; each passes where its harness runs it (proctree and stat logs, and sweep 3 for `readdir_bound`). The stack head's sweep (`pr-1010/ch-guest4.log`, 76 binaries) is green.
