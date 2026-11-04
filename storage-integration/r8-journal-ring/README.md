# #1152 round 8: mkfs's journal ring is the replay bound

r5 BLOCKER 1, by the coordinator's ruling: mkfs lays the ring out at a
128th of the device, at least eight buckets and at most `JOURNAL_BYTES`
(32 MiB). The writer's cap is deleted; the scan's floor stays for rings
another writer laid out.

Host model of the T14's DATA, osbench's persist and fs.disk sequence at
full repetitions (`hang.rs`'s `osbench_full`), dropped unclean, then
mounted by the file server, each under `/usr/bin/time -l`:

| engine | log | data-write phase | mount | first mkdir | reader peak |
|---|---|---|---|---|---|
| r7 (32 MiB cap, 1.3 GiB ring), for comparison | r7's `full-*-final.log` | 39.9 s | 1.10 s | 0.018 s | 0.20 GB |
| 32 MiB ring, before the cache fix | `full-*-ring-before-cache-fix.log` | 179.4 s | 0.20 s | 0.023 s | 0.14 GB |
| 32 MiB ring and the cache fix (6ff184af8) | `full-*-final.log` | 34.7 s | 0.20 s | 0.024 s | 0.14 GB |

`ring-sample-before-cache-fix.txt`: macOS `sample` of the 179 s phase, the
time in the file server cache's `Inner::evict` `VecDeque::retain`. A block
cleaned again was queued again while its older entry stayed; with a small
ring the journal's blocks are rewritten over and over, so the queue stayed
past its compaction bound and every eviction compacted it. Fixed in
4410a5664 (each entry carries the version it was cleaned at).

Controls (`mutations/`, applied, run, restored):
- `by-device.*`: mkfs sizing the ring by the device ->
  a_large_volumes_ring_and_its_replay_window_stay_within_journal_bytes red.
- `no-insert-drop.*`: the scan keeping a stale entry read after the floor ->
  a_scan_keeps_no_records_of_entries_behind_a_flush_entrys_last_sequence red
  (the wrapped case).
- `unstamped.*`: a queue entry live by its block's cleanness alone ->
  a_block_cleaned_again_is_evicted_by_its_newest_place red.

`ci-host-6ff184af8.log`: `cargo run -- --ci host` at 6ff184af8, exit 0, 108
steps. The aarch64 rows run on the guest runner (run 41934369401).
