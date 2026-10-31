# PR #1113: the arena holds only what is on the wire, and a flush keeps many writes there

- probe/: the attribution that preceded the change. Two boots, one per bench, of disk-path-probe 21265a06c: #1097's head plus #1098 and #1099, plus measurement-only timers. Both verdicts are `passed`.
  - P-*.lines.txt holds each boot's `disk-path-probe:` lines and its `persist.*` result lines.
  - attribution.txt is attr.py run over each boot's three 8 MiB rounds (lines 4-6 of the probe lines; earlier lines aggregate the small-fsync rows).
- host/ci-host.log: `cargo run -- --ci host` at a122cad77 over the tree in ci-host.diff (base f40791833). Exit 0, 105 steps green; every `error: test failed` lies in a `control` section. ci-host.try1.log is the first run, red on one clippy lint (`ok().expect()`), fixed by amending.
- host/build.log: `cargo run -- --build-only`, exit 0.
- red/red-m*: each mutation as a patch, applied, its named test run and failing (exit 101), then restored.
  - m1: the flush ignores the disk's depth.
  - m2: the flush hands copies.
  - m3: a run is begun after a refusal.
  - m4: the client holds a write's run until the covering flush.
- red/red-mutate-*: the CI's three blockring mutations run against the changed client and model. Each fails its CI-named test, exit 101.

## Round 2

## metal/: the A/B, base f40791833 against head a122cad77

The benches are T14 and AMD, one `benchcase` boot each, plus a second AMD boot of the base (`W-A-amd-run2`, from #1099's landing control). Every verdict is `passed` (`verdicts.txt`). Each `*.osbench.txt` holds a boot's `osbench v=2` lines only.

- `disk-rows.txt` (`rows.py`): every `persist.*` and `fs.disk.*` row, min/p50/max.
  - `persist.seq_write_fsync` p50: T14 154 → 207 MB/s; AMD 313 and 301 → 551.
  - `fs.disk.seq_write.1048576`: T14 198 → 435; AMD 389 and 345 → 762.
  - `fs.disk.seq_write.4096`: T14 146 → 176; AMD 242 and 220 → 303.
  - `fs.disk.seq_read.4096` on AMD: 165 and 152 → 447 (all rounds). Unexplained: the host model below reads the whole file from disk every round at both trees.
- `t14-metadata-spread.txt`: the T14's `create_write_unlink`, `open_close` and `rename` across this boot pair and the six earlier T14 boots of `pr-1099` (`metal-t14/`).
  - The head's `create_write_unlink` 160 µs and `open_close` 26.2 µs are inside the range that four boots of one tree (ddc26a3ea) show: 123–159 and 21.9–26.9.
  - `rename` 96.6 µs is 7% above that range's top (90.4), on one boot.

## plan/: host probes for the next seq_write steps (measurement only, never committed)

`probe.patch` adds a read and request count to data.rs's test disk, and two printing tests. `probe-aged*.patch` age the volume first and count the whole round. Each was applied to a clean tree and run with `cargo test -p fileserver --lib probe_ --release -- --nocapture`, exit 0, then reverted.

- `probe-main.log` (origin/main 0c7e62ca7) and `probe-1113.log` (6e85f748c), a fresh volume:
  - the 64 MiB file at the 16,384-block limit reads 16,385 blocks from disk in every round at both trees;
  - an 8 MiB round in 1 MiB writes lies in 1–2 runs, and its sync makes 68–69 write requests for 2,053 blocks.
- `probe-aged-1113.log` and `probe-aged2-1113.log`: the volume first aged as osbench persist ages DATA (105 synced 4 KiB appends, then 55 create-write-sync-unlinks). Still 68–69 requests a round, whether counted over the sync or the whole round. The metal probe's 169 requests per round (`probe/`) is therefore not reproduced on the host.

## rebase/

`cargo run -- --ci host` on #1113 rebased onto 0c7e62ca7. `ci-host.rev` holds the revision and the exit code.

Paths under the agent's home and scratch are masked.
