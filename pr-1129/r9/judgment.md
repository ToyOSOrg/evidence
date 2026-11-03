# ab10 judged against decision-rule.md (fixed before staging)

Twelve AMD benchcase boots: 3 each of base (#1117 + diagnostic), head (#1129 + diagnostic + waker hunk), norule (head with
`WAKER_RUN = u16::MAX`) and spawn (#1153 + diagnostic), in the order the request gave. All 12 runner verdicts read `passed`,
and the orchestrator reports EXIT=0 for all. Judge output: `judge-ab10.txt` (`tools/ab10.py`, rc=0). LLCs are CPUs 0-7 and
8-15.

## Bimodal rows: a resolved ratio there reads which mode each boot fell in
Several rows sit in one of two modes per boot, and base itself shows both:
- `wake.periodic.idle`: 6 or 35 us
- `thread.spawn_join`: 20 or 27 us
- `fs.disk.direct.*`: about 7.8k or 9.5k ns for `seek`
- `fs.mem.pread_8`
- `crunch.single.deflate`: 63.7 or 67.5 ms
- `proc.spawn_wait.tiny`: 45-49k or 63k ns

A ratio that "resolves" on 3 boots of such a row reads mode counts, not a cost. The rule did not anticipate this. Its
verdicts below follow its letter, and each mode row is marked.

## #1129: NOT LAND-eligible by the rule. Per the consolidation rule, it closes
- **Gain** (rule, head/norule): `ipc.reqrep.8` 0.857 PASS, `ipc.reqrep_handle.8` 0.847, every `fs.disk.direct.*` and
  `fs.disk.*` metadata row 0.81-0.86, `persist.fsync_clean` 0.855. Against base: `ipc.reqrep.65536` 0.600 and `.4096` 0.758.
- **Build:** `work.build_shaped.j16` head/base 0.979 PASS.
  - The build parent's named wakers are **the file server**: `fileserver.2` posted 3547-3683 of the about 3700 named wakes in
    every head and norule boot.
  - So the parent is a file server client, and the rule rightly treats it as one.
- **P, plumbing (norule/base), slowdowns over 2% that resolve:**
  - `mem.munmap_touched_remote.4k` +7.2%. It is 3085-3095 ns in all six #1129 boots, against 2746-2965 on base and
    2935-2945 on spawn, and it read +5-10% in ab5-ab9. **Real and consistent; mechanism not found.** BLOCKS.
  - `thread.spawn_join.stack64k` +2.2% (19.85-19.90k against 19.28-19.65k). BLOCKS by the rule.
  - `fs.disk.direct.seek` +8.1%, `fs.mem.pread_8` +11.5%, `wake.periodic.idle` 2.26x: mode rows (base has a boot in the
    fast mode, norule none). Not costs.
- **R, rule (head/norule), slowdowns over 3% that resolve:**
  - `pipe.throughput.16384` 0.41x. Per class head matches norule (same-LLC 0.986, split 4096 0.953, split 65536 0.979;
    PASS). Head's reader sat in LLC 1 (cpu10) against the writer rotation, so 5-6 of 7 rounds ran split. That is #1153's
    defect, which the rule's placement of osbench's main thread exposes.
  - `process.spawn_wait` +7.0% (head 420-466k, norule 413-415k, base 423-455k): head is inside base's range.
  - `crunch.single.deflate` +3.5%: a mode row (base and spawn each have a boot at 67.6 ms).
  - `time.sleep_late.1us` +4.7% (head 1324-1354, norule 1254-1294, base 1305-1375): head is inside base's range.
  - `persist.append_4k_fsync` +3.1% (head/base +2.0%).
  - By the rule's letter these block. Only `munmap_touched_remote` is a clean, repeated, non-mode cost.
- **ab9's blockers classified:**
  - `mem.munmap_touched_remote.4k`: P.
  - `thread.spawn_join`: mode. It sits in the 27 us mode in every #1129 boot and in 2 of 3 base boots. On spawn it is 20.4-20.5
    us in all 3 boots, so the 27 us mode is the joined thread spawned in the other LLC.
  - `fs.disk.seek`, `mem.anon.map`, `wake.storm.call.w64`, `wake.storm.drain.w4`: neither. `mem.anon.map` reads +5-7% in
    every non-base arm, spawn included, which points to the image and not the code.

## #1153 (spawn fix): S1 PASS, S3 PASS, S2 FAILS by the rule
- **S1:** 0 split rounds in every spawn boot at every size (63 of 63 timed rounds in one LLC). p50s 5177, 8330 and 10171
  MB/s against base's same-LLC 4961, 8339 and 10141. PASS.
- **S3:** `work.build_shaped.j16` 0.996. `ipc.reqrep.8` does not resolve. PASS.
- **Faster:**
  - `thread.spawn_join` 20.4-20.5 us in all 3 boots, against base 20.4, 27.2 and 27.3: the slow mode is gone.
  - `pipe.throughput.*` 1.4-1.7x.
  - `wake.storm.call.w1/w4/w16` -6 to -9%.
  - `mem.realloc_grow.1m_256m` -19%.
- **S2: slowdowns over 3% that resolve:**
  - `proc.posix_spawn_wait.tiny` +23% and `proc.spawn_wait_loop.100` +21%. These spawn processes, which the change places
    as before. `proc.spawn_wait.tiny` is bimodal (base 45k, 49k and 63k; spawn 59-63k), and the main thread sat on cpu7 in
    every spawn boot. So these read where the parent ended up against the process rotation, not a cost of the term. That
    is an inference.
  - `wake.storm.drain.w16` +17% (84.7k, 101.5k and 90.9k against 78.5-79.7k) and `.w4` +4.1%: a producer's 16 threads now
    fill its LLC's free cores first. Not explained.
  - `fs.mem.seq_read.4096` +4.7%: spawn only. Not explained.
  - `mem.anon.map` +5.6%: in every non-base arm.
  - `fs.disk.read_4k` +4.1% and `fs.disk.direct.*` +7-9%: base had one boot in the fast mode.
- **Verdict:** not landable by the rule. S2 fails on `wake.storm.drain.w16` and `fs.mem.seq_read.4096` at least, and on the
  process-spawn rows by letter.
