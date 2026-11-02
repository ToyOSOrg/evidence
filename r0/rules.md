# S0-a metal A/B: the rules, set before any boot (2026-11-02)

Images: base = main 058bea2d3; head = the PR head named in request.txt (42e2716c3).
Benches: T14 and the AMD bench. Order per bench: base, head, base, head (four
benchcase boots, the `osbench` row), then one head testcases boot. Each value is the
row's p50 from its boot's osbench output.

1. **Rows this change touches:** every `pipe.throughput.*`, `ipc.*` and `fs.mem.*`
   row, and `fs.disk.*` and `persist.*` as unchanged-path controls. A row has MOVED
   when both head values lie outside the range of both base values, on the same side.
   A moved row worse by more than 5% of the base mean is a REGRESSION, reported with
   its size before landing; whether it is accepted is the owner's call, not this rule's.
   A row that did not move is unchanged, whatever its means say.
2. **QEMU's order, to be confirmed or refuted per bench:** small pipe writes
   (`pipe.throughput.64`..`1024`) slower, large ones (`16384`, `65536`) faster;
   `ipc.reqrep.*` slower; `fs.mem.seq_write.*` and `fs.mem.write_4k_at` slower.
3. **The gate on hardware:** in the head testcases boot every listed member exits 0,
   and the boot log holds no "user_ptr: a user copy at preemption depth" panic and no
   kernel panic.
4. A boot that is invalid (marked INVL, or whose image hash differs from
   image-sha256.txt) is not a value. It is rerun once, and the rerun is recorded.
