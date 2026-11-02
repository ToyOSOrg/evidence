# PR #1141 r3: round 2's metal A/B, judged by its pre-set rules

Images: base a4b6a1ee7 (main 058bea2d3 + the osbench row), head 029ca221c, both as staged in r2. Per bench: base, head ×3 interleaved, then one head testcases boot; every boot passed (`runs/*/*/verdict.txt`). `runs/` keeps each boot's `fs.*` and `persist.*` osbench rows, and the testcases boot's member lines. `judge.txt` is `judge2.py runs` against `rules.md` (r2's, set before any boot).

## Rule 1, the claim: met on both benches
d = beside_1m − write_4k_fsync, per boot:
- AMD: base 2.324, 2.107, 1.380 ms; head 0.441, 0.754, 0.520 ms. Every head is below every base; the mean ratio is 0.30 (bound 0.5).
- T14: base 4.762, 4.734, 4.661 ms; head 0.232, 0.694, 0.955 ms; ratio 0.13.

## Rule 3, atomicity on hardware: met
All five members exit 0 on both benches.

## Rule 2: one REGRESSION flag, AMD fs.disk.rename
Base 59451, 62607, 65834 ns; head 95128, 74981, 69239 ns; +19.8% at the median. Rows that moved worse by 10% or less: AMD seq_read.4096 −1.9%; T14 direct.fstat, direct.read_4k_at, direct.seek (each one head boot high), seq_write.4096, fs.mem.read_4k and fs.mem.seq_read.4096 (tmpfs, no #1141 code).

What is known about the flag (`rename/`):
- **No code path.** The DATA rename (`DataVolume::rename`) and the server's RENAME arm are unchanged by #1141. The rename row's files are never open, and it uses no paged object.
- **No volume-state path, on the host.** `rename/exp-rename.patch` (a temporary test, not committed) runs the persist rows' pattern first: 105 rounds of 1 MiB over one file and 4 KiB over another, then an fsync of the second. It runs that either with every fsync a whole sync (main's FSYNC) or per-file (#1141), then times 2000 renames on the same `DataVolume`. In `exp-rename-10.log` the 10 pairs are 13.2–13.6 ms against 13.2–14.1 ms. The volume the per-file fsync leaves renames no slower.
- **The row is bimodal per boot on AMD.** In round 1 (`rename/round1-rename.txt`): main 64.0 and 62.6 us. #1141's head 81.7 and 62.9 us, and again 83.0 and 60.9 us in #1144's A/B. #1144's head 84.1 and 60.6 us. mkdir_rmdir and create_write_unlink, beside it in the same boots, swing the same way in round 2 whatever the image. Boot 2-head is slow in all three, with open_close at 17.3 against 14.1 us.
- **But the split is lopsided.** Of main's five AMD boots in rounds 1 and 2, all five measured about 60–66 us. Of the nine boots of #1141-family images (round 1's #1141 and #1144 images, round 2's head), three did. If a boot's mode did not depend on the image, all five fast boots falling to main would happen about 3% of the time. Round 2's heads (69.2, 75.0, 95.1) are also not clean modes.

Unexplained: there is no mechanism, and the evidence does not rule a real effect out. Rule 2 asks for a mechanism or a fix before landing. Resolving it would take more AMD boots of this row, base against head, or a trace of a slow-mode rename.
