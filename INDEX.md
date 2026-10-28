# PR #1079 evidence: osbench measures the systems, not the setup

## r1 (branch head 1a42601b0)

- `checks/ci-host-1a42601b0.log`: `cargo run -- --ci host` at 1a42601b0, exit 0, 103 steps green. The run before it, on the uncommitted tree, was red on one clippy lint in a new test (`manual_is_multiple_of`). That is fixed in the commit.
- `checks/linux-build-1a42601b0.log`, `checks/linux-osbench-SHA256SUMS`: the Linux half at 1a42601b0 (`cargo +nightly-2026-07-22 build -p osbench --target x86_64-unknown-linux-musl --profile toyos`), exit 0. Both Linux targets also passed `cargo check` with no warning before the commit.
- `controls/`: three negative controls, each a checked patch applied, built, tested and reverted in one run (`run.sh`, `run.log`):
  - m1: settle's span at 10 ms. 3 settle tests red (exit 101).
  - m2: compare accepts a system's runs on two setups. The setup test red (exit 101).
  - m3: the clock never falls. The clock-fall test red (exit 101).
- `judge/memory-data-refused.log`: the new `osbench` row judging a copy of the 2026-10-24 T14 readback, whose DATA was memory. Exit 1, `FAIL osbench: DATA was not the NVMe's partition ... are in memory`.
- `judge/mounted-data-passes.log`: the same log with the file server's two DATA lines replaced by `fileserver: mounted the DATA volume`. Exit 0, `PASS osbench`. Both judge runs were on the working tree before the commit. The commit changed the row's bound and comments after them, not `data_on_the_nvme`.
- `judge/stage-*.log`: `--metal-readback` staging of the `osbench` row for the T14 and the AMD bench at 1a42601b0. Exit 2, staged, no machine touched. Image sha256: T14 a30cb2bbb1a9089c227eda67ffd39a150dcc78a23b4781f379fb749647c55c0f, AMD 5516cccb7313540d92182b202b61a337c715a1445dc4d67101466470e43f79fd.

## r2 (branch head ba76f730a): the DATA designation, and the AMD TSC

- `checks/ci-host-ba76f730a.log`: `cargo run -- --ci host`, exit 0, 103 steps green. `checks/ci-host-8d3ea1a89-red-sourcegate.log` is the run before it: exit 1, one step red. The source gate refused a bare `temp_dir()` in `toyos-metal`, and ba76f730a takes a `TempDir` instead.
- `controls/`: m4 makes `stamp::classify` never see a ToyOS volume. It was applied, built, run and reverted in one run (`run2.sh`, `run2.log`), and the stamp test went red, exit 101.
- `judge/`: the `osbench` row at its final `data_on_the_nvme`, on copies of the 2026-10-24 T14 readback.
  - `t14.log`: DATA in memory, exit 1, refused.
  - `t14-mounted.log`: the mount line substituted, exit 0, PASS.
  - `t14-formatting.log`: the format line substituted, exit 1, refused as the format boot with its duration. The substitution's lines share one timestamp, so it reads 0.000 s.
- `tsc/amd-dmesg-clocksource.txt`: the AMD bench's Linux watchdog, UUIDs masked. Derived from it: 905,474,502 TSC cycles over 502,290,025 ns of HPET, which is 1802.69 MHz. Linux's conversion assumed 1796.62 MHz, and ToyOS's calibration against the same HPET reads 1796.52 MHz (kernel.log, 2026-10-24), about 3400 ppm apart. `tsc-drift.rs` is the requested measurement, scratch evidence code with no repository home; its binary's sha256 is in `SHA256SUMS`.

## r3 (branch head 2eb28ee65): the split, review r1, and the AMD TSC

- `checks/ci-host-1d23f49ea.log` (the merge of main at b0164b262) and `checks/ci-host-2eb28ee65.log`: `cargo run -- --ci host`, exit 0, 104 steps green each. Between the two, only Markdown changed.
- `checks/qemu-osbench-capability-groups-1d23f49ea.log`: `cargo test --test toyos-build -- osbench_capability_groups_exit_0`, exit 0. It runs `osbench identity` and `osbench fair` (renamed groupings, the ToyOS Job path) on QEMU x86-64 under ToyOS.
- `checks/linux-build-2eb28ee65.log`, `linux-osbench-SHA256SUMS`: the Linux half at 2eb28ee65, exit 0.
- `checks/stage-*.log`: `--metal-readback` of the `osbench` row at 2eb28ee65 for the T14 and the AMD, exit 2, staged. Image sha256: T14 c3982639b4c6f815ed42d6512d863f8dc18fea2551bfaf32de3d2464d0ed9dc4, AMD fb9767152834acc815f684d41faa3f4731edf93ff3dc4ca85550cd8c222c2257.
- `controls/`: m5 (media never differ) and m6 (settled clocks never apart). Each was applied, built, tested and reverted in one run (`run3.sh`, `run3.log`), and each turned its test red, exit 101.
- `judge/`: the `osbench` row at 2eb28ee65 on the substituted 2026-10-24 T14 logs. Memory DATA: exit 0, PASS. Mounted: exit 0, PASS. Formatting: exit 1, refused as the format boot. No ordinary boot goes red.
- `followup/`: `data-on-the-nvme.patch`, which waits for ToyOS-native designation. `check.sh` and `check.log` applied it at 2eb28ee65, checked both Linux targets (exit 0) and the compare tests (exit 0), and judged the three logs: memory refused (exit 1), mounted PASS (exit 0), formatting refused (exit 1). Then it was reverted, leaving the tree clean.
- `stamp/`: the orchestrator's `--designate-data` run on the AMD at ba76f730a, dry and write, before the tool was removed. UUIDs masked.
- `tsc/`: the AMD's `tsc-drift` runs (2026-10-28) and its session log, masked: 1796.6248 MHz against the HPET over 601 s and against the ACPI PM timer over 300 s, in every phase. `toyos-calibrations.txt` holds ToyOS's own 50 ms calibrations in the session's boot logs, by count of log files, some of them copies of one boot. `tsc-probe.rs` and `SHA256SUMS` are the next measurement's (cross-core warp, and steps after idle gaps).
- Correction (2026-10-28, after r3): the orchestrator restored the AMD's p4. No ToyOS boot had run since the stamp, so it zeroed the first 4 KiB block, which had read `TOYOS-FORMAT-ME`; its first 1 MiB is zero again, as before. Neither bench's p4 is designated, and main's `nvme_leaves_the_benchs_disk_alone` holds on both.

## r4 (branch head a6a4c60d8): the validation run, and the TSC's investigation

Masking: boot IDs, MAC and IPv4 addresses, partition GUIDs and the shell's trace lines are removed.

- `validation/{t14,amd}/`: the orchestrator's validation run at 2eb28ee65 (2026-10-28). Each bench has two baseline Linux runs (`osbench all`, as booted), one ToyOS benchcase boot and its `judge.log` (`1 passed, 0 failed` on both), and `compare.md` from `osbench-compare` over the three, exit 0. Every row pairs or says why not. `persist` reads "the media differ: Linux nvme, ToyOS usb". On the AMD's Linux 84 rows read unsettled: its boosting clock dithers 4022 to 4126 MHz, so the 1% rule never held, and a6a4c60d8 holds at 5%.
- `tsc/amd/boots.txt`: 30 boots' kernel lines. Linux's watchdog fired in 18. In 13, Linux's refined calibration read 1799.54 to 1799.61 MHz (true 1796.62). In 5, a correct calibration came with a 1.698 to 1.722 ms step over 494 to 502 ms.
- `tsc/amd/tsc-warp.txt`: 15 CPU pairs through 1 ms, 100 ms and 1 s idle. Every worst step is positive, 54 to 342 cycles, so no CPU's TSC read behind another's.
- `tsc/amd/tsc-jumps-*.txt`: 600 s against the HPET and 300 s against the ACPI PM timer, 1796.6248 MHz. The worst step between consecutive samples on a CPU is 1.2 µs (HPET) and 0.2 µs (ACPI PM) after any idle gap, within the reads' brackets.
- `tsc/t14/`:
  - `tsc-drift-hpet.txt`: 2419.2002 MHz over 300 s, CPUID 15H's rate within 0.1 ppm;
  - jumps: no step above 0.05 µs;
  - warp;
  - `hwp-request.txt`: IA32_HWP_REQUEST 0x80002a04 on all 8 CPUs.
- `checks/ci-host-a6a4c60d8.log`: exit 0, 104 steps green. `checks/stage-*.log`: staged at a6a4c60d8. Image sha256: T14 6fe08955e5433defba36525065f94bd3881d9c0735d1bc67351e3244a7b90a12, AMD a4c6196a2c1112b51dac21cd4c7c7fb7d9e13f6028fb328e669cbdc627e6e484. The Linux half's sha256 is in `checks/linux-osbench-SHA256SUMS`.
- `judge/`: the `osbench` row at a6a4c60d8 on the three substituted logs. All PASS: the format-boot refusal moved to the follow-up.
- `followup/`: the patch regenerated at a6a4c60d8, now with the format-boot refusal. `check.log`: both Linux targets and the compare tests exit 0. Judged: memory exit 1, mounted exit 0, formatting exit 1. Reverted, tree clean.

## r5 (branch head fa7258221): review r2

- `checks/ci-host-fa7258221.log`: exit 0, 104 steps green. `checks/stage-*.log`: `osbench` staged for the T14 and the AMD, exit 2. Image sha256: T14 336a2a468929848e75a40f54c35538535bc05b27ca6955449acb638b9c46ffa5, AMD 4ce0d0de88a6029fece02422b197e88532c9de542bd30a1e4ecf4f3b342c15ed. The Linux half's sha256 is in `checks/linux-osbench-SHA256SUMS`.
- `controls/`: m7 sets the settle tolerance to 10%. It was applied, built, tested and reverted in one run, exit 101, and the measured-step test fails at 3789 to 4189 MHz.
- `followup/`: regenerated at fa7258221. `check.log`: both Linux targets and the compare tests exit 0. Judged: memory refused, mounted PASS, format refused. Reverted.
- `amd-a6a4c60d8/`: the orchestrator's AMD run at a6a4c60d8: Linux, ToyOS, Linux, with the judge PASS. These are the old probe's readings, with the 5% rule. No settle was capped on either system (Linux 86 and 84, ToyOS 92). Linux's median `mhz_settled` is 4044 MHz against ToyOS's 4241: the HPET read's 1.21 µs on a 25 µs probe, 4.6% low, which fa7258221's difference probe removes.

## r6 (branch head 6be1ab62b): the probe's minimum

- `checks/ci-host-6be1ab62b.log`: exit 0, 104 steps green.
- `controls/`: m8 removes `probe_mhz`'s minimum, putting back the old saturating difference. It was applied, built, tested and reverted in one run (`run5.sh`, `run5.log`), and the probe test fails, exit 101.
- Nothing in the settle, `mhz_settled`, `mhz_after` or any p50 changed since fa7258221, so that head's metal runs stand for them.

## r7: the AMD run at fa7258221 (the difference probe on metal)

- `amd-fa7258221/`: the orchestrator's run, Linux, ToyOS, Linux, all rc=0, judge `1 passed`. `compare.md` exits 0, 176 rows: 0 unsettled, 0 apart, 0 fell, and 6 "media differ".
  - Linux's `mhz_settled` runs 4166 to 4292 MHz, median 4217 and 4216; ToyOS's 4166 to 4291, median 4241: 0.6% apart.
  - Both Linux boots chose `clocksource=tsc` (`time.now` 22.7 ns), so this run does not show the probe cancelling an HPET read; the host test does (`probe_mhz` with 1.21 µs added to both chains). That needs a Linux boot on the HPET, some 57% of boots on record.
  - With the timestamp cheap, `cpu.chunk@system` is 2926/2936 ns (Linux) against 2936 ns (ToyOS).
  - This boot's DATA was the AMD's newly designated p4 (#1085), mounted (`fileserver: mounted the DATA volume`). Its `fs.served.*` rows are the file server over that volume; `persist` stays on the stick's LOG volume in this PR.

## r8: the difference probe against an HPET read, on the AMD (a runtime clocksource switch, not the baseline)

- `amd-hpet-switch/`: the orchestrator switched the AMD's running Linux from `tsc` to `hpet`, ran the fa7258221 Linux half (`osbench all`), and switched back. `session.txt`: tsc, hpet, rc=0, tsc. This is a validation of the probe, not a baseline run.
- Every group reads `clocksource=hpet`, and `time.now` p50 is 1,211,480 ps: each timestamp costs the HPET read's 1.21 µs.
- `mhz_settled` over all 85 lines is 4186 to 4312 MHz, median 4236, 0.1% from ToyOS's 4241 in r7, with 0 unsettled. Under the old probe, a6a4c60d8 read 4044 on the HPET. So the two-chain difference cancels a 1.21 µs read on metal.
- `cpu.chunk` p50 is 4330 ns there, against 2936 ns for ToyOS: that row times each chunk with two timestamps, which the HPET makes 2.4 µs dearer. It is the clocksource's cost to a per-operation row, as the README says, not the probe's.

## r9: the T14 run at fa7258221

- `t14-fa7258221/`: the orchestrator's run, Linux, ToyOS, Linux, all rc=0, judge exit 0. `compare.md` exits 0 over 176 rows: 6 media differ, 4 unsettled, 1 fell, 2 apart. Linux per run: `clocksource=tsc,tsc`.
- ToyOS settled at 4188 MHz in all 92 rows, none unsettled. Linux's medians are 4189 in both runs.
- L1's four unsettled rows, and why 3% stays right:
  - `mem.munmap_touched_remote.4k` (unsettled before: 3791, after 4189). Its settle runs while the sibling spins on another core. The T14's two turbo bins are 3.79 and 4.19 GHz, the 9.5% step `osbench_rules::settle` pins. A third core intermittently active flips them (an inference). L2's same row settled at 4189.
  - `crunch.all.{deflate,sha256,matmul}` (unsettled after). These follow 8-thread slices at 64 °C, so not hot: the clock fell between rows (3891, then 3392) and read 1.8 to 1.9 GHz just after each. That is a package power limit recovering through the settle. In L2 the package reached 87 °C, and the phase stopped for heat before a settle could cap.
- `crunch.single.matmul` fell in L1, 4190 to 3592 at 71 °C after 4 s of one-thread load.
- `mem.malloc_churn.{1048576,4096}.t8` are flagged "settled clocks apart": Linux 3641 to 3690 against ToyOS's 4188. The likely cause is a lower turbo bin with more cores active around an eight-thread row, an inference.
- So each mark is a real change of the clock's state, which the marks exist to show, and none is the reading's noise.
