# Evidence for ToyOSOrg/ToyOS#1059 (storage B6)

Measured at `ef28b4e80fb94fa580fc633d5815bffc7d9f0e13`. The branch head `cc174dd13` above it changes only an issue record. Paths masked: `$WORKTREE`, `$B6` (agent scratch), `$SCRATCH`, `$HOME`, `$TMP`.

The host disk was full for part of this session. Every result here was rerun from a cleaned `target/` after the disk was freed. Earlier runs are not used as evidence, except round 0 of the judge, which is kept as the diagnosis of a harness defect (below).

## host/
- `bcachefs-tests-final.log`: `cargo test -p bcachefs`, exit 0. 166 lib tests, then 2, 57 and 2.
- `clippy-final.log`: clippy on bcachefs, all targets, `-D warnings` plus `build/clippy.rs`'s adopted lints, exit 0. The exits are in `test-final.exit`.
- `ci-host-final.log`: `cargo run -- --ci host`, exit 0, "Host: 103 step(s), all green". The `test failed` lines inside are the CI's own controls going red. A temporary ignored test file (a journal scan, not run) existed in the tree for about a minute during this run.
- `build-only-final.log`: `cargo run -- --build-only`, exit 0. The exits are in `ci-build.exit`. mkfs and the read path are unchanged, so ROOT's bytes are too, and no QEMU boot was run.
- `exp-full.rs`, `exp-full.log`: the metadata-full experiment behind `issues/a-bcachefs-mount-of-16-kib-nodes-can-stop-under-churn.md`, an uncommitted ignored test.
  - 32 MiB: 48 028 creates, then `NoSpace`; the unmount returns `ReadOnly("journal reclaim's share exhausted")`.
  - 64 MiB: 134 943 creates; the unmount succeeds clean, at sequence 6 347.

## controls/
Each mutation is a checked patch: applied, built, run under a watchdog, and reverted with the file hashes verified (`run.sh`, driven by `all.sh`, made by `mk.py`). `all.log` is the whole run at `ef28b4e80`, with the tree clean.
- Every one of the 9 patches is red in its named test (10 runs), and every revert reports "restored: hashes equal".
- `m-reuse-before-durable.patch.log` is overwritten by the second run of that patch. Its two runs are kept as `.constructed.log` and `.crash.log`.

| patch | red test, and why |
|---|---|
| m-reuse-before-durable | `buckets::a_bucket_emptied_by_an_entry_not_yet_durable_is_not_written_again`: `Corrupt("btree node of another sequence than its pointer's")`. `crash::renames_reusing_buckets_on_a_nearly_full_volume…`: `mount: Checksum("btree node")` |
| m-reuse-while-read | `buckets::a_bucket_a_traversal…`: a node written into the bucket the listing leads into |
| m-stale-kept | `buckets::a_bucket_a_traversal…`: `two cached nodes at sector 6720` |
| m-never-reuse | `buckets::renames_past…`: `NoSpace("no free bucket for a btree node")` |
| m-durable-never | `buckets::renames_past…`: `NoSpace("no room left for the btree nodes a change may write")` |
| m-admission-ignores-room | `buckets::a_full_volume…`: reclaim finds no bucket |
| m-removal-no-reserve | `buckets::a_full_volume…`: the unlink answers `NoSpace("…a removal may write")` |
| m-backpointers-unchecked | `buckets::an_empty_bucket_a_backpointer_leads_into_is_refused` |
| m-fsck-emptied-unchecked | `buckets::a_bucket_emptied_past_the_journal_is_found` |

## judge/
The upstream judge: bcachefs-tools v1.39.4 in B2's AArch64 VM, `bcachefs fsck -n -K` with stdin closed and each run bounded at 900 s. Any non-zero status fails. Raw crash states use `judge_torn` (§3.4 as amended, sidecar `.torn`).
- **Images.** `dump_b6.rs` (sha256 in `dump_b6.rs.sha256`) wrote all 92 files at `ef28b4e80` (`judge-gen.log`). `SHA256SUMS` lists them, and the guest checked them (`sha256sum -c`) before judging.
- **Verdicts** (`judge-run.log`; each command, output and exit in `vm/judge/`): 63 PASS of 65.
  - Pass: 31 of the 32 unencrypted pressure states, raw and replayed; all 24 encrypted ones; renames past the volume's buckets; the full volume, unclean and unmounted; the 4 GiB volume of eight-node buckets; the unwritten emptying, raw and replayed.
  - Pass after upstream FUSE's read-write mount: the full volume and the renames volume, with upstream's own discard of need_discard buckets.
  - Fail, as required: `ctl-reused-before-durable.img`, the negative control, exit 9 with "btree node read error". It is the unwritten-emptying medium with the emptied bucket's old node written over by a node of this mount, as an early reuse leaves it.
  - Fail, an open question: `pressure-05.img`. Its newest journal entry, 9, is torn (`pressure-05-r1-scan.txt`, ToyOS's scan). Upstream prints "journal read done, but no entries found after dropping non-flushes" and spins until the bound (exit 124). This is B5's journal shape, not the allocator's. It is routed to the analyst (`analyst-question.md`).
- `held/`: that state from both rounds (`r0-…`, `r1-…`, gzip), with the round-0 sidecar. The last command of `judge-run.log` reproduces the round-0 one: the same message, then exit 124.
- `round0/` is the judge run before the harness fix, generated inside the disk-full window. It is kept only for the diagnosis.
  - 5 of 12 encrypted volumes that ToyOS replayed and unmounted failed upstream: an abort in `__bch2_btree_root_read`, and in one an `alloc_v4` key read inside logged_ops.
  - The cause: the test harness seeded every mount's random source identically. A mount after a crash therefore drew the crashed mount's node sequences again, and with reuse it could write a node over one of its own with the same sequence.
  - The harness now gives each mount its own stream (`engine/tests/mount.rs`, `random`). Round 1 passes all 24 encrypted states.
