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

## r2

- **T14 metal**, judged from the pinned tree at 378995d9d: `cargo test --test toyos-build -- --metal --metal-readback <dir> smp_roster_and_tsc_trail timer_calibration clock_holds_over_minutes`, exit 0, all three PASS (`r2/metal-t14/judge-378995d9d.log`). The clock lines of both boots are in `r2/metal-t14/`; whole logs are not published.
  - The TSC is kept at CPUID 15H's 2,419,200,000 Hz.
  - The HPET measured 2,419,200,017.015 Hz over 128 s, within 118 ppb: 7 ppb from the stated rate. The `testcases` boot measured 39 ppb over 8 s, within 1,785 ppb.
  - Every AP's TSC is within 181 cycles (75 ns) of cpu0's over 256 round trips. `IA32_TSC_ADJUST` is 0. Neither boot recorded a step or a drift.
  - One HPET read brackets 35,690 TSC cycles (14.8 µs). Over 50 ms that is 285 ppm, the old calibration's cluster.
- **Spec**: `r2/hpet-spec-clause.txt` quotes the clause, with the PDF's hash.
- **Rebased onto main** (#1096), plus a commit for the spec's two drift figures and one runtime read: host CI at 68afed54f, exit 0, 106 steps green (`r2/checks/`). `a_stepped_tsc_panics` rerun at that head's kernel, exit 0 (`r2/qemu/`).
- The AMD run is staged at 68afed54f (`r2/metal-request-amd.txt`).

## r3

**AMD benchcase at 68afed54f** (early evidence only, not the landing run): the verdict is refused.
- The runtime check panicked at 17.585 s. Its message, at 68afed54f's wording: "cpu14's TSC stepped: 1723545 ns apart from the HPET over 680209977 ns since the last sample, 346277 allowed".
- The panic path then reset the machine itself.
- `S5ResetStat` = 0x00080800, so bit 25 is clear and the FCH watchdog did not fire.

What the boot measured before the panic:
- The calibration read 1,796,611,234.697 Hz ±20,235 ppb. That is 7.5 ppm from Linux's 1796.6248 MHz, inside its bound.
- The refinements read 1 s ±2,647 ppb, then 2 s, 4 s, and 8 s at 1,796,624,243.085 Hz ±425 ppb.
- The APs sit within ±36 to ±288 cycles of the BSP.
- The TSC read 16.9 s since its zero at the event.

Files are in `r3/metal-amd/`. The panic page is excerpted; the full logs are not published.

**Head 5cb43438a** (review r1 fixes):
- Host CI exit 0, 106 steps green (`r3/checks/`).
- `a_stepped_tsc_panics` exit 0 (`r3/qemu/`).
- The T14 run is restaged (`r3/metal-request-t14.txt`). The AMD run is held until the 1.7 ms event is understood.

## r4, at ca40a7e50 (the ACPI PM timer tiebreak)

- Host CI: exit 0, 106 steps green (`r4/ci-host-ca40a7e50.log`).
- QEMU x86-64 TCG: `a_stepped_tsc_panics` and `a_stalled_hpet_is_left_out` both pass. The QEMU run's tree differs from ca40a7e50 by one test-literal regrouping.
  - A staged TSC step: the PM timer reads 10.001 ms apart from the TSC, as the HPET does, and the kernel panics.
  - A staged HPET stall: the PM timer reads 847 ns apart, so the span is left out and the clock reports again.
- No metal run at this head. The owner paused before staging.
