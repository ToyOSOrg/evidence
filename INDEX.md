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
  - The same ToyOS rows on 2026-10-24's in-memory DATA (`fs.served.*`, `pr-1079`'s full-final run) read `read_4k_at` 16,822, `stat` 10,450, `rename` 58,002 ns, against 16,903, 10,530 and 59,154 here. So the file server's round trip, not the NVMe, sets them.
