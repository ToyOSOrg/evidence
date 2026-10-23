# Review round 1 evidence for ToyOSOrg/ToyOS#1048 (storage B5)

**Revision:** head `3d743e72df7046b9af42ea223e45f5658380f7e9`, round 1 on top of `c00defdc4`. Its tree, `03d36a8f4`, equals that of WIP `fd899a450`, where the controls and the last image regeneration ran.

**Masked paths:** `$WORKTREE`, `$B5` and `$STORAGE` (agent scratch), `$SCRATCH`, `$HOME`.

## host/

- `bcachefs-tests-r1.log`: `cargo test -p bcachefs` exits 0. 152 lib tests, then 2, 57 and 2.
- `clippy-r1.log`: `clippy.sh` (bcachefs, all targets, `-D warnings` and `build/clippy.rs`'s adopted lints) exits 0.
- `ci-host-r1.log`: `cargo run -- --ci host` exits 0, "Host: 102 step(s), all green". The `test failed` lines inside it are the CI's own mutation controls going red, as they should.
- `build-only-r1.log`: `cargo run -- --build-only` exits 0.
- `qemu-smoke-r1.log`: `cargo test --test toyos-build -- a_spawn_from_an_image_frees_it_when_the_child_ends` exits 0. This is one x86_64 QEMU boot reading ROOT, whose journal is empty again.
- `reserve-sizing.txt`: the dirty-node limit for each mkfs geometry, with reclaim's reserves as sized (the common case) and at their derived worst case. These figures back `issues/bcachefs-reclaim-reserves-are-sized-for-common-rewrites.md`.

## controls/

All 31 controls ran in one pass (`all.sh`, which drives `run.sh`). Each patch is applied, built, run under a watchdog, then reverted with file hashes verified. All are red: test exit 101, or 143 where the watchdog killed a hang.

- **Round 0's 18:** regenerated against the new code where they no longer applied.
- **Round 1's 13:**

| patch | what it undoes | red test |
|---|---|---|
| f-fsck-zero-unexpected | fsck compares a stored zero total | journal::a_stored_zero_accounting_total_is_no_finding_clean_or_unclean |
| f-no-restate | the empty-journal restatement | mount::a_clean_volume_with_an_empty_journal_survives_a_crash_going_read_write |
| f-window-per-sequence | the old per-sequence window walk | journal::a_window_spanning_2_62_sequences_is_checked_entry_by_entry (hang, killed) |
| f-ancestors-unbounded | the visited set | ops::counts_at_their_edges_and_looping_back_references_are_refused (hang, killed) |
| f-nlink-more-unchecked | the link-count bound | ops::counts_at_their_edges… |
| f-nlink-less-wrapping | the checked decrement | ops::counts_at_their_edges… |
| f-depth-unchecked | the depth bound | ops::counts_at_their_edges… |
| f-geometry-unchecked | the 4 KiB block and journal-offset refusals | mount::small_blocks_and_a_journal_position_off_a_block_are_refused |
| f-alloc-trusted | the alloc key's agreement with freespace | interleave::a_reclaim_plan_failing_midway_stops_the_mount |
| f-cache-by-sector-alone | the cached node's match to its pointer | mount::a_pointer_to_a_cached_node_of_another_btree_is_refused |
| f-reclaim-failure-unstopped | stopping the mount on a reclaim failure | interleave::a_reclaim_plan_failing_midway_stops_the_mount |
| f-hold-ignores-read-only | the waiter observing the stop | interleave::a_node_write_failing_past_its_retries_stops_the_mount_and_its_waiters |
| f-rename-grant-short | a rename's grant of 10, as 7 | ops::a_rename_across_many_leaves_dirties_no_more_nodes_than_its_grant |

`all-r1-first.log` is the first pass, at WIP `1d0fd1609`. In it `b-grants-ignored` passed, because reclaim's grown room absorbed the overshoot of 16 writers. `b-grants-ignored.patch.log.first` is that run. The test now runs 32 writers, asserts that their names sit in leaves apart, and is red in `all.log`.

## judge/

The judge is upstream bcachefs-tools v1.39.4 in B2's AArch64 VM, running `fsck -n -K` with stdin closed. A run passes only on exit 0 with no failure marker.

- **`judge2-run.log` (B5b) and `judge2-run-c.log` (B5c):** all 80 verdicts PASS, including the FUSE continuations.
- **`judge2-run-d.log` (round 1): 30 PASS and 10 FAIL.**
  - The zero accounting totals pass on clean, unclean and unmounted volumes, and the last of these also under FUSE.
  - Of the empty-journal crash states, those that tear a superblock copy fail.
  - `judge2-torn-superblock.txt` lists the 10 failures. Each exits 0, and its only error lines are upstream's "superblock unreadable: checksum error … successful read from backup", which the marker rule rejects.
- **`regen-comparison.txt`:** all 114 judged images were regenerated at the head's tree and are byte-identical, and the VM's own sha256sum lists every host hash.
- **Tooling:** `dump_b5.rs`, `dump_b5c.rs` and `dump_b5d.rs` write the images (`dumpers2.sha256`), `guest/` holds the scripts, and `vm/` every guest command with its output and exit status.
