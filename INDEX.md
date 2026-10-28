# PR #1104 evidence: the x86-64 clock held to the HPET

All runs on the dev host (Apple silicon, x86-64 guests under QEMU 11.1.1 TCG, AArch64 under HVF/TCG). Paths are masked.

## r1, at 378995d9d (tree ed95e1a1a)

| check | command | exit | log |
|---|---|---|---|
| host CI | `cargo run -- --ci host` | 0, 106 steps green | `r1/checks/ci-host-378995d9d.log` |
| image | `cargo run -- --build-only` (tree before the last fixes; superseded by CI's builds) | 0 | `r1/checks/build-only.log` |
| latch loom model | `cargo test --manifest-path kernel/loom/Cargo.toml --test clock_latch` | 0 | `r1/checks/loom-clock_latch.log` |
| latch negative control | `... --features clock-latch-fence-off --test clock_latch` | 101, both models red (a torn `[2, 2, 3]` read) | `r1/controls/loom-clock-latch-fence-off.log` |
| reference mutations | `cargo test -p kernel --lib clock::reference` with each `.patch` applied, then restored | see below | `r1/controls/*.test.log` |
| stepped TSC under QEMU | `cargo test --test toyos-build -- a_stepped_tsc_panics` | 0 | `r1/qemu/a_stepped_tsc_panics.log` |
| clock page readers | `cargo test --test toyos-build -- virt_smp virt_wall_clock_utc osbench_capability_groups_exit_0` (and `virt_readonly_copyout`, red there, fixed and rerun at HEAD) | 1 then 0 | `r1/qemu/virt_smp-...log`, `r1/qemu/virt_readonly_copyout.log` |

Mutations of `kernel/pure/clock/reference.rs`:

- `no-step-check`: `a_step_at_runtime_fails` and `a_rate_that_moves_past_the_reference_tolerance_fails` red.
- `no-window-residual`: `a_step_inside_the_window_is_refused` red.
- `no-read-widths-allowed`: passed (no test held the readings' widths), so `close_samples_hold_across_wide_reads` was added; `no-read-widths-allowed-2` is the same patch against it, red.

The stepped-TSC test's reuse: its kernel is the commit's (the tree differs by a `#[cfg(test)]` test and a guest binary not in that boot).

Earlier reds kept as findings:

- `a_stepped_tsc_panics-round-trip-deadlock.log`: the first round-trip protocol told turns by the counter's parity and value, and TCG's TSC read the same twice: both CPUs waited out `AP_START`. Fixed with an explicit turn word.
- `a_stepped_tsc_panics-tcg-ignores-tsc-write.log`: a `wrmsr` to `IA32_TSC` changes nothing under TCG, so the actuator stages the step in the check's readings. That log also shows the refinement chain under TCG: 50 ms at 60 ppm, then 1, 2, 4 ... 32 s down to 111 ppb, each earlier rate within its bound of the later.

## Metal

Not run by the implementer. `r1/metal-request.txt` stages `testcases` and `benchcase` for the rows `smp_roster_and_tsc_trail`, `timer_calibration` and `clock_holds_over_minutes` on the T14 and the AMD bench.
