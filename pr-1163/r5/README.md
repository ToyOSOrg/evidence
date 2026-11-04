# PR #1163 r5 at e80dee12b

| File | Command | Exit |
|---|---|---|
| host-test.log | `cargo test --test toyos-checks -- the_idle_second_admits_only_the_machines_own_lines` | 0 |
| controls/admit-any-clock-line.log | the same, with the step arm admitting any `clock: ` line, then restored | 101, as intended (the slewing line is admitted) |
| kernel-clock.log | `cargo test -p kernel --lib --features sched-check clock::` | 0 |
| qemu-clock.log | `cargo test --test toyos-build -- a_stepped_tsc_is_slewed_then_demoted a_stalled_hpet_is_left_out` (x86-64 q35, TCG); the first now requires the step report through `kernel::clock::TSC_STEP_READ` | 0 (2/2) |
| clippy.log | `cargo run -- --clippy` | 0 |
