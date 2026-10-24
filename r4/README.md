# #1057, round 4: review r3's fixes

Head `71e3b8d78`. Every run is at `71e3b8d78` from a clean tree unless it says otherwise. Paths are masked. The host was heavily loaded: boots ran at 4.6–8× the reference.

| file | command | exit |
|---|---|---|
| ci-host.log.gz | `cargo run -- --ci host`: 103 steps, all green | 0 |
| unmutated.log.gz, frames.log, controls/m*, n* | `cargo test -p kernel --lib frames`: 36 laws; then 16 mutations, each applied, run and reversed | 0, then 101 for all 16 |
| old-rule.log.gz | `c06cc695e`'s `frames.rs` plus the new law `a_floor_accounts_wait_is_answered_by_its_own_floor` | 101: "its floor's superframe back went unanswered", review r3's trace |
| n1-arm-ignores-own-floor.log.gz | the mutation that drops the floor term | 101: the targeted law, and the 40 000-step model at step 446 |
| proving-1..6 | `memory_floor_holds_the_controls`, six times | 0 ×6 |
| guest.log, g1..g6 | `controls/g1`–`g6`, each applied, run and reversed | 1 for each; see below |
| g4-run2..4 | g4 three more times, to see how often it fails | 0, 1, 1 |
| build-only.log.gz | `cargo run -- --build-only` (the compositor's line changed) | 0 |
| t14-request.txt | `--metal --metal-readback <dir> memory_floor`: `floorcase` alone | 2, the staging-only exit |
| t14-r3-floorcase-floors.txt | the floor lines of round 3's T14 `floorcase` boot at `c06cc695e` (passed) | — |

## Mutations added this round

| mutation | what it breaks | red on |
|---|---|---|
| n1-arm-ignores-own-floor | a waiter's want ignores its own floor | `a_floor_accounts_wait_is_answered_by_its_own_floor`; `a_wait_for_memory_is_never_missed` (step 446) |
| n2-met-ignores-superframes | the post does not look at whole superframes | `a_wait_for_a_superframe_is_answered_by_one_and_not_by_frames` |
| n3-met-ignores-deficit | the post ignores the floors' deficit | `a_floor_accounts_wait_is_answered_by_its_own_floor` ("answered while its floor is short") |
| n4-ready-beside-floors | `ready` uses the spare frames and superframes instead of `admit` | `a_floor_accounts_wait_is_answered_by_its_own_floor` |
| n5-met-ignores-row | the post ignores the row | `a_wait_for_a_run_is_answered_by_a_row` |
| m6, m10, m11 | as before, regenerated against the new rule | red |

n2, n3 and n5 relax the post to fire more often. They are spurious wakeups, not lost ones, so the model stays green under them. The targeted laws hold them.

## Guest controls

g1, g2, g3, g5 and g6 are red as in round 3. **g4 (no supervisor floor) was red in 3 of 4 runs here, where it was green in rounds 2 and 3:**
- In the first run, `fileserver data`'s retry was refused by the supervisor's own memory ("its job was refused no memory, so it is a limit or the supervisor's own refusal"), and its ports closed.
- In runs 3 and 4, starveling's ports closed the same way, and the run stalled.

So the supervisor's floor can matter, but the test does not show it reliably. Whether the difference comes from this round's wakeup timing or from the host load is not established.

## Metal sizes, round 3's T14 `floorcase` (`c06cc695e`)

| job | holds | peak | floor |
|---|---|---|---|
| supervisor | 36.9 MiB | 40.9 MiB | 64 MiB (`floorcase`) |
| ps2server | 12.0 MiB | 12.0 MiB | 24 MiB |
| logkeeper | 21.6 MiB | 21.6 MiB | 32 MiB |
| test-runner | 16.3 MiB | 16.3 MiB | 64 MiB |

The greedy job held 15 599 MiB. These match QEMU's `Profile::Metal` figures: supervisor 37.0 MiB and ps2server 12.0 MiB at the end of boot.
