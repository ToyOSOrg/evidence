# ToyOSOrg/ToyOS#1010 and the stack head, round 2

Head `2bd1eec0e` on `main` `d7f269dbc`.

| file | command | revision | exit |
|---|---|---|---|
| h3-host.log | `cargo run -- --ci host` | `2bd1eec0e` | 0 |
| h3-clang.log | `hosted_clang_hello` | `2bd1eec0e` | 0 |
| h2-guest.log | 76 shared Rust tests in one q35 boot, and 21 QEMU rows on q35 and virt, `hda_plays_to_the_controller_that_reaches_an_output`, `libc_children`, `iommu_virtio_platform` among them | `55fa7fd97` (only `tlb_shootdown_waits` changed since, rerun in h3) | 0 |
| h3-testkernel.log | `tlb_shootdown_waits` ×3, `abuse_kernel_addr`, `global_leaf_discharge`, `global_leaf_flush` on the test kernel | `2bd1eec0e` | 0 |
| h2-testkernel.log | the same set with `global_leaf_user_flush`, before the fixed-mapping retry | `55fa7fd97` | 1, see below |
| h2-gl.log, base-gl.log | `global_leaf_user_flush` at the head and at `63b23563c`, before the targeting | | 1, 1: red in QEMU at both, so not this change; its metal row passed at `3446e9c33` |
| h2-proctree.log, main-lt.log | the proctree image's four; `launch_toctou` red at the head and on `main` `18a38738b` alike in this harness | | 1, 1 |
| chr1-guest1.log | strict commitment's guest set after the review's fixes | WIP | 0 |
| chr1-clippy.log | kernel clippy | WIP | 0 |
| controls/discard-frees-pinned.* | `cargo test -p kernel --lib frames::` with a discard that frees a pinned frame and promises it again | | 101: `a_discard_keeps_a_pinned_frame_and_promises_only_what_came_back` |
| t14-3446e9c33-findings.md | the T14 readback at `3446e9c33`, each non-zero exit traced against `main`'s | | |
| ch-metal-judge.log | the judge over that readback: shared-debug, osbench and the rest PASS; testcases refused for lost log parts | `3446e9c33` | 1 |
| metal-staging/request.txt, r1-metal-prep.log, base-metal-prep.log | 4 images at the head, and osbench's benchcase at `d7f269dbc` for the A/B | | 2 = staged, not run |
