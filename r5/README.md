# #1057, round 5: review r4's fixes

Head `e8829f986` (code at `4635148fd`; `e8829f986` changes only the issue's text). Paths are masked.

## Blocker 1: why the greedy job's take waited

Three scratch runs at `71e3b8d78`, never committed, recorded the greedy job's account:
- `scratch-wanted` printed it after `RELEASED` and after the take.
- `scratch-poll` polled it every 150 ms. That fixed delay is in the scratch only.
- `scratch-lines-1..3` had the greedy job print every take, with its lack.

Findings:
- It was neither a missed wakeup nor a superframe want. The greedy job's last refusal was one frame (`lack=7898` bytes: 4 KiB plus the heap's rounding).
- It took **6140 KiB** within milliseconds of starveling's 6144 KiB give-back, in all three line runs.
- The test waited for `taken >= given`. That was 4 KiB short, so the test waited for the next memory to come back: fileserver's refused writeback, ~1.6 s later. In `scratch-lines-1..3` the second take line came then.

The step now judges the take by the greedy job's readiness: after a take, the job is no longer ready. In `proving-1..3` the take is answered 2–4 ms after the stop's answer.

## Correction to round 4's README

Round 4 said "in runs 3 and 4, starveling's ports closed the same way". That was false for run 4. Its log has no closure line: run 4 is the stall above, the test waiting for a crash that did not come.

Runs 1 and 3 were the supervisor's own memory refusing a restart after a service died under exhaustion. That debt is now recorded in `issues/no-physical-memory-fairness.md`.

## Runs at `4635148fd`

| file | command | exit |
|---|---|---|
| ci-host.log.gz | `cargo run -- --ci host`: 103 steps green | 0 |
| unmutated.log.gz, frames.log, controls/m*, n* | `cargo test -p kernel --lib frames`: 38 laws; then 19 mutations, each applied, run and reversed | 0, then 101 for all 19 |
| proving-1..3 | `memory_floor_holds_the_controls` | 0 ×3 |
| g4-run2..4, g4-no-supervisor-floor | g4, four runs | 0 ×4 |
| g1, g2, g3, g5, g6 | the other controls | 1 each, as before |
| build-only.log.gz | `cargo run -- --build-only` | 0 |
| t14-request.txt | `floorcase` staged at `e8829f986` | 2, the staging-only exit |

The new mutations:
- n6: a refusal does not re-arm.
- n7: splitting a kept superframe does not refill.
- n8: `rearm` does nothing.

The model (`a_wait_for_memory_is_never_missed`) is red under n8, so it holds the re-arming half of the claim.
