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
