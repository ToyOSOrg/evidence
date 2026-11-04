# S0-a metal A/B, round 3: the rules, set before any boot (2026-11-04)

Images, all benchcase (the `osbench` row) except the last:
- **base** = main a0e8f1333, the PR's parent;
- **b4096** = the PR head d206fddff. Transfers of at most 4096 bytes bounce, filled in
  place, and the SDK's lock spins before it sleeps;
- **b1024** = the same head with `frame_bytes::BOUNCE` = 1024. It is an image-only
  variant and is never committed;
- **testcases** = b4096's testcases boot.

Benches: the T14 and the AMD bench. Order per bench: base, b4096, b1024, base, b4096,
b1024, then testcases. Each value is the row's p50 from its boot's osbench output.

Why round 3:
- **Round 2 was confounded.** Its head moved the whole bounce on every bounced pipe write
  and send: 4104 bytes at b4096, and about 1 KiB at b1024, whose bounce is that size. Its
  threshold comparison measured that copy as much as the threshold.
- **The SDK lock.** Round 2's pipe benchmark threads met on the SDK's descriptor-table
  lock about a thousand times as often as on main, each meeting a futex sleep and wake.
  Round 3's head spins before it sleeps.

**The owner's ruling (2026-11-04):** small pipe writes and IPC are hot paths, and no loss
there is accepted.

1. **Rows judged:** every `pipe.throughput.*` and `ipc.*` row. A row has MOVED between
   two arms when both of one arm's values lie outside the range of both of the
   other's, on the same side.
   - The **hot rows** are `pipe.throughput.64`..`4096`, `ipc.reqrep.8`, `ipc.reqrep.4096`
     and `ipc.reqrep_handle.8`. A hot row of b4096 that MOVED worse than base, by any
     amount, is a REGRESSION and blocks landing.
   - On the other rows, a MOVED-worse row past 5% of base's mean is a REGRESSION.
2. **The futex oracle:** in each benchcase boot, take the `exit: osbench_system` line with
   the most syscalls, the pipe benchmark's process (pid 16 on the T14, 14 on AMD). Read
   its `58=` (`FUTEX_WAIT`) count. On main it is 125-205 (ab2). Round 2's head made
   17,000-161,000 (`ab2-futex.txt`). Round 3's head is expected below 1,000 on both
   benches. Above that, the spin did not answer the contention, and the PR says so.
   (Corrected before any round-3 boot: the first draft named pid 16, which is the T14's
   alone.)
3. **The threshold:** the arm whose hot rows have no REGRESSION is chosen. If both
   qualify, 4096 stands unless b1024 MOVED better than b4096 on any hot row, on either
   bench, and moved worse on none.
4. **The gate on hardware:** in the testcases boot every listed member exits 0. The boot
   log holds no "user_ptr: a user copy at preemption depth" panic and no kernel panic.
5. A boot that is invalid (marked INVL, or whose image hash differs from
   `image-sha256.txt`) is not a value. It is rerun once, and the rerun is recorded.
