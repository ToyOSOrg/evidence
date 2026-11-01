# ab7: #1129 at `9dcc24ee8` (the move off the waker's core) on the AMD bench, judged

Base `7786be870` (#1117 `e48eee9d1` + diagnostic) against head `4daae23e4` (#1129 `9dcc24ee8` + the same diagnostic), both on main
`8520204a0`. 8 benchcase boots in balanced order (base, head, head, base, base, head, head, base), every boot EXIT=0, runner verdict
`passed`. Judged in pinned check trees at each arm's revision (`judge/`): osbench and `clock_holds_over_minutes` PASS in all 8; the
two I219 rows are T14-only and red on the AMD. A row resolves only when all 4 of one side beat all 4 of the other; 23 of 146 resolve,
about 4 expected by chance.

## The one-core fix: holds for request/reply

- `ipc.reqrep.8`: head pairs in one LLC on two cores in 4 of 4 (cpu8+10, 12+10, 10+8, 12+14), 6562-6632 ns; base split in 4 of 4,
  7834-7995 ns. Resolved, -16%. `reqrep_handle.8` -18%, `reqrep.4096` -24%, `reqrep.65536` -42% (30.2-31.1 against 51.7-52.8 us).
- No head pair shares a core.
- `fs.disk.read_4k_at` now reads 1.7 us on both sides (main's paged reads, #1123, serve it without the file server), so it no longer
  tests the pair.

## pipe.throughput.16384: still 0.43x, and not from a shared core

Head 3438-3725 MB/s against base 8134-8384, resolved. `one_core` is 0/7 in every boot of both arms. Head-4's per-round CPUs
(reader 12, writers 14, 14, 15, 0, 1, 2, 3) match the base's pattern and still read 3.6 GB/s. The base reads 8.3 GB/s with writer
and reader split across LLCs in some rounds, so a split costs this row nothing. The mechanism is unknown; the mode CPU per side
cannot show a thread moving back and forth. ab5 at a run of 2 read this row at base speed; ab6 and ab7, at 8, both read 0.43x.
`pipe.throughput.4096` reads 5.0-5.1 GB/s on head in 4 of 4 against base's bimodal 1.8-5.2 (unresolved).

## pingpong.futex.cross_core: the row has two regimes; both arms now sit in one

Base 4488-4538 ns, head 4568-4599 (+1.6%, the size of the bias below). In ab6 the base read 160-171 ns and two head boots 491 and
4469. On ToyOS `wait_for` calls `futex_wait` with no spin, so about 170 ns is only possible while neither side parks: each wait finds
the word already changed. About 4.5 us is a park and a wake each way. On main `8520204a0` every boot of both arms is in the parking
regime, so ab6's 28x was the row tipping into it, not a cost #1129 adds.
`ran=` shows no process but osbench_sched on cpu0-cpu3 in any head boot; base-3 and base-4 had nvme and fileserver on cpu3 (cpu2's
sibling) with no change in p50. So interference from moved work is ruled out. What tips the row from one regime to the other is not
established; the row should report which regime it measured.

## The tail.* bias survives balanced order

`tail.diag.periodic.30s` +1.4% and `tail.wake.periodic.60s` +1.5% resolve on head again, with head booting first as often as base.
So the bias is not boot order. Image layout (each side is its own image) or a real cost both remain; these timer wakes name no waker
and return at the rule's first line.

## Other resolved rows

Better on head: `proc.spawn_wait_loop.100` -16%, `mem.malloc_churn.4096.t1` +5.6% kops/s, `mem.anon.map` -4%. Worse:
`work.build_shaped.j16` +4.2%, `fs.disk.seq_read.1048576` -4.9% and `.4096` -1.6% MB/s, `fs.mem.seq_read.4096` -5.6% MB/s,
`fs.disk.seek` +4.7%, `fs.disk.pread_8` +3.2%, `mem.anon.unmap` +2.3%, `mem.bw` -1%. `wake.storm.call.w64` +4.9% and
`mem.munmap_touched_remote.4k` +5.1% no longer resolve.

## Verdict

#1129 cannot land. The request/reply gain is large and real, but `pipe.throughput.16384` halves for an unknown reason, and
`work.build_shaped.j16` and the sequential-read rows also read worse. ab8 (staged) counts the pipe row's migrations per round and
bisects review r1 with a run of 2.
