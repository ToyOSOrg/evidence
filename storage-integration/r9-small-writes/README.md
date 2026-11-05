# #1152 round 9: small writes, and r6's refusal

- `osbench-6ff184af8/`: the fs.disk result lines of the coordinator's osbench
  boots at 6ff184af8 on both benches (other log lines left out), and their
  verdicts; `osbench-table-6ff184af8.md` against nightly 2026-10-31-2316
  (main dc1a8642e, Linux ext4), made by `osbench_table2.py`.
- `perf.rs` (scratch harness, not committed): `small_writes_split` and
  `scattered_overwrites` on the host model of the T14's DATA. Before
  49fe47993: 4 KiB calls reserve 8.7 us + write-back 23.6 us a page; 1 MiB
  calls 2.9 + 2.6. After: 0.9 + 3.6-3.9; scattered overwrites 0.8 + 30.6.
  `scatter-sample.txt`: macOS `sample` of the scattered overwrites after the
  change.
- `mutations/`: no-merge (64 extents for 64 blocks), cross-bucket (fsck/read
  red on 2 MiB buckets), no-cut (room not returned), unrefused (a larger
  journal mounted read-write); each applied, run and restored.
- `ci-host-a1f07627e.log`: `cargo run -- --ci host` at a1f07627e, exit 0,
  108 steps.
