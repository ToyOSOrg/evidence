# #1057, round 2: review r1's fixes

Head `87636be37`. The round's code is `a3372379e`; `87636be37` changes only the proving test's header, one printed line and `floorcase.toml`'s comment. Paths are masked.

| file | command | revision | exit |
|---|---|---|---|
| ci-host-r2.log.gz | `cargo run -- --ci host`: 103 steps, all green | `87636be37` | 0 |
| r2-proving-final.log.gz | `memory_floor_holds_the_controls` | `87636be37` | 0 |
| frames.log | `cargo test -p kernel --lib frames`: 32 laws, and `controls/m9`, `m10` applied, run and reversed | `a3372379e` | 0, then 101 each |
| guest.log, proving-1..3, g1..g6 | the proving test three times, then `controls/g1`–`g6` each applied, run and reversed | `a3372379e` | 0 ×3; see below |
| rows-r2.log.gz | the 22 QEMU rows of round 1 | `87636be37` | 0 |
| sweep-r2.log.gz, sweep-tk-r2.log.gz | the 88 shared Rust members through `scratch-sweep.patch`; the 7 actuator members on the test kernel | `87636be37` | 1 for the 7 actuator members alone, 81 green, no kernel panic; then 0 |
| measure-1.log.gz, measure-2.log.gz | floor jobs' accounts through `scratch-measure.patch` (never committed): `console_image_boots`, and `images/system.toml` on `Profile::Metal` with the desktop session and four terminal launches, each running `ls` | `a3372379e` | 0 |

## Floor sizes, measured (blocker 5)

Peak of each floor job's account, `committed + kernel`:

| image | supervisor (floor 96 MiB) | ps2server (floor 24 MiB) |
|---|---|---|
| `images/console.toml`, at its shell's launch | 53 MiB | 11.4 MiB |
| `images/system.toml`, desktop and 4 launches | 66 MiB | 13.6 MiB |

The supervisor grows about 1 MiB per launched program that still runs (51 MiB at its loop, then 52, 60, 61, 62, 63, 64, 65, 66 MiB over the launches). About 30 further live launches fit before it is past its floor, from which point it competes as an ordinary job. usbd peaked at 18 MiB and has no floor now.

## Controls

| control | what it breaks | result |
|---|---|---|
| m9-pool-fixed-at-first | a charge keeps the pool of its first growth | `a_charge_made_before_its_floor_grows_from_it` red |
| m10-refusals-uncounted | a refusal is not counted on its job | `a_wait_for_memory_is_answered_once_what_it_lacked_comes_back` red |
| g1-floors-not-held | no floor is held for anyone | red. **Correction to round 1's README:** what fails is the test job itself, which aborts (`code=134`) right after its first PASS, because test-runner's own floor is gone. It is not "the stop is never answered". |
| g2-no-retry | a restart refused for memory closes the ports | red: `ServerGone` on the kept port |
| g3-no-returned-post | the allocator never posts that memory came back | red at the greedy job's own re-take, which waits on the same event |
| g4-no-supervisor-floor | `floorcase.toml` without the supervisor's floor | **green.** The stop is answered without it: once a connection's rings are its client's, answering takes nothing of the supervisor's own. The test makes no claim for the supervisor's floor, and the PR withdraws it. |
| g5-no-ps2server-floor | `floorcase.toml` without ps2server's floor | red at the key: its connection's first write needs a ring, counted to ps2server, which connected. Refused, ps2server reconnects and the key is lost. |
| g6-ring-to-first-writer | a ring is counted to its first writer again | red: "the server's reply was charged to the server" |

`fileserver data` is refused its restart in these runs and starts again. `memory_floor_holds_the_controls` now asserts that every service the supervisor says it refused for memory starts again (`proving-*`).
