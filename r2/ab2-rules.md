# S0-a metal A/B, round 2 (the bounce): the rules, set before any boot (2026-11-03)

Supersedes this file's earlier draft, which predates the bounce and staged nothing.

Images, all benchcase (the `osbench` row) except the last:
- **base** = main a0e8f1333, the PR's parent;
- **b4096** = the PR head 0d0a03065: transfers of at most 4096 bytes bounce, larger
  ones claim;
- **b1024** = the same head with `frame_bytes::BOUNCE` = 1024, the threshold's other
  candidate. It is an image-only variant and is never committed;
- **testcases** = b4096's testcases boot.

Benches: the T14 and the AMD bench. Order per bench: base, b4096, b1024, base, b4096,
b1024, then testcases. Each value is the row's p50 from its boot's osbench output.

Why these boots: QEMU gave no order. The host load was 13-62 and base's two rounds
differed tenfold (`qbench-table.txt`), so the threshold is chosen on metal. The two
b1024 boots are the price of that choice. Kernel-file rows are not this round's
subject: their code waits for #1152.

1. **Rows judged:** every `pipe.throughput.*` and `ipc.*` row. A row has MOVED between
   two arms when both of one arm's values lie outside the range of both of the
   other's, on the same side. A row of b4096 that MOVED worse than base by more than 5%
   of base's mean is a REGRESSION, reported with its size; accepting it is the owner's
   call.
2. **Expected:** against base, b4096's `pipe.throughput.64`..`4096` and
   `ipc.reqrep.8`/`4096`/`reqrep_handle.8` are unchanged or better. This is refuted
   per row by a REGRESSION. `pipe.throughput.16384`/`65536` keep round 1's gain (MOVED
   better). `ipc.reqrep.65536` is as in round 1.
3. **The threshold:** 4096 stands unless, on either bench, b1024 MOVED better than
   b4096 on `pipe.throughput.4096` or `ipc.reqrep.4096`. In that case 1024 is chosen,
   and the PR says which bench decided.
4. **The gate on hardware:** in the testcases boot every listed member exits 0. The boot
   log holds no "user_ptr: a user copy at preemption depth" panic and no kernel panic.
5. A boot that is invalid (marked INVL, or whose image hash differs from
   `image-sha256.txt`) is not a value. It is rerun once, and the rerun is recorded.
