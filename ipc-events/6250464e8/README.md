# ToyOS #1108 (ipc-events), head 6250464e8 on main a5b330f39

Paths are masked: $WORKTREE (the branch's worktree), $SCRATCH, $DEV, ~.
Each log's last line is the command's exit code (`exit=N`).

| log | command | revision | exit |
|---|---|---|---|
| ci-host-3.log | `cargo run -- --ci host` | 6250464e8 | 0 (105/105 steps) |
| build5.log | `cargo run -- --build-only` | 6250464e8 | 0 |
| qemu-3.log | `cargo test --test toyos-build -- stream_holders libc_children netstack_holders_exported_to_children udp_receive_times_out the_data_partition_beside_the_stick_is_designated a_host_disk_beside_the_stick_is_left_alone session_lifecycle hda_plays_to_the_controller_that_reaches_an_output kernel_objects_refused_alone` (QEMU x86_64) | 6250464e8 | 0 (9/9) |
| members-prep-2.log | `cargo test --test toyos-build -- --metal --metal-readback $SCRATCH/members event_sides mio_waker_coalesces cpal_drop_unreleased hda_tone hda_tone_resampled` | 6250464e8 | 2 (staging only, by design: no machine touched) |
| mio-control-prep-2.log | same staging of `mio_waker_coalesces`, with only rust-tests' Cargo.lock mio pin set to f762092, restored after | 6250464e8 + control | 2 (staging only) |
| ab-head-prep-2.log | staging of `osbench`, with measure/ applied uncommitted (measure/apply.py), restored after | 6250464e8 + waitone rows | 2 (staging only) |
| ab-base-prep.log | staging of `osbench` | a5b330f39 | 2 (staging only) |
| control-c1..c3.log | negative controls, patches in controls/, each applied and restored in one run | pre-rebase tree f3fe154 (commits a80c52280 / a68bc51cc) | c1, c2: the boot never reaches `===READY===`; c3: two host tests red |

The negative controls predate the rebase. The rebase onto #1074 conflicted only in `sdk/toyos/src/wake.rs` and netstack's memory constants, and left `kernel/pure/event.rs` and `kernel/src/object/event.rs` unchanged, so those controls still apply.

request.txt is the metal request. No metal result is recorded here yet.
