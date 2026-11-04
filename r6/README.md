# pr-1150 r6: round 4's AMD half read

- `ab4-amd-table.txt`, `judge4.py`: the AMD half of round 4, judged by `r5/ab4-rules.md`.
  Base `s0a-probe-base` 9af33a79a; head `s0a-probe` 13cca17b9; both carry the probe. Five
  boots, all passed, hashes matching. `fs.disk.*` and `persist.*` are void on this bench
  and not judged.
  - The hot IPC rows regress: `ipc.reqrep.8` +17%, `reqrep.4096` +43%,
    `reqrep_handle.8` +17%.
  - The pipe rows did not move. Base boot 3 ran in another mode (64 B at 49 MB/s, 4 KiB
    at 5311 MB/s), so base's range spans the head's. That is inconclusive, not a recovery.
- `ab4-amd-probe.txt`: mean ns per call. `SYS_MESSAGE_SEND` is 1043-1103 ns on base and
  1306-1326 on the head's normal boot (2062-2151 on its slow boot). The pipe reader's
  `SYS_READ` is 1030-1052 on base and 1124-1290 on the head.
- The futex check holds: the head makes no `FUTEX_WAIT` in the pipe benchmark, base
  92-218.
- The testcases boot (05f6c884f) passed: 14 of 14, no gate panic, no kernel panic.
