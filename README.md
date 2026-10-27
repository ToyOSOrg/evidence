# PR #1066 evidence

## r1

- `session-t14/`, `session-amd/`: the full osbench session of ToyOS `main`
  `aeba59fb0` against each bench's Linux, run by the orchestrator
  (2026-10-24): `compare.md`, the Linux `cpu.clock` lines, and ToyOS's
  `cpu.clock` and `control_regs` HWP lines from the T14 boot's kernel log.
- `net-session/`: #1065's network session (`osbench lan`, `osbench
  internet`), `compare.md` and the T14 Linux `cpu.clock` lines.
- `scout/`: the staged T14 readbacks, not yet run. `request-base.txt` is
  `main` `aeba59fb0`; `request-scout.txt` is `cpu-freq-scout`
  `3cdfa1a97a80e683b14316e43eca5c2c58a7818c` (measurement only, never
  lands): idle CPUs wait in MWAIT 0x31 instead of `hlt`. Image hashes and
  the staging logs (exit 2 is staging's own: no machine touched).

The T14's MSR dump under Ubuntu (turbostat --debug, MSR_TURBO_RATIO_LIMIT
0x2626262626262a2a) is #866's, published at
https://github.com/ToyOSOrg/ToyOS/pull/866#issuecomment-6119512404.

Paths are masked as `<scratchpad>` and `<home>`.

The first staging's images were deleted by something outside this
assignment at 21:56 CET on 2026-10-27, while the host ran out of disk. Both
were staged again from the same commits (`readback-*-2.log`);
`image-sha256.txt` and `request.txt` name the second staging's images.
