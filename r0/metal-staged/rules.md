# fs-7b metal A/B: the rules, set before any boot (2026-11-01)

Images: base = 06238ef4d (main 190f3b164 + the persist.write_4k_fsync_beside_1m row
alone); head = the PR head named in request.txt. Benches: T14 and AMD. Order per
bench: base, head, base, head (four benchcase boots), plus one head testcases boot.
Each value is the row's p50 from its boot's osbench output.

1. Per-file fsync (the claim): `persist.write_4k_fsync_beside_1m`. On each bench both
   head p50s lie below both base p50s, and the head mean is at most 0.7x the base
   mean. Otherwise the claim is not shown on that bench.
2. No regression on the rows these changes touch: every `fs.disk.*`, `fs.mem.*` and
   `persist.*` row. A row has MOVED when both head values lie outside the range of
   both base values on the same side. A moved row that is worse by more than 5% of the
   base mean is a REGRESSION and is investigated before landing. A row that did not
   move is unchanged, whatever its means say.
3. Atomicity on hardware: in the head testcases boot, `a_served_files_read_never_tears_against_its_write`,
   `a_served_file_reads_through_its_paged_object`, `served_file_offset`,
   `a_pager_s_end_answers_its_waiting_holders_gone` and `std_fs` exit 0 on both benches.
4. A boot that is invalid (marked INVL, or whose image hash differs from request.txt)
   is not a value. It is rerun once, and the rerun is recorded.
