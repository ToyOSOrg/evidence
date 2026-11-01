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

## r5, at 5def3dc23 (rebased onto main 0c7e62ca7)

- **Host CI:** `cargo run -- --ci host` exited 0, with 106 steps green (`r5/checks/ci-host-5def3dc23.log`).
- **Metal:** the orchestrator ran the boots from a tree pinned at 5def3dc23, and every driver exited 0.
  - T14: one benchcase boot and one testcases boot.
  - AMD: three benchcase boots and one testcases boot.
- **Judging:** each bench boot was paired with its machine's testcases boot. The pair was judged offline with `cargo test --test toyos-build -- --metal --metal-readback <dir> smp_roster_and_tsc_trail timer_calibration clock_holds_over_minutes`.
  - Each of the four pairs exited 0, with `smp_roster_and_tsc_trail`, `timer_calibration` and `clock_holds_over_minutes` all PASS (`r5/metal-*/judge-*.log`).
  - The clock, idle and `IA32_TSC_ADJUST` lines of every boot are in `r5/metal-*/run-*-clock-lines.log`. Whole logs are not published.

### T14 (Tiger Lake, idles in MWAIT 0x31 / 0x60)

- The clock keeps CPUID 15H's rate. Over 128 s the HPET measured it 0.036 ppm slow, within 2.3 ppm.
- APs are within 177 cycles of cpu0's TSC. `IA32_TSC_ADJUST` is 0.
- Unheld spans, in which every CPU entered a declared idle state:
  - benchcase: 31 spans; the HPET read apart from the TSC in 0 and the PM timer in 0.
  - testcases: 8 spans; 0 and 0.
- No step, drift or disagreement line was logged.

### AMD (<amd-model>, idles in C1 or the P_LVL ports 0x414 / 0x415; no IA32_TSC_ADJUST)

- The 50 ms calibration was 1,796,614,688,752 to 1,796,630,610,943 mHz across the boots, each within about 20.8 ppm. The rate kept at 128 s was 1,796,624,780,439 to 1,796,624,798,477 mHz.
- APs are within 270 cycles of cpu0's TSC.
- No held span disagreed, and none of "HPET moved", "agree against" or "all disagree" was logged.
- **In every boot, exactly one unheld span has both the HPET and the PM timer read apart from the TSC. No other unheld span reads apart.**

| boot | window holding the span (uptime) | unheld spans by the end | HPET apart | PM timer apart |
|---|---|---|---|---|
| bench1 | 15.9 s to 24.9 s | 33 | 1 | 1 |
| bench2 | 15.9 s to 24.9 s | 33 | 1 | 1 |
| bench3 | 15.8 s to 24.9 s | 33 | 1 | 1 |
| tests1 | before 12.8 s | 8 | 1 | 1 |

- At 68afed54f, before the guard, the event panicked one boot at 17.6 s: the TSC was 1.72 ms ahead of the HPET over 680 ms.
- The unheld path records counts only. It records neither the size nor whether the HPET and the PM timer agree with each other. Both reading apart in the same span rules out an HPET-only event.
- What remains: either the TSC moved, or both of the FCH's counters stood still together. The HPET's 69,841,278 fs period is 14.318 MHz, and the PM timer's 3.58 MHz is that clock divided by 4, so they share a source.

## r6: the AMD's 1.7 ms event against the RTC, at eee39c691 (branch `system-clock-scout`)

eee39c691 is a scout commit on top of 5def3dc23.
- An idle span's disagreement is logged in full, with the HPET-vs-PM verdict.
- The RTC's update-ended interrupt (IRQ8) times the TSC against its 32.768 kHz crystal.
- Each span records the idle periods per declared state.
- The census gains `rtc`.

Checks:
- **Host CI:** `cargo run -- --ci host` exited 0, with 106 steps green (`r6/checks/`).
- **QEMU:** `a_stalled_hpet_is_left_out` exited 0.
- **QEMU probe:** a red run forced by `probe-keep-serial.patch`, reverted in the same command, shows the RTC edges arriving under TCG. TCG timing is not evidence.

Metal: the orchestrator ran four AMD boots from a tree pinned at eee39c691, in the order benchcase, benchcase, testcases, benchcase. Every driver exited 0.
- Each bench boot was paired with the testcases boot and judged offline. `clock_holds_over_minutes` and `irq_census_conservation` PASS in all three pairs (`r6/metal-amd/judge-*.log`).
- The census puts `rtc=14` on cpu0 and 0 on every AP.

### The event, once per boot, in a span where all 16 CPUs entered s1 (port 0x415, the deepest any span reached)

| boot | uptime at sample | TSC ahead of the HPET | TSC ahead of the PM timer | HPET vs PM | TSC ahead of the RTC (the next RTC span) |
|---|---|---|---|---|---|
| bench1 | 17.976 s | 1,697,321 ns | 1,697,608 ns | agree | 1,697,899 ns |
| bench2 | 17.788 s | 1,719,964 ns | 1,719,768 ns | agree | 1,734,772 ns |
| bench3 | 17.798 s | 1,698,515 ns | 1,698,828 ns | agree | 1,709,833 ns |
| tests1 | 5.675 s | 1,687,827 ns | 1,689,756 ns | agree | no RTC span covers it (the RTC was armed at 4.672 s) |

- **The RTC column.** The RTC span ending in the event's own sample reads 11–15 µs. The edges trail the samples in phase, so the next RTC span is the one that covers the event.
- **No opposite.** No RTC span of the opposite sign follows. Each boot's widest RTC span is the event's. Interrupt wake latency instead shows as ±0.5–0.7 ms pairs, as at 178.97 s and 179.97 s in bench1.
- **Agreement.** Three chipset references, on two oscillators, agree within about 15 µs on bench1 and bench3, and within 37 µs on bench2.
- **Idle states.** Every unheld span in every boot reached s1 (`[0, 32, 0, …]` etc.), and only the one span per boot reads apart. So the deepest idle state does not single the event out.
- **What it leaves.** A forward TSC step of about 1.7 ms. Alternatively, the FCH's 14.318 MHz domain and its RTC both stood still by the same amount. The RTC's separate crystal is from AMD FCH convention; that is an inference, not a document citation.

## r7: the trigger pinned, and the step policy at d33a0de82

### The trigger: AMD, scout 499e48bab (branch `system-clock-scout`), one benchcase boot and one testcases boot

- **Method:** for the boot's first 64 spells with every CPU in a declared state, the first CPU to wake reads the HPET against the sampler's last sample (`r7/metal-amd-trigger/*-clock-lines.log`).
- **benchcase:**
  - spells 0–2 (3.6 µs, 10.9 µs, 1.66 ms) read the TSC within 60 ns of the HPET;
  - spell 3, from TSC 31,096,003,626, 3.83 ms by the TSC, ends 1,698,511 ns ahead;
  - every later spell holds that offset (1,698.1–1,700.8 µs).
- **testcases:** the boot's first spell (TSC 9,164,431,674, 3.22 ms by the TSC) already ends 1,715,182 ns ahead.
- **What it shows:** the step happens inside an early spell with all 16 CPUs in port 0x415 (s1), once a boot. The stepping spell's TSC length includes the jump.

### The policy at d33a0de82 (rebased on main 24a538c88)

- **Host CI:** `cargo run -- --ci host` exited 0, with 108 steps green (`r7/checks/ci-host-d33a0de82.log`).
- **Host tests:** `cargo test -p kernel --lib --features sched-check clock::reference` covers the RTC's least-latency reading through 700 µs interrupts, its three verdicts, the step response, and a slew that stays within 500 ppm and pays its debt in time (`r7/checks/pure-reference-tests.log`, 19 passed, before the rebase; CI's run covers the head).
- **QEMU, `a_stepped_tsc_is_slewed_then_demoted`:** exit 0 at the head (`r7/qemu/both-clock-tests-d33a0de82.log`). Before the rebase (`r7/qemu/a_stepped_tsc_is_slewed_then_demoted.log`):
  - the staged 10 ms step is confirmed by the RTC (9.81 ms) and slewed away in about 21 s;
  - the second, also confirmed, demotes the TSC;
  - a process's reading then reaches the kernel.
- **QEMU, `a_stalled_hpet_is_left_out`:** exit 0 at the head.
- **Negative control:** with the demotion arm disabled (`r7/controls/no-demote.patch`, described rather than published as a diff), the stepped test fails: no "DEMOTED" line (`r7/controls/no-demote.log`, exit 1). The code was restored from the copy taken before the mutation.

## r8: review r2's fixes at fec49988c (rebased on main 427f6548e), and the AMD at d33a0de82

### AMD r7, at d33a0de82 (the policy before r2's fixes)

- **Runs:** the orchestrator ran one benchcase boot and one testcases boot, both drivers exiting 0.
- **Judging:** judged offline as one pair, all four rows PASS: `smp_roster_and_tsc_trail`, `timer_calibration`, `clock_holds_over_minutes` and `irq_census_conservation` (`r8/metal-amd/judge-r7-d33a0de82.log`).
- **benchcase:** the step was 1,695,132 ns in the span ending at 17.77 s. It was confirmed by the RTC, which read 1,658,781 ns, and slewed away by 24.78 s.
- **testcases:** the step was 1,723,072 ns in the span ending at 5.71 s. It was unconfirmed by the RTC: no edge yet before the span, since the RTC was armed at 4.67 s. It was slewed away by 12.71 s.
- Neither boot demoted the TSC, and no per-CPU check fired.
- **T14 r7:** aborted by the runner (the orchestrator's race, since fixed) and not rerun, since r2's fixes change the code.

### Checks at fec49988c

- **Host CI:** `cargo run -- --ci host` exited 0, with 108 steps green. It includes the new loom, pure and harness tests (`r8/checks/ci-host-fec49988c.log`).
- **Loom:** `cargo test -p kernel-loom --test clock_latch` exited 0, with 4 passed (`r8/checks/loom-clock_latch.log`).
  - `a_counter_read_inside_the_section_never_extrapolates_a_superseded_line` holds the new read.
  - `a_counter_read_after_the_section_can_extrapolate_a_superseded_line` (`should_panic`) shows the old order fails.
- **Pure:** 21 passed (`r8/checks/pure-reference-tests.log`), including:
  - the slew paid over two periods: a late sample does not overpay, and a later one is paid back;
  - the RTC's drift correction: a 60 ppm crystal reads a step and reads a stall as none.
- **QEMU, before the rebase:** `a_stepped_tsc_is_slewed_then_demoted` and `a_stalled_hpet_is_left_out` exited 0 (`r8/qemu/both-clock-tests.log`). The rebase brought no kernel, ABI or harness change.
- **Negative controls, each restored from a copy taken before:**
  - `no-page-demote`: the demotion logged but the page left unmarked. The stepped test fails: no process reading reached the kernel (exit 1).
  - `no-drift`: the RTC's drift correction zeroed. `the_rtcs_crystal_drift_is_taken_out` fails (exit 101).

## r9: the T14 at fec49988c

- **Runs:** the orchestrator ran one benchcase boot (266 s) and one testcases boot (90 s), both drivers exiting 0.
- **Judging:** judged offline at fec49988c, all four rows PASS: `irq_census_conservation`, `smp_roster_and_tsc_trail`, `timer_calibration` and `clock_holds_over_minutes` (`r9/metal-t14/judge-fec49988c.log`).
- **The clock:**
  - it keeps CPUID 15H's 2,419,200,000.663 Hz;
  - over 128 s the HPET measured 32 ppb from it, within 156 ppb;
  - no span was left out, no TSC step, no demotion;
  - the RTC's IRQ8 armed on gsi 8.
- **A judge printing defect:** this judging showed every report line, because the left-out match was too wide. It is fixed in the next commit, which only narrows what is printed. Re-judged with that fix, the same four rows pass.

## r10: review r3's fixes at f5a102ed9, and the AMD's r8 at fec49988c

### AMD r8, at fec49988c

- **Runs:** the orchestrator ran one benchcase boot and one testcases boot, both drivers exiting 0.
- **Judging:** judged offline with d739b0743's harness (which only narrows what is printed). Exit 0, all four rows PASS: `irq_census_conservation`, `smp_roster_and_tsc_trail`, `timer_calibration` and `clock_holds_over_minutes` (`r10/metal-amd/judge-r8-fec49988c-harness-d739b0743.log`; clock lines in `r10/metal-amd/run-*-clock-lines.log`).
- **benchcase:** a 1,700,808 ns step in the span ending at 17.80 s. It was confirmed by the RTC (1,709,655 ns) and slewed away by 32.81 s. Over 128 s the HPET measured 3,886 ppb from the boot's calibration, which was within 20,536 ppb.
- **testcases:** a 1,718,230 ns step in the span ending at 5.73 s. It was unconfirmed (no RTC edge before it yet) and was still slewing when the list ended.
- No demotion, and no per-CPU check fired. Every AP was within 288 cycles of the BSP.

### Checks at f5a102ed9

- **Host CI:** `cargo run -- --ci host` exited 0, with 108 steps green (`r10/checks/ci-host-f5a102ed9.log`).
- **Pure:** 25 passed (`r10/checks/pure-clock-tests.log`). `a_drift_base_never_reaches_across_a_step` asserts both halves: with the earlier edges forgotten, a 1.7 ms step after a 4 ms one reads as the counter's; with them kept, it does not.
- **QEMU x86-64 TCG, 2 vCPUs:** `a_stepped_tsc_is_slewed_then_demoted` and `a_stalled_hpet_is_left_out` exited 0 (`r10/qemu/both-clock-tests-f5a102ed9.log`). The run used the tree before the commit. The tree differed from f5a102ed9 only in comments and the issue text written during the run. The demotion on cpu0 completed its handover round, and a process on cpu1 then read through the kernel.
