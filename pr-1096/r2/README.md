# PR #1096 r2: the AMD bench's readback, rejudged, at ToyOS 987f38ea94

The orchestrator ran the three staged images on the AMD bench at 3f0beab04 (owner present). `testcases-watchdog` and `testcases` passed `loader_watchdog_arms` and `watchdog_fed` under its own judge. In `watchdogwedge` the FCH watchdog reset the machine and it came back to Ubuntu alone (`watchdogwedge-loader-excerpt.log`), but the loop refused the boot (`original-verdict.txt`): it knew no ending for a wedge but the kernel's own bounds. r2 adds that ending; no new boot was needed. Paths are masked as `<home>`.

| file | command | exit |
|---|---|---|
| `ci-host.log` | `cargo run -- --ci host` at 987f38ea9 | 0 (105 green) |
| `build-x86_64.log` | `cargo run -- --build-only`, with the loader's print change | 0 |
| `rejudge-once.diff`, `rejudge-verdict.log` | an uncommitted test, appended to `tests/metal/src/lib.rs` and removed after, that recomputes `boot_verdict` from the stored `loader.log`, `kernel.log` and the image's parameters, and writes `verdict.txt` into a *copy* of the readback | 0, verdict `Ok(241)`, `rejudged-verdict.txt` |
| `judge-resets.log` | `cargo test --test toyos-build -- --metal --metal-host toyos@bench-amd --metal-readback <copy> watchdog_resets`, before the census fix | 1: `watchdog_resets` PASS, timings red on a panel census an unsealed page cannot carry |
| `judge-resets-2.log` | the same, after it | 0, `watchdog_resets` PASS |
| `judge-arm-fed-2.log`, `-3.log` | `… --metal-readback <original> loader_watchdog_arms watchdog_fed` | 1: both rows PASS; timings red because the shared bench record had lost its `[stick]` section to another writer meanwhile (see the PR) |

The two loader excerpts are the bench's own lines. On the first pass, `PMx000=0xe2060b77` (`WatchdogTmrEn` clear) and the arm read back `0xe2060bf7`. On the pass after the reset, `PMx000` is again `0xe2060b77`, so `WatchdogFired` is unread (`fired=0`) and `S5ResetStat=0x02000800` carries bit 25.

## Controls (`controls/`), against 987f38ea9

| mutation | caught by |
|---|---|
| `unwatched`: the chipset's reset accepted for an image not armed with the watchdog | `a_watched_wedge_is_ended_by_the_chipsets_reset` |
| `any-pass`: the reset line read off the whole `loader.log`, the first pass's survey included | the same |
