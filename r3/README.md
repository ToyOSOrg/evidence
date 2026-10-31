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

## T14 (X-B2-t14, passed)

`disk-rows-t14.txt` adds `X-C2-t14`, #1118 r1 on #1113 r1 with the same probe, as a second boot of #1113's code.
- `persist.seq_write_fsync` 149 → 193 MB/s. The head's boots read 175–208.
- `persist.write_4k_fsync` and `append_4k_fsync` read 1.1 ms in X-A and 5.8–6.1 ms in every #1113 boot. This is the T14's per-boot durable-write mode (`issues/toyos-durable-writes-on-the-t14s-nvme-run-six-times-slower-in-some-boots.md`). The base f40791833 also read 6.5 ms in round 0 (`metal/W-A-t14`).
- **Unexplained and not attributed:** `fs.disk.seq_write.1048576`, 64 MiB in 1 MiB writes, five rounds. X-B2 reads 258–260 in four rounds and 401 in one. Every other boot of #1113's code reads 435–501: the stale X-B, X-C2, and round 0's `W-B-t14`.
  - The probe's flush lines for that row match the stale boot's: 8,192-block flushes in 257–259 runs, 254–255 of them full.
  - X-B2 differs from the stale X-B only by r2. Its one behavioural change acts only at 32 MiB kept with a caller's flush on the wire, and the cache's flush leaves none on the wire while its runs go.
  - The same boot reads `fs.disk.mkdir_rmdir` 109.5 µs, against 86.6 in both other boots, a path that does not reach the cap.
