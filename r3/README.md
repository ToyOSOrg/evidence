# ToyOS #1213, round 3: the four bench boots judged, and the final head

The images and the judging are at `8dbc5357cbcf0667203b1af5499a291fb18f35b7`. The branch's head is
`d7d8daf9890f3dc653ea8db64fcd7ec3476ea6c0`, on main `ad5db5a65`. Paths and the machines' names are
masked.

## The benches, at `8dbc5357c`

Judged with the tree at `8dbc5357c`:
`cargo test --test toyos-build -- --metal --metal-readback <scratch>/metal/r2/<bench> wall_clock_is_firmwares timer_calibration smp_roster_and_tsc_trail boot:shared-debug`

| Bench | Exit | Verdict | Log |
|---|---|---|---|
| T14 | 0 | 21 passed, 0 failed, 2 boots | `judge-t14-8dbc5357c.log` |
| AMD bench | 0 | 21 passed, 0 failed, 2 boots | `judge-amd-8dbc5357c.log` |

The `*-excerpt.txt` files are each boot's clock lines, the loader's reading and the host's
timings.

- **T14, `testcases`**: `[wall] 7204 dated lines carry the loader's reading of 1794372489, taken
  10134 ms on the log's clock`; `[wall] firmware read 1794372489, 0 s outside the span the host saw
  the boot run in`. No `TSC STEP`, no `DEMOTED`.
- **T14, `shared-debug`**: `test_rs_hpet_stall_read` exit 0. The `[hpet_stall]` line is the "HPET
  moved" record: the HPET reads 10005528 ns apart, the PM timer 2475 ns apart with 516371 allowed.
  A report follows at 13.622 s. No "all disagree" record in the boot.
- **AMD bench, `testcases`**: `[wall] 7226 dated lines carry the loader's reading of 1794382671,
  taken 4057 ms on the log's clock`; `0 s outside the span`. The bench's own step is written once,
  at 5.359 s in the sample that finds it, 1694650 ns; `the TSC's step is slewed away, 670 ns left`
  at 17.371 s. No `DEMOTED`.
- **AMD bench, `shared-debug`**: `test_rs_hpet_stall_read` exit 0. The staged span holds the
  bench's own step too, so the record is "all disagree": the HPET reads 11698294 ns apart and the
  PM timer 1697502 ns, which stand 10000792 ns from each other. The span is left out, a report
  follows at 7.420 s, and that step is not slewed in that boot (`0 TSC step(s) slewed`). No
  `DEMOTED`.

## The final head, `d7d8daf98`

| Check | Exit | Log |
|---|---|---|
| `cargo run -- --ci host` | 1: 1 of 110 steps red, `the build system`; its failures are `llvm::tests::keyed_and_built` and `llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key`, the recorded macOS issue; clippy clean | `ci-host-d7d8daf98.log` |
| `cargo run -- --build-only`, and `--arch aarch64` | 0, 0 | `build-x86_64-d7d8daf98.log`, `build-aarch64-d7d8daf98.log` |
| Guest rows, run 42979867354, `virt_wall_clock_utc a_stalled_hpet_is_left_out a_stepped_tsc_is_slewed_then_demoted` | 0: 3 passed, 3 total | `guest-d7d8daf98.log` |

## `8dbc5357c` to `d7d8daf98`

- A rebase from main `9f6269832` to `ad5db5a65`, which brought main's thirteen commits under the
  branch, #1210's `KernelArgs` layout among them. `git range-diff` reports the review commit
  identical and the first commit changed in one hunk of
  `issues/the-kernel-is-small-interrupts-post-and-threads-wait.md`, a conflict with #1210's edit of
  the same bullet, which is now gone.
- One commit of comments in six files.

The bench boots ran `8dbc5357c`'s tree, which has main's code as of `9f6269832`. The guest rows
above ran the wall clock's handoff through #1210's layout.
