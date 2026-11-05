# #1152 round 10: osbench at a1f07627e, and the two gaps it lands with

- `osbench-a1f07627e/`: the fs.disk result lines and verdicts of the
  coordinator's osbench boots at a1f07627e on both benches;
  `osbench-table-a1f07627e.md` against nightly 2026-10-31-2316 (main
  dc1a8642e, Linux ext4), by `osbench_table3.py`.
- `perf.rs` (scratch harness): `listing_a_thousand` on the host model of the
  T14's DATA lists a directory of 1 000 files whole in 534 us, of which the
  dirents take 39 us and the 1 000 inode lookups 416 us (timed inside
  `DataVolume::list` in a scratch copy). `scattered_overwrites` and its
  sample are round 9's (`../r9-small-writes`).
