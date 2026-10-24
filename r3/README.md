# #1057, round 3: review r2's fixes

Head `c06cc695e`. Every run below is at `c06cc695e`, from a clean tree. Paths are masked (`<worktree>`, `<scratch>`, `<home>`).

| file | command | exit |
|---|---|---|
| ci-host.log.gz | `cargo run -- --ci host`: 103 steps, all green | 0 |
| frames.log | `cargo test -p kernel --lib frames`: 33 laws, then `controls/m1`–`m11`, each applied, run and reversed | 0, then 101 for each of the 11 |
| guest.log, proving-1..3, g1..g6 | `memory_floor_holds_the_controls` three times, then `controls/g1`–`g6`, each applied, run and reversed | 0 ×3; see below |
| rows.log.gz | the 22 QEMU rows of rounds 1 and 2, `session_lifecycle` and `console_image_boots` among them (the session protocol changed) | 0 |
| sweep.log.gz, sweep-tk.log.gz | the 88 shared Rust members through `scratch-sweep.patch`, then the 7 actuator members on the test kernel | 1 for the 7 actuator members alone, 81 green, no kernel panic; then 0 |
| measure.log.gz | `scratch-measure-r3.patch` (never committed): `console_image_boots` green; its `images/system.toml` boot waited for test-runner's marker, which that image does not run, and timed out | 1 (the harness patch's fault) |
| measure-2.log.gz | the same patch waiting on `compositor: ready`: `images/system.toml` on `Profile::Metal`, the desktop session and four terminal launches, each running `ls` | 0 |
| t14-request.txt | `cargo test --test toyos-build -- --metal --metal-readback <dir> memory_floor osbench kernel_objects_refused`: three images staged, no machine touched | 2, the staging-only exit |

## Floor jobs' accounts (blocker 1)

`committed + kernel`, as the supervisor prints them:

| image | supervisor (floor 96 MiB) | ps2server (floor 24 MiB) |
|---|---|---|
| `images/console.toml`, at its loop | 36.9 MiB, peak 38.9 MiB | 12.0 MiB |
| `images/system.toml`, at its loop | 37.0 MiB, peak 39.0 MiB | 12.0 MiB |
| `images/system.toml`, desktop session and 4 launches | 41.7 MiB, peak 43.7 MiB | 14.0 MiB |

Round 2 measured 66 MiB after the same launches, growing about 1 MiB a launch: each child's image was read into the supervisor's account. It is now read for the child's job, so the 4 launches move the supervisor from 42 653 KiB to 42 668 KiB, a few KiB each for the handle, notice and connectors it keeps per live program. A session's control connection and link are connected by the opener and the owner, so their rings are theirs.

## Controls

| control | what it breaks | result |
|---|---|---|
| m11-ready-ignores-superframes | readiness and the memory-returned post count frames only | `a_wait_for_a_superframe_is_answered_by_one_and_not_by_frames` red |
| m6, m9, m10 | as in round 2, regenerated against the head | red |
| g1-floors-not-held | no floor held | red: test-runner's own job aborts after its first PASS |
| g2-no-retry | a restart refused for memory closes the ports | red: `ServerGone` on the kept port |
| g3-no-returned-post | no memory-returned post | red at the greedy job's re-take |
| g4-no-supervisor-floor | `floorcase.toml` without the supervisor's floor | green, as in round 2: the test makes no claim for the supervisor's floor |
| g5-no-ps2server-floor | `floorcase.toml` without ps2server's floor | red at the key |
| g6-ring-to-first-writer | a ring counted to its first writer | red: "the server's reply was charged to the server" |
