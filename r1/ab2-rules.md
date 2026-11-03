# S0-a metal A/B, round 2: the rules, set before any boot (2026-11-02)

Images: base = main a0e8f1333 (the rebased PR's parent); head = the PR head named
in request.txt. Benches: T14 and the AMD bench. Order per bench: base, head, base,
head (four benchcase boots, the `osbench` row), then one head testcases boot.
Each value is the row's p50 from its boot's osbench output.

Why a new A/B and not only the changed rows: the PR was rebased onto main, which
brought #1139's memcpy, so round 1's base (058bea2d3) no longer measures this
change; and round 1 found regressions the owner must judge on the final code.
The shared-debug boot (handle_lifetime) is not restaged: nothing round 2 changed
is on its path, and round 1 ran it green on both benches at 42e2716c3.

1. **Rows:** every `pipe.throughput.*`, `ipc.*` and `fs.mem.*` row, and `fs.disk.*`
   and `persist.*` as unchanged-path controls. A row has MOVED when both head values
   lie outside the range of both base values, on the same side. A moved row worse by
   more than 5% of the base mean is a REGRESSION, reported with its size before
   landing; whether it is accepted is the owner's call, not this rule's. A row that
   did not move is unchanged, whatever its means say. (Round 1's rule, unchanged.)
2. **Round 1's order, to be confirmed or refuted per bench** (round 1, base
   058bea2d3, head 42e2716c3): T14 `pipe.throughput.64`..`1024` 28-30% worse and
   `16384`/`65536` 70-80% better; T14 `ipc.reqrep.*` 12-26% worse; on both,
   `fs.mem.fstat` 10-17%, `fs.mem.seek` 17-19% and `fs.mem.pread_8` 7% worse, and
   `fs.mem.seq_write.*` 6-14% worse.
3. **What round 2 should move:** `fs.mem.fstat` and `fs.mem.pread_8`/`pread_4k`
   no longer take a lock, so expected unchanged or better against base; refuted if
   either is a REGRESSION. `fs.mem.seek` still takes the position's sleeping lock and
   is expected as in round 1. The turn change adds no lock hold, so the pipe and ipc
   rows are expected as in round 1.
4. **The gate on hardware:** in the head testcases boot every listed member exits 0,
   and the boot log holds no "user_ptr: a user copy at preemption depth" panic and no
   kernel panic.
5. A boot that is invalid (marked INVL, or whose image hash differs from
   image-sha256.txt) is not a value. It is rerun once, and the rerun is recorded.
