# ToyOSOrg/ToyOS#1003, round 2: the review's fixes, evidence at the head

Head `592d491e5` (the inventory commit `d21a5a0c2` and its round-1 answer) on #1002.

| file | command | revision | exit |
|---|---|---|---|
| s2h-kernel-lib.log | `cargo test -p kernel --lib` | `592d491e5` | 0 |
| s2r1-clippy.log | kernel clippy, 3 feature sets × 2 architectures | `592d491e5` tree | 0 |
| s2h-guest.log | 76 shared Rust tests in one q35 boot (`scratch-sweep.patch`, not committed) and 12 QEMU rows, `hda_plays_to_the_controller_that_reaches_an_output` and `libc_children` among them | `592d491e5` | 1: only `allocator_stress`, whose refusal arrives in #1010 |

`mmap_stress` reaches the range bound and gives every range back at it. `libc_children` passes here and is red on `main` (`pr-1002` r2). The stack head's host CI and guest runs are in `pr-1010` r2.
