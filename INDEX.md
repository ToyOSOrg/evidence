# PR #1097 evidence: persist and the disk's cached rows on ToyOS's DATA

## r1 (branch head c8f3fbfb0)

- `checks/ci-host-c8f3fbfb0.log`: `cargo run -- --ci host`, exit 0, 105 steps green.
- `checks/linux-build-c8f3fbfb0.log`, `linux-osbench-SHA256SUMS`: the Linux half, exit 0.
- `checks/stage-*.log`: the `osbench` row staged for the T14 and the AMD, exit 2. Image sha256: T14 a6d159051763d2cb81348efc157028413e2363105cf13fc94fd37bf553d632d3, AMD 78173e4dd42949248aaf0a526536606f2d6ffdcd1ad844bf8a7d18e6dcb87cbc.
- `judge/`: the `osbench` row at c8f3fbfb0 on three readbacks.
  - `amd-designated.log`: a copy of the AMD's real boot at fa7258221, whose DATA was the designated p4 (`fileserver: mounted the DATA volume`). Exit 0, PASS.
  - `t14.log`: the 2026-10-24 T14 boot, with DATA in memory. Exit 1, refused: "DATA was not the NVMe's partition".
  - `t14-formatting.log`: that boot with the format line substituted. Exit 1, refused as the format boot with its duration (0.000 s, from the substitution).

  The two T14 readbacks and their substitution are #1079's evidence (`pr-1079`, r2 and r3).

## r2: the AMD validation at c8f3fbfb0 (orchestrator, 2026-10-28)

- `amd/`: Linux, ToyOS (booted through the orchestrator's NVMe runner), Linux, all rc=0. `compare.md` is `osbench-compare` over the three, exit 0. Linux per run: `clocksource=hpet,tsc`.
- `judge-pre-1095-harness.log`: this branch's harness refuses the readback ("boot file names no stick_secs"). The runner is #1095's and the harness predates it, so this is a tooling mismatch, not a result. The judge runs again once this branch is on #1095.
- The disk rows: ToyOS (one boot) against Linux (two runs).
  - `persist.fsync_clean`: 1,233,821 ns against 69,703 and 56,649.
  - `persist.write_4k_fsync`: 2,906,019 ns against 3,568,240 and 3,012,576.
  - `persist.seq_write_fsync`: 337 MB/s against 506 and 520.
  - `fs.disk.read_4k_at`: 16,903 ns against 2,375 and 1,463.
  - The same ToyOS rows on 2026-10-24's in-memory DATA (`fs.served.*`, the orchestrator's full-final session, `compare-2026-10-24-full-final.md` here) read `read_4k_at` 16,822, `stat` 10,450, `rename` 58,002 ns, against 16,903, 10,530 and 59,154 here. So the file server's round trip, not the NVMe, sets them.

## r3 (branch head 069cbbeb8, rebased on #1095 at 370d7d9f6): review r1

- `checks/ci-host-b4121ccc0.log`: `cargo run -- --ci host`, exit 0, 105 steps green. 069cbbeb8 adds only an issue record.
- `checks/stage-*.log`: the `osbench` row staged at 069cbbeb8 for the T14 and the AMD, exit 2. Image sha256: T14 53622cdcd690522cedd64c953a415f0a64d86633fd5f3a44ae0758baf3507304, AMD 5f188265750b7467cd6bffa539330fd87398288996033071b0f293d9bd424594. The Linux half's sha256 is in `checks/linux-osbench-SHA256SUMS`.
- `judge/`: the rebuilt judge (`hostdisk::left_alone` with the loader's volumes) at b4121ccc0 on four readbacks:
  - `amd-nvme-runner.log`: the AMD's c8f3fbfb0 boot through #1095's NVMe runner, which the old harness could not read. Exit 0, PASS.
  - `amd-designated.log`: the AMD's fa7258221 boot, DATA designated and mounted. Exit 0, PASS.
  - `t14.log`: the 2026-10-24 boot with DATA in memory. Exit 1, refused.
  - `t14-formatting.log`: the format substitution. Exit 1, refused as the format boot.
- `probe/`: the fileserver cache probe for review B2's seq_read cause. Applied, run and reverted in one script, exit 0. A file of `CLEAN_LIMIT + 16` blocks made 16,400 disk requests on each of five passes, and `CLEAN_LIMIT - 16` made none. Filed as `issues/a-sequential-read-of-a-file-as-large-as-datas-clean-cache-reads-the-disk.md`.
- `t14/`: the orchestrator's T14 validation at c8f3fbfb0, before the rebase. Linux, ToyOS, Linux, all rc=0, judge PASS. `persist` completed in 11 s with DATA mounted, and the 64 MiB `fs.disk.seq_write` ran without a file server restart. `compare.md` exits 0, with `clocksource=tsc,tsc`. The disk rows, ToyOS against Linux:
  - `persist.fsync_clean`: 3.02 ms against 23 µs;
  - `persist.write_4k_fsync`: 6.13 ms against 0.81 to 1.01 ms;
  - `persist.seq_write_fsync`: 162 against 587 to 598 MB/s;
  - `fs.disk.read_4k_at`: 18.0 µs against 0.74 to 0.76 µs;
  - `fs.disk.seq_read.4096`: 435 against 7,760 MB/s.

  The flush cost is filed as `issues/a-durable-write-on-the-t14s-nvme-costs-toyos-six-times-linuxs.md`. This run predates the rebase's image and the Linux half's new fields, so B5's landing-head runs are the ones staged above.

## r4: the landing head's validation, 069cbbeb8 (orchestrator, 2026-10-28)

- `t14/`, `amd/`: each is Linux, ToyOS benchcase (booted off the internal NVMe), Linux, then the `osbench` row judged from a tree pinned at 069cbbeb8. Judge exit 0 and PASS on both. `compare.md` exits 0. Linux per run: `clocksource=tsc,tsc` on both. Linux's `fs.disk.served_by` now ends `write cache write back` on both.
- Disk rows, ToyOS against Linux:

  | row | T14 | AMD |
  |---|---|---|
  | `persist.fsync_clean` | 0.46 ms vs 23 µs | 1.26 ms vs 64–66 µs |
  | `persist.write_4k_fsync` | 1.10 vs 1.01–1.04 ms | 2.60 vs 2.99–3.58 ms |
  | `persist.append_4k_fsync` | 1.01 vs 0.91–1.20 ms | 2.93 vs 3.30–3.78 ms |
  | `persist.seq_write_fsync` | 347 vs 527–585 MB/s | 298 vs 544–548 MB/s |
  | `fs.disk.read_4k_at` | 18.2 vs 0.72–0.74 µs | 20.5 vs 1.46–1.47 µs |
  | `fs.disk.seq_read.4096` | 431 vs 7,760–7,780 MB/s | 151 vs 5,084–5,089 MB/s |

- The T14's durable writes read 1.10 ms here against 6.1 ms in r3's boot at c8f3fbfb0, with no storage-path change between them. The record now states both: `issues/toyos-durable-writes-on-the-t14s-nvme-took-1-to-6-ms-across-two-boots.md`.

## Correction: r3's probe patch republished whole

`r3/probe/probe-clean-limit.patch` as first published held 10 of its 31 lines: the publishing step dropped every line beginning `+ `, meant for shell trace lines, and so the patch's added test too. It is replaced with the patch that ran, which defines `probe_sequential_passes_against_the_clean_limit`, the test `probe.log` reports. The result is unchanged: 16,400 disk requests a pass over the limit, none under.
