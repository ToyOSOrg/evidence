# ToyOS #1213, round 1

Branch `cmos-wall-clock-from-loader`, head `32e11074ed3c01f84a0a41630f2f27036468816e`, on main
`fb88cec2a`. Paths are masked: `<wt>` is the worktree, `<scratch>` the assignment's scratch
directory. Host checks and builds ran on a macOS arm64 development host.

| Check | Command | Revision | Exit | Log |
|---|---|---|---|---|
| Host checks | `cargo run -- --ci host` | `32e11074e` | 1: 1 of 110 steps red | `ci-host.log` |
| x86-64 image | `cargo run -- --build-only` | `32e11074e` | 0 | `build-x86_64.log` |
| AArch64 image | `cargo run -- --build-only --arch aarch64` | `32e11074e` | 0 | `build-aarch64.log` |
| Metal staging, T14 | `cargo test --test toyos-build -- --metal --metal-readback <scratch>/metal/t14 wall_clock_is_firmwares timer_calibration smp_roster_and_tsc_trail boot:shared-debug` | `32e11074e` | 2 (staged, nothing judged) | `metal-stage-t14.log`, `metal-t14-request.txt` |
| Metal staging, AMD bench | the same into `<scratch>/metal/amd` | `32e11074e` | 2 (staged, nothing judged) | `metal-stage-amd.log`, `metal-amd-request.txt` |
| Guest rows | run 42945488277 on the guest runner, filter `a_stepped_tsc_is_slewed_then_demoted a_stalled_hpet_is_left_out virt_wall_clock_utc` | `e03485e1b` | 0: 3 passed, 3 total; 5 steps, all green | `guest-2.log` |
| Guest rows, first dispatch | run 42943839543, filter `a_stepped_tsc_is_slewed_then_demoted a_stalled_hpet_is_left_out virt_wall_clock_utc file_mtime` | `e03485e1b` | 1: the harness refused `file_mtime`, which is no QEMU row; no guest booted | `guest-1-filter-refused.log` |

The host checks' one red is `the build system: cargo test --lib`, whose
`llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key` breaks the host's
`git` on every macOS host (`issues/the-llvm-environment-test-breaks-git-on-macos.md`); `build/`
is not in this change. `checks::a_wall_clock_off_the_hosts_fails_its_row` is in the log, passing.

`e03485e1b` and `32e11074e` differ by one rewrapped paragraph of
`issues/the-amd-benchs-tsc-steps-1-7-ms-forward-once-a-boot.md`.

No machine was touched: the metal rows are staged and requested, not run.

In `guest-2.log` the x86-64 guest's step is found and slewed in one line, `clock: TSC STEP: the TSC
stepped 10003353 ns forward against the HPET and the PM timer; the clock slews it away …`, the
second demotes the TSC, and the stalled HPET's span is left out with the PM timer reading 1487 ns
apart. Its records are dated by the wall clock the loader handed: `[2026-11-11 02:31:03  3.800 cpu0
kernel]`, printed by the runner at 02:31:33Z after a 33 s row.

## What the RTC's edges ever decided

`rtc-verdicts-published.txt` is every line of every branch of this repository (309 branches,
searched 2026-11-11) that carries the RTC's verdict on a step: `git grep -F -e "confirmed by the
RTC" -e "so the span was left out"` over `pr-1062`, `pr-1104`, `pr-1129`, `pr-1163` and `pr-1165`,
the only branches with a match.

- 49 lines. None reads "so the span was left out", the one verdict that changed the clock's action.
- Steps of 1.69 to 1.73 ms (the AMD bench's): 18 "confirmed", 16 of them with the RTC within 10 µs
  of the HPET and the PM timer and the widest 152 µs apart; 8 "unconfirmed (no RTC edge either side)".
- Staged steps of 10 ms (QEMU): 16 "confirmed", 3 "unconfirmed"; the RTC read 4.2 to 11.7 ms.

Some boots are published on more than one branch, so lines are not boots.

## Documents

- Intel SDM Vol. 3B (the revision at `cdrdv2.intel.com/v1/dl/getContent/671427`, fetched
  2026-11-11), §20.17.1: "The invariant TSC will run at a constant rate in all ACPI P-, C-. and
  T-states. This is the architectural behavior moving forward. On processors with invariant TSC
  support, the OS may use the TSC for wall clock timer services (instead of ACPI or HPET timers)."
- IA-PC HPET Specification 1.0a (intel.com, fetched 2026-11-11), §2.3.3: "The main counter is
  permitted, but not required, to run during S1 or S2 states. This allows mobile systems to stop
  clock generators feeding the main counter during S1 or S2 states."
- ACPI 6.5 §4.8.3.3 and AMD's APM Vol. 3 were **not fetched**: uefi.org answers the build's client
  403 and amd.com refuses it. What the pull request says of them is recalled.

## Kernel lines

`kernel-lines.txt`: 215 files and 55,378 lines at the base, 212 and 54,899 at the head.
