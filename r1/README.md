# #1057, round 1: per-job accounts, the controls' floors, and the restart that waits for memory

Head `aa89ed2db` (on `main` `b48c7dd9d`). Paths are masked. Every run below is at the head unless it says otherwise.

| file | command | exit |
|---|---|---|
| (in the PR) | `cargo run -- --ci host`: 103 steps, all green | 0 |
| frames-mutations.log | `cargo test -p kernel --lib frames` unmutated (31 laws green), then each of `controls/m1`–`m8` applied, run and reversed | 0, then 101 for each of the eight |
| guest.log | `memory_floor_holds_the_controls` three times, then `controls/g1`–`g3` each applied, run and reversed | 0, 0, 0; then 1 for each of the three |
| proving-1..3.log.gz | the three green runs' capture: every `PASS:` line and the supervisor's | 0 |
| g1..g3 .log.gz | the three controls' runs | 1 |
| sweep-2.log.gz | the 88 shared Rust members `tests/toyos.rs` does not skip, in one q35 boot of the shipping kernel, through `scratch-sweep.patch` (#1045's, never committed) | 1: the 7 actuator members only, which need the test kernel; 81 green, no kernel panic |
| sweep-tk-1.log.gz | those 7 on the test kernel (`SWEEP_TEST_KERNEL=1`) | 0 |
| rows-1.log.gz | 22 QEMU rows: `kernel_objects_refused_alone`, `libc_children`, spawn, session, drives, device-memory, console, usbd, stream, launch, state and compositor rows, and on AArch64 `virt` `virt_claim_lpi`, `virt_smp`, `virt_el1_smp`, `virt_smmu`, `virt_unmap_touch`, `virt_readonly_copyout`, `virt_user_mode`, `virt_jobs_at_el2` | 0 |

The rows and the sweep ran with an untracked `tests/toyos.rs.orig` beside the tree, a backup `patch` left when the sweep patch was reversed; nothing reads it. It was removed before the T14 images were staged.

## Negative controls

| control | what it breaks | result |
|---|---|---|
| m1-room-ignores-floors | what is free for any job counts no floor held | 3 floor laws red |
| m2-own-floor-not-released | a floor job's own use leaves its floor held | 5 laws red, the fragmentation model among them |
| m3-whole-not-held | a floor's whole superframes go to any job's run | `a_floors_superframes_stay_whole_beside_scattered_room` red |
| m4-no-floor-refill | what a floor job gives back is not held for it again | 2 laws red |
| m5-own-pool-not-sticky | a floor job's own heap pool gives back its entitlement below the floor | 2 laws red |
| m6-returned-without-threshold | memory-returned answers any give-back | `a_wait_for_memory_is_answered_once_what_it_lacked_comes_back` red |
| m7-set-floor-unchecked | a floor is set where nothing is free for it | `a_floor_is_set_only_where_it_is_free_and_unset_lets_it_go` red |
| m8-floor-keeps-entitlement | a floor let go of keeps its pool's superframes | `a_floor_let_go_releases_what_its_pool_kept` red |
| g1-floors-not-held | m1's rule in the kernel | the proving test red: the greedy job takes the floors and the stop's request is never answered |
| g2-no-retry | a restart refused for memory closes the ports, as before | red: the client's connection to the kept port is `ServerGone` |
| g3-no-returned-post | the allocator never posts that memory came back | red at the greedy job's own re-take, which waits on the same event; g2 isolates the retry |

## The proving test's design, briefly

The ended service's memory is freed at reap, after its end is published, so the supervisor and a greedy job race for it. The test makes the outcome certain: the greedy job takes again whatever comes back (waiting on its own job's readiness), and `starveling`, once refused, gives back 6 MiB of its stack, which the greedy job takes before it ends; what its end frees is then less than a start of it needs. The barrier before the kill is the supervisor's own refusal line, read off logkeeper, which `tests/images/floorcase.toml` gives a floor for that reason.
