# #1141 metal A/B, round 2 (ab2): the rules, set before any boot (2026-11-02)

Images: base = a4b6a1ee7 (main 058bea2d3 + the persist.write_4k_fsync_beside_1m row
alone); head = 029ca221c (#1141 rebased onto that main, plus the write-back fix).
Benches: T14 and AMD. Order per bench: base, head, base, head, base, head (six
benchcase boots, interleaved), then one head testcases boot. Each value is a row's
p50 from its boot's osbench output.

Why three boots a side: in round 1 (fs-7b/ab, fs-7b/ab3a) one image's boots differed by
more than the effects judged. AMD's server round trips sit in one of two modes per
boot (fs.disk.open_close about 14.0 or about 17.2 us), and the T14's durable writes in
one of two (persist.write_4k_fsync about 1.1 or about 5.9 ms), at times switching
within a boot. With 3 against 3, all three of one side beyond all three of the other
happens by chance in 1 of 20 rows.

1. **The claim (per-file fsync).** Per boot, d = p50(persist.write_4k_fsync_beside_1m)
   − p50(persist.write_4k_fsync): what another file's unsynced 1 MiB write adds to
   a 4 KiB write and fsync. Both rows write the same file, with only persist.fsync_clean between them. Met on a bench
   when every head d is below every base d, and the mean head d is at most 0.5x the
   mean base d. The difference was chosen from round 1's data (there d was 0.23x on
   both benches); ab2 is its first test. The raw beside_1m row is reported, not judged.
2. **No regression** on every `fs.disk.*`, `fs.mem.*` and `persist.*` row but the
   claim's. A row MOVED worse when all three head p50s are worse than all three base
   p50s. It is a REGRESSION when it moved worse and the head median is worse than the
   base median by more than 10%, the boot-to-boot spread of rows outside fs. A
   regression is explained by a mechanism, or fixed, before landing. A row that moved
   worse by 10% or less is reported, not blocking.
3. **Atomicity on hardware.** In the head testcases boot,
   `a_served_files_read_never_tears_against_its_write`,
   `a_served_file_reads_through_its_paged_object`, `served_file_offset`,
   `a_pager_s_end_answers_its_waiting_holders_gone` and `std_fs` exit 0 on both benches.
4. A boot that is invalid (marked INVL, or whose image hash differs from request.txt)
   is no value. It is rerun once, and the rerun is recorded.
