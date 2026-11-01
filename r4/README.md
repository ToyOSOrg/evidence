# The straddle join deleted, and X-F on metal (head 1eb1a9f3a)

## Host

- `ci-host-r4.log`: `cargo run -- --ci host` at 09203d2b5 (`ci-host.rev`), 107 steps green. The head 1eb1a9f3a differs from it only by rewrapping one doc comment.
- `r4-bcachefs.log`: 182 unit and 57 integration tests, one fewer unit test than r3's 183 since the straddle test is deleted. `r4-fileserver.log`: 90. Both exit 0.

## Metal: X-F = bea91a3cb + probe2 (e81dae9d1), against #1113's X-E (both benches passed)

The deleted join never ran under `allocate`, so X-F measures the head's behaviour. Per-row tables: `disk-rows-{t14,amd}.txt`.

The rule (`metal2/request-5.txt`), item by item:
- **Both boots pass.** Yes.
- **The 8 MiB `seq` file in at most 16 runs, a round's flush in at most 80 requests.** Yes: 8–9 runs on both benches, and 68–71 requests.
  - Other files the probe prints are not the rule's.
  - `fs.disk.seq_write.4096`'s file, written 4 KiB at a time, has 15–20 runs. A one-page write asks for one block, so the minimum run cannot apply to it.
  - The 64 MiB file of 1 MiB writes has 1–4 runs.
- **`persist.seq_write_fsync` at least X-E's.** Yes: T14 493 against 181, AMD 631 against 588. The T14 boot ran in its fast durable-write mode (`write_4k_fsync` 0.96 ms, against about 6 ms in every boot of #1113).
- **No `persist.*` row past #1113's boot spread by more than 5%.** Strictly, two rows are:
  - T14 `persist.fsync_clean` 15.84 µs, against #1113's 13.78–14.38. Those boots were all in the T14's slow durable-write mode; the only other fast-mode boot, X-A, read 16.07. The row follows the mode.
  - AMD `persist.seq_read_cached` 2,713 MB/s, against #1113's 2,888–3,315. It reads from the cache and does not allocate. `amd-seq-read-cached.txt` lists every AMD boot of 2026-10-30 and 31 that carries the row: unrelated trees range 2,217–3,290, and X-F sits inside.
