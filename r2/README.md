# ToyOS #1213, round 2 (review r1's four blockers)

Branch `cmos-wall-clock-from-loader`, head `8dbc5357cbcf0667203b1af5499a291fb18f35b7`, on main
`9f6269832`. Paths are masked as in `r1`.

| Check | Command | Revision | Exit | Log |
|---|---|---|---|---|
| Host checks | `cargo run -- --ci host` | `8dbc5357c` | 1: 1 of 110 steps red, `the build system`, the recorded macOS `llvm` environment test | `ci-host.log` |
| x86-64 image | `cargo run -- --build-only` | `8dbc5357c` | 0 | `build-x86_64.log` |
| AArch64 image | `cargo run -- --build-only --arch aarch64` | `8dbc5357c` | 0 | `build-aarch64.log` |
| Guest rows | run 42951062671, filter `virt_wall_clock_utc a_stalled_hpet_is_left_out a_stepped_tsc_is_slewed_then_demoted` | `8dbc5357c` | 0: 3 passed, 3 total | `guest.log` |
| Metal staging, T14 | `cargo test --test toyos-build -- --metal --metal-readback <scratch>/metal/r2/t14 wall_clock_is_firmwares timer_calibration smp_roster_and_tsc_trail boot:shared-debug` | `8dbc5357c` | 2 (staged, nothing judged) | `metal-stage-t14.log`, `metal-t14-request.txt` |
| Metal staging, AMD bench | the same into `<scratch>/metal/r2/amd` | `8dbc5357c` | 2 (staged, nothing judged) | `metal-stage-amd.log`, `metal-amd-request.txt` |

The host checks' log holds `checks::a_date_off_the_loaders_reading_is_red_and_a_bench_off_utc_is_the_benchs`
and `checks::a_staged_stall_is_judged_by_its_own_span`, passing.

## The AMD bench at round 1's head: information, not landing evidence

`amd-32e11074e-shared-debug-excerpt.txt` and `amd-32e11074e-testcases-excerpt.txt` are the clock's
lines, the loader's reading and the host's timings of the two boots of round 1's images
(`32e11074e`) the AMD bench ran. They are excerpts, and no row of this round is judged on them.

- `shared-debug`, whole, 14 jobs: the clock started at 4.17 s, the stall was staged at 5.387 s and
  the machine was asked to reboot at 5.929 s, before the next sample. The row as round 1 registered
  it could not pass; this round's job holds the boot.
- `testcases`: the bench's own step is found in the first sample, 5.345 s, and slewed in that one
  line: `clock: TSC STEP: the TSC stepped 1718941 ns forward against the HPET and the PM timer`;
  `the TSC's step is slewed away, 696 ns left` at 17.355 s; no `DEMOTED`.
- Wall clock, by hand with this round's rule: `testcases`' loader read 03:13:02 at counter
  7258841100, which at the boot's 1796618989805 mHz is 4.040 s; the line at 18.383 s is dated
  03:13:16, 343 ms behind the reading carried on, inside the allowance. The host saw the machine
  back at Unix 1794366825, 03:13:45, after 40 s coming back.
