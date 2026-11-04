# fs.disk on the benches: #1152 at 94fdd7faa against main and Linux

- #1152: one `osbench` benchcase boot per bench at `94fdd7faa` (2026-11-04), DATA freshly formatted
  by this branch's `bench_data_formatted` boot; its fs.disk lines are `toyos-94fdd7faa-<bench>.txt`
  (from the readback's kernel log).
- main and Linux: the nightly of 2026-10-31-2316, ToyOS at main `dc1a8642e` (the private DATA format)
  and Ubuntu's ext4 as installed, two Linux runs a bench (their p50 median). The newest main osbench
  on these benches; its compare tables are the nightly's evidence.
- Every figure is a p50 (MB/s rows: p50 of five rounds). One #1152 run a bench, so no row resolves
  statistically; ratios are a trend. `osbench_table.py` makes `table.md` from these sources.

See `table.md` for the rows and the PR for the reading.

## Host microbenchmark of the same rows (DataVolume over the T14 model, no device latency)

`harness/micro.rs` (with `common.rs` and a setup file), us/op unless stated; main 7835695 vs 94fdd7faa:

| row | main | native |
|---|---|---|
| open_close | 4.35 | 2.02 |
| stat | 0.10 | 1.73 |
| create_write_unlink | 32.1 | 78.8 |
| write_4k_at | 0.71 | 29.6 |
| readdir.1000 | 141 | 382 |
| rename | 31.7 | 12.1 |
| mkdir_rmdir | 33.6 | 23.5 |
| seq write, 4 KiB calls, per MiB | 328 | 7071 |
| seq write, 1 MiB calls, per MiB | 167 | 6758 |

The data-write rows are engine CPU: the file server writes back page by page, each page its own
single-block reservation, so every 4 KiB is one transaction and one extent (and truncating it later
one more). stat and open_close are not: the engine accounts for ~2 us of their ~50-68 us on the T14.
