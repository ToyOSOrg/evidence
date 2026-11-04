# PR #1163 r4 at 6fb03ce79

| File | Command | Exit |
|---|---|---|
| host-test.log | `cargo test --test toyos-checks -- the_idle_second_admits_only_the_machines_own_lines` | 0 |
| controls/admit-any-clock-line.log | the same, with the refinement arm admitting any `clock: ` line, then restored | 101, as intended (the step report is admitted) |
| kernel-clock.log | `cargo test -p kernel --lib --features sched-check clock::` | 0 |
| clippy.log | `cargo run -- --clippy` | 0 |
| qemu-hpet-stall.log | `cargo test --test toyos-build -- a_stalled_hpet_is_left_out` (x86-64 q35, TCG): reads the refinement report through `kernel::clock::TSC_REFINED` | 0 |
| acpiserver-at-1d0d558ef.log | `cargo test` in `system/acpiserver` at the acpi_counted revert | 0 |
