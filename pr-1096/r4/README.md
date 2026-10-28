# PR #1096 r4: rebased onto main 370d7d9f6 (#1095), and r3's AMD boots judged, at ToyOS ce75c008c

The orchestrator ran the images staged at 7a77fa390 (`../r3/metal-request.txt`) on the AMD bench through #1095's NVMe runner, pinned at 7bfbea26d. `testcases` and `testcases-watchdog` exited 0. `watchdogwedge` exited 1 only because that runner's loop verdict predates this PR's round-2 rule (`watchdogwedge-flasher-verdict.txt`).

The rebase changes no ToyOS code this PR touches; the boots' loader and kernel are 7a77fa390's, and ce75c008c only narrows a doc comment in `lib/tco/src/fch.rs`. The rebase moved the `rust` pin, and this worktree's fork checkout was moved to it with the command the build named (`git -C rust checkout --detach 8004d62da`; the old head is an ancestor and the checkout was clean).

| file | command | exit |
|---|---|---|
| `ci-host.log` | `cargo run -- --ci host` at ce75c008c | 0 (105 green) |
| `build-x86_64.log`, `build-aarch64.log` | `cargo run -- --build-only [--arch aarch64]` | 0, 0 |
| `rejudge-once.diff`, `rejudge-verdict.log` | an uncommitted test, appended to `tests/metal/src/lib.rs` and removed after, that recomputes `boot_verdict` from `watchdogwedge`'s stored `loader.log`, `kernel.log` and the image's parameters, written into a *copy* of the three readbacks | 0, `Ok(241)`: `watchdogwedge-rejudged-verdict.txt` |
| `judge.log` | `cargo test --test toyos-build -- --metal --metal-host toyos@bench-amd --metal-readback <copy> loader_watchdog_arms watchdog_fed watchdog_resets` | 0: all three PASS, 7 numbers within the record |

The loader excerpts are the bench's lines. On every pass `PMx000=0xe2060b77` (undecoded), so `fired=unread`. `S5ResetStat`'s read-back after the write shows that the write clears bit 25 (`0x02000800` → `0x00000800`) and bit 19 (`0x00080800` → `0x00000800`), and that bit 11 stays set through the write. No stale `WatchdogFired` was found by the arm.
