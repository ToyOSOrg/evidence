# #1111 alone on the T14, judged

Base `24a538c88` (main under the stack) against head `042b2b299` (#1111 after review r1). 8 benchcase boots, interleaved
base/head, one image per side, every boot EXIT=0 with runner verdict `passed`. Judge logs: `judge/`.

Rule fixed before the run: the twelve disk and memfs rows the first A/B read 1-3% slower, and the ipc rows; 4 beat 4 resolves.

- ipc.reqrep.*: unchanged (ratios 1.002-1.007, none resolved).
- Disk rows resolve slower by 1.2-2.3%: fs.disk.fstat 1.021, pread_4k 1.016, read_4k_at 1.023, write_4k_at 1.022,
  direct.pread_4k 1.018, direct.read_4k_at 1.015, direct.seek 1.012; seq_read.4096 0.975 (MB/s). fs.disk.seek and stat, tree.100 do not.
- memfs: fstat +1.1% resolves; read_4k -5.4% resolves faster; the rest do not resolve.
- Rows the hold cannot reach move by the same size: wake.periodic.idle +2.8% and tail.* +1.6-1.7% (timer wakes on idle CPUs, where
  nothing runs to hold behind), wake.onto_busy +2.4%. 19 rows resolve against about 4 by chance.

Verdict: the disk slowdown reproduces with #1111 alone, but its size equals the head bias that unreachable rows show in this and
the other two A/Bs (ab6 `judgment.md`), so it is not attributed to the hold. It stays open in
`issues/a-wake-held-for-its-posters-park-is-unpriced-on-metal.md`; an order-balanced A/B would decide it.
