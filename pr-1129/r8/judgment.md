# ab9 judged against decision-rule.md (fixed before staging)

Six AMD benchcase boots: base, head, head, base, base, head. Every runner verdict reads `passed`, and the orchestrator
reports EXIT=0 for all six. base `f06df08b7` = #1117 `c9f88d36e` + diagnostic; head `33df293ad` = #1129 `cebbdedd5` + the
same diagnostic + the waker hunk. Judge output: `judge-ab9.txt` (`tools/ab9.py`, rc=0). LLCs are CPUs 0-7 and 8-15.

## D0, the pipe slow mode's mechanism: NOT CONFIRMED by the rule's letter; its split half holds without exception
- **16384**: 41 of the 42 timed rounds follow the split/same rule. Split rounds read 3372-3618 MB/s, same-LLC rounds 8294-8620.
  - One exception, in `5-base`, round 1: same LLC (reader cpu13, writer cpu15) and 5621 MB/s, as was its warmup at 13+14
    (5580). Its record shows no move, no other process on those cores and nothing lost. **Not explained by its record.** The
    rule required that, so D0 is NOT CONFIRMED as written.
- **Every split round is slow in both arms, at every size** (4096 ~2000, 16384 ~3500, 65536 ~4800 MB/s), with no exception.
  - 4096 has one same-LLC round at 3721 (`6-head` round 3). The reader moved in that round (m1) and took 4 far wakes, so its
    record explains it.
- **The writer's CPU follows spawn placement's rotation, whatever LLC the reader is in.** At 16384 it went 14, 15, 0, 1, 2,
  3, 4, 5 in every boot of both arms. So where the reader happens to sit decides how many rounds run split (base 1/4: 2 of
  8; base 5: 6 of 8; head: 5-6 of 8).
- **The rule behaves as designed on this row.** A split round gives the reader only 1-2 far wakes, so a run of 8 never forms
  inside a round. In `2-head` the run carried across rounds 2-6 (1+1+2+2+1 = 7), and round 7's eighth far wake moved the
  reader to cpu6, beside its writer on cpu5: 8443 MB/s.

## D1 work.build_shaped.j16: PASS
- head/base = 0.976. base 274.2-274.4 ms, head 267.4-268.2. ab8's +4% is gone and the row reads 2.4% faster.
- **The mechanism check worded in the rule does not hold:**
  - The parent's wakes on head are mostly *named*: none / same-LLC / other-LLC = 299/3641/202, 282/3325/321, 283/3331/230.
    Only about 290 are unnamed, the leaving posts. Something that is not leaving wakes the build parent about 3500 times
    per row, and its source is not identified.
  - Cross-LLC moves of the parent: head 107/151/119, base 101/98/99. Base moves too (balancing and forwards), so the rule
    adds about 10-50 per row.
  - So the time recovery is measured, but how much of it the leaving rule earns is not isolated.

## D2 pipe per class: PASS (where at least 4 rounds per arm)
| size | class | base median (n) | head median (n) | |
|---|---|---|---|---|
| 4096 | same | 4979 (6) | 5124.5 (18) | PASS |
| 16384 | split | 3514.5 (8) | 3524 (17) | PASS |
| 16384 | same | 8415 (13) | 8515.5 (4) | PASS |
| 65536 | split | 4779 (15) | 4825 (18) | PASS |
| 4096 split and 65536 same | | | | too few rounds on one arm |

## D3 ipc.reqrep.8: PASS
- head/base = 0.856. head 6653-6672 ns; base 8305, 8456, and 6603 in boot 4, where the pair happened to share an LLC.

## D4 thread.spawn_join: BLOCKS
- head/base = 1.112. base 26880, 26440, 20218; head 27171-27371. The ranges do not overlap.
- Without base boot 5 (20.2 us, joiner on cpu10/8) the ratio is still +2.2%, and the ranges still do not overlap.
- **The rule does not act on this row.** In every head boot the joiner's 1050 wakes are all unnamed (the leaving rule
  works) and it never moves (m0-0). The cost is therefore not the rule's placement. Its cause is not established.

## D5 health: passed verdicts; slowdowns over 3% that block
- **Not explained:**
  - `fs.disk.seek` +4.9%
  - `mem.anon.map` +6.2%
  - `mem.munmap_touched_remote.4k` +4.9% (+8-10% in ab5-ab7 as well)
  - `wake.storm.call.w64` +3.8%
  - `wake.storm.drain.w4` +8.6% (+3-4% against base boots 1 and 5 alone)
- Also non-overlapping, 1-3%: `fs.mem.reopen_read_4k` +1.9%, `fs.disk.seq_read.4096` -2.2%, `wake.storm.drain.w1` +1.4%,
  and the pingpong rows ±1%. Faster: `pipe.throughput.4096` 1.7x, `fs.mem.seq_write` +2-3%.

## Verdict: #1129 does not land on ab9
The gain holds (D3) and the build cost is gone (D1). But D4 and five D5 rows block, on rows the rule demonstrably does not
reach (spawn_join), and D0 is not confirmed by its letter. k is not changed.
