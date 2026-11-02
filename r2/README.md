# PR #1141 r2: round 1's regressions investigated, the write-back fix, round 2 staged

Head 029ca221c (fs-7b rebased onto main 058bea2d3, plus `fileserver: an fsync that leaves nothing owed answers the write-back`). Base a4b6a1ee7 (main 058bea2d3 + the osbench row alone).

## Round 1's flagged rows, against boots of the same image (`round1/`)

`same-image.txt` (made by `same-image.py` from round 1's readbacks, r1 on this branch and pr-1144's r1) puts each flagged row's p50s side by side for four sets of boots. fs-7b/ab's head image (b4edede36) also served as fs-7b/ab3a's base, so the same image was booted twice per bench in separate sessions:

| row | bench | main | 7b, ab | 7b, ab3a | 3a |
|---|---|---|---|---|---|
| fs.disk.reopen_read_4k | T14 | 16660 16747 | 19838 20044 | 16901 16709 | 16758 16617 |
| fs.disk.pread_8 | AMD | 772 781 | 912 912 | 811 922 | 821 801 |
| persist.fsync_clean | AMD | 29986 29835 | 35256 35877 | 32521 30036 | 28233 29886 |
| persist.write_4k_fsync | AMD | 2480462 2471394 | 2961534 2639289 | 2414327 2482355 | 2667051 2638057 |

In ab3a, the same image that "regressed" in ab measured as main did. AMD's round-trip rows take one of two values per boot (open_close about 14.0 or about 17.2 us, whatever the image), and both of ab's AMD head boots were in the slow mode. The T14's durable writes take one of two values per boot (write_4k_fsync about 1.1 or about 5.9 ms), and at times switch partway through a boot (ab t14/3-base: write_4k_fsync 1.07 ms, append_4k_fsync 6.37 ms).

The code paths, read:
- **Holder read (pread_8, reopen_read_4k).** The same lock holds per chunk as main, plus two compares of a version under a lock it already holds. No fallback is taken without a write under way.
- **Per-file fsync against the old sync (fsync_clean).** For a clean file it does the same work: one scan of the cached files, one of the volume's open files, and `fs.sync()`, which asks the disk nothing when nothing was written. One real difference: the old `FSYNC` reset the server's write-back deadline (`writeback.synced`) and the new one never did. After a write and fsync the server therefore kept a 2 s deadline on every wait, which every park and idle entry programs into the CPU's timer, and ran a redundant sync 2 s later. Fixed in 029ca221c: an fsync that leaves nothing owed answers the write-back. Whether the timer was a measurable part of AMD's +5 us is what round 2 shows; the same-image boots say most of round 1's +18.9% was boot mode.
- **Write path (write_4k_at, write_4k_fsync).** Two more uncontended pager-lock holds per write call, `write_begin` and `write_end`: tens of ns on a 10 us call (estimated, not measured), below any boot-level A/B. Kept as is.

## Checks at 029ca221c (tree bfae305ac)
- `host.log`: `cargo run -- --ci host`, rc=0, "109 step(s), all green". It ran from 5c30ef12b, which has the same tree; only the commit message was reworded (`host.rev`, `host.rev.note`).
- `host.log` includes the fileserver suite with the three new tests, all ok. `fileserver-test.log` is an earlier `cargo test -p fileserver` run (rc=0, 112 passed) from before the refused-write-back test was added.
- `qemu/`: `qemu-members.sh` (the testcases boot under `--debug`, x86_64 QEMU, macOS host) at 029ca221c, clean tree (`q1.rev`), rc=0. All five members exit 0. The tear member made 1105 reads and met 244 generations, none torn. r0's G1 control still stands: the member and the kernel's read validation are unchanged since b4edede36.
- `controls/`: `controls.py` applies each mutation, runs `cargo test -p fileserver <filter>`, then restores the file (the tree was clean afterwards). Every mutation built.

| control | mutation | result |
|---|---|---|
| M1 | `DataVolume::owes` is always false | red: `a_commit_owes_the_entry_of_a_file_it_did_not_carry` |
| M2 | `FatVolume::owes` is always false | red: `a_commit_of_one_file_leaves_no_other_s_write_owed` |
| M3 | `Files::owes` asks only the volume | red: `a_file_a_sync_could_not_write_back_stays_owed_past_another_s_fsync` |
| M4 | `Files::owes` is always true | red: `an_fsync_writes_first_the_pages_of_every_file_its_commit_carries` |

The server's three-line use of `Files::owes` in `FSYNC` has no host test (`Server` has none). The metal rows in round 2 are its behavioural evidence.

## metal-staged/: round 2, staged, not run
`rules.md` was set before any boot: 3 base and 3 head benchcase boots, interleaved, per bench, then one head testcases boot. The claim is per boot: beside_1m minus write_4k_fsync. A regression is all three heads beyond all three bases, and worse by more than 10% at the median. `judge2.py` applies the rules; `request.txt` and `image-sha256.txt` name the images.
