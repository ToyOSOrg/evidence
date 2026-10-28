# PR #1096 r3: review r1's fixes, at ToyOS 7a77fa390

| file | command | exit |
|---|---|---|
| `ci-host.log` | `cargo run -- --ci host` | 0 (105 green) |
| `build-x86_64.log`, `build-aarch64.log` | `cargo run -- --build-only [--arch aarch64]` | 0, 0 |
| `metal-stage.log`, `metal-request.txt` | `cargo test --test toyos-build -- --metal --metal-readback <dir> --metal-host toyos@bench-amd loader_watchdog_arms watchdog_fed watchdog_resets` | 2, staged; no machine touched |

## Controls (`controls/`)

`run.py` applies each mutation, runs the named crate's tests, and restores the file (`shasum -c` OK on both files afterwards). Each `.patch` applies to 7a77fa390. `summary.log`: every mutation red on the test that names it.

| mutation | caught by |
|---|---|
| `survey-keeps-fired` (B1) | `the_boot_after_an_expiry_reads_it_and_the_next_does_not` |
| `arm-keeps-stale-fired` (B1) | `a_fired_bit_the_survey_cannot_read_is_cleared_by_the_arm` |
| `panic-page-accepted` (B2) | `a_watched_wedge_is_ended_by_the_chipsets_reset` |
| `tick-refusal-leaves-the-count` | `a_refusal_after_the_decode_leaves_the_timer_stopped` |
| `survey-ignores-the-alternate-base` | `what_firmware_holds_is_refused_by_name` |
| r1's and r2's, kept | as named in `summary.log` |

B3's model case, `a_count_the_reset_left_undecoded_restarts_from_the_bound`, is red under `start-in-one-write` and `arm-skips-the-tick`. r1's `stop-clears-fired` is retired: it protected the behaviour B1 removes.
