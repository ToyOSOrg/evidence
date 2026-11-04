# S0-a metal A/B, round 4: the rules, set before any boot (2026-11-04)

Images:
- **base** = `s0a-probe-base`: main a0e8f1333 with the measurement-only probe;
- **head** = `s0a-probe`: the PR head 05f6c884f with the same probe;
- **testcases** = the PR head 05f6c884f's testcases boot, without the probe.

The probe keeps each syscall number's wall-clock ticks, beside the count every kernel
keeps, and prints `probe_ns_per_call N:ns` in each exit line. Both benchcase arms carry
it, so its cost is common to them, and the A/B judges #1150's change alone. It needs no
boot of its own.

The threshold is settled at 4096 by round 3: b1024 moved worse than b4096 on
`pipe.throughput.256` and `4096` on both benches, and better on no hot row
(`ab3-table.txt`). So round 4 stages no b1024.

Benches: the T14 (while its DATA volume is down, the AMD half runs first) and the AMD
bench. Order per bench: base, head, base, head (benchcase, the `osbench` row), then
testcases. Each value is the row's p50 from its boot's osbench output.

1. **Rows judged** (the owner's ruling of 2026-11-04): the hot rows are
   `pipe.throughput.64`..`4096`, `ipc.reqrep.8`, `ipc.reqrep.4096` and
   `ipc.reqrep_handle.8`.
   - A row has MOVED when both head values lie outside the range of both base values, on
     the same side.
   - A hot row that MOVED worse, by any amount, is a REGRESSION and blocks landing.
   - Any other `pipe.throughput.*` or `ipc.*` row that MOVED worse past 5% of base's
     mean is a REGRESSION.
2. **The probe is evidence, not a verdict.** For the IPC processes (the two
   `osbench_ipc` exit lines) and the pipe benchmark's process (the `osbench_system` line
   with the most syscalls), report each arm's mean ns per call for every number the
   rows exercise:
   - `SYS_WRITE` (0) and `SYS_READ` (1);
   - `message_send` and `message_recv`, the numbers the exit lines count 32,400 times;
   - `FUTEX_WAIT` (58) and `FUTEX_WAKE` (59).

   The comparison names the syscalls whose cost differs between the arms. It decides
   nothing by itself.
3. **The futex oracle:** the pipe benchmark's `FUTEX_WAIT` count stays below 1,000 in the
   head boots, as in round 3.
4. **The gate on hardware:** in the testcases boot every listed member exits 0. The boot
   log holds no "user_ptr: a user copy at preemption depth" panic and no kernel panic.
   - A member that fails because the bench's DATA volume does not mount (its own
     `BadMagic` line) is recorded as the bench's, not the change's, and rerun once the
     volume is restored.
5. A boot that is invalid (marked INVL, or whose image hash differs from
   `image-sha256.txt`) is not a value. It is rerun once, and the rerun is recorded.
