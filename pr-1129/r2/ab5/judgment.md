# ab5: #1129 at b8bd0ea02 on the AMD bench, judged

Base `5aa902055` (the stack to #1117 `8ab51591b`, plus #1126's `ran=`) against head `eb93d942c` (#1129 `b8bd0ea02` plus the same).
8 benchcase boots, interleaved base/head, each one image per side; every boot EXIT=0 (runner).

Judged with `cargo test --test toyos-build -- --metal --metal-readback judge/<side>-<n> --metal-host toyos@bench-amd boot:benchcase`,
each in the pinned check tree at its side's revision (`judge/*.judge.log`, `judge/exits.txt`). Every judge exits 1:
`osbench` PASSes in all 8, and the two I219 rows, which are T14-only and which `boot:benchcase` takes in, red on the AMD, as the
request said beforehand and as ab4 showed.

Rules fixed before the run (request, review of #1129): read `ran=` and p50 for the ipc and fs pairs; read the fair/sched rows for
regressions; a row resolves only when all 4 of one side beat all 4 of the other (exact Mann-Whitney, two-sided p = 0.029).

## Placement (the claim)

| row | base | head |
|---|---|---|
| `ipc.reqrep.*` pair in one LLC | 2 of 4 (boots 3, 4 split) | 4 of 4 |
| `fs.disk.read_4k_at` pair in one LLC | 2 of 4 (boots 2, 4 split) | 4 of 4 |

Pooled with ab3's 18 rows (12 split), the base splits 16 of 26, so 4 of 4 one-LLC by chance is about 0.4^4 = 0.026 per row.

p50s: head `ipc.reqrep.8` 6853, 6913, 6933 ns in the one-LLC mode; boot 1 read 8015 ns with the pair on cpu3+cpu2, SMT siblings
(the kernel's `topo:` lines: cores are {2k, 2k+1}). `fs.disk.read_4k_at` head 9758, 9779, 9929 ns; boot 3 read 11432 ns on
cpu15+cpu14, siblings. Base has a sibling boot too (fs, cpu11+cpu10, 11221 ns). The sibling mode is not attributed to #1129:
its move takes a free core first.

`ipc.reqrep.65536` (#1121): base 31.4, 31.7, 51.1, 52.7 us (the two split boots are the slow ones); head 32.6, 32.7, 33.1,
41.4 us (41.4 is the sibling boot). The 2x AMD reading is consistent with a split pair.

## Other rows (144 compared, 20 resolve, about 4 expected by chance)

Better on head: `pipe.throughput.256/4096/65536` 2.1-2.5x (MB/s; base runs are bimodal within a row, head sits in the fast mode),
`wake.storm.drain.w4` -10%, four `fs.mem` rows -1 to -2%, `malloc_churn.4096.t16` +1%.

Worse on head: `wake.storm.call.w1/w4/w64` +6 to 7%, `wake.storm.drain.w1` +3%, `thread.spawn_join.default` +5% and
`.stack64k` +3%, `mem.munmap_touched_remote.4k` +8%, `wake.periodic.idle` +3%, `time.sleep_late.10ms` +2%, `mem.mprotect.4k` +2%,
`pingpong.pipe.cross_core` +1.5%, `fs.mem.mkdir_rmdir` +0.6%. Unresolved but large: `wake.storm.drain.w16` median +23%.

fair.* and wake.onto_busy, wake.periodic.loaded: unchanged.

Inference, not established: `thread.spawn_join` is a wake whose waker exits, from a child spawn placement puts on either LLC, so
under a run of 2 the parent followed dead children's LLCs; `wake.storm`'s waiters are all woken by one producer and move into its
LLC. Rows with timer wakes only (`wake.periodic.idle`, `sleep_late`) cannot reach the rule, so those shifts are either image
layout (one image per side) or chance.

## Verdict

The placement claim holds. The resolved slowdowns are not explained and were measured with WAKER_RUN = 2 and the predicate the
review replaced, so they decide nothing about the revised head. More boots are needed: an interleaved A/B of the revised head
against its base, 4+4, reading the same rows. Two head-only boots could not resolve the slowdowns, because ab5's base is not the
revised base (#1111 and #1117 changed under it).
