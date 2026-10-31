# Round 3 metal: #1113's head under the kept limit (AMD so far)

Each `.txt` holds a boot's `osbench v=2` and `disk-path-probe2:` lines only. Every verdict is `passed` (`verdicts.txt`).

| boot | tree |
|---|---|
| X-A | #1099 fe6d7d2a8, the base |
| X-B (stale) | #1113 at 558ab7707 (r1) + probe2 |
| X-B2 | #1113 at 20bdd1401 (r2, the head) + probe2 |

- `disk-rows.txt`, p50s, X-A → X-B2:
  - `persist.seq_write_fsync` 286 → 527 MB/s;
  - `fs.disk.seq_write.1048576` 332 → 737 MB/s;
  - `fs.disk.seq_write.4096` 201 → 269 MB/s.
  - Every `persist.*` latency row is level or better.
- Rows over 10% worse than X-A:
  - `fs.disk.rename` 62.1 → 72.5 µs. The stale X-B reads 61.8, and it differs from X-B2 only in r2's wait beside a caller's flush and a compile-time assert.
  - `persist.seq_read_cached` 3,983 → 3,132 MB/s. Earlier AMD boots read 2,911–2,936 (`pr-1113` `metal/`), and the stale X-B 3,315.
  - Both are inside boot-to-boot spread, not attributable.
- Probe lines: the 8 MiB file in 103–106 runs, about 100 of them single blocks, and 163–169 flush requests, unchanged from round 0's placement.
