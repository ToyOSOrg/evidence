# Evidence for ToyOSOrg/ToyOS#1048 (storage B5)

Branch head measured: `c00defdc4275b4bf37a439379fbec7c0b6e0a96a` (B5a `62fbcdceb` below it). Paths masked: `$WORKTREE`, `$B5` (agent scratch), `$SCRATCH`, `$HOME`.

## host/
- `bcachefs-tests-final.log` — `cargo test -p bcachefs`, exit 0: 143 lib tests + 2 + 57 + 2.
- `clippy-final.log` — `clippy.sh` (bcachefs, all targets, `-D warnings` plus the adopted lints of `build/clippy.rs`), exit 0.
- `ci-host-final.log` — `cargo run -- --ci host`, exit 0, "Host: 102 step(s), all green". The `test failed` lines inside are the CI's own mutation controls going red as designed.
- `build-only-final.log` — `cargo run -- --build-only`, exit 0 (ROOT now carries mkfs's journal entry 1).
- `qemu-smoke.log` — `cargo test --test toyos-build -- a_spawn_from_an_image_frees_it_when_the_child_ends`, exit 0: one x86_64 QEMU boot reading the new ROOT through the loader and kernel.

## controls/
Every red case of the B5 row, each a checked patch applied, built, run under a watchdog and reverted with file hashes verified (`run.sh`, driven by `all.sh`, made by `mk.py`). `all.log` is the whole run at `c00defdc4` content (committed as WIP `5c0e578a6`, identical tree for `lib/`); per-patch logs beside each patch. All 18: test exit 101 in the named test, "restored: hashes equal".

| patch | red test |
|---|---|
| a-accounting-every-delta | journal::the_unclean_fixture_is_read_through_its_journal |
| a-journal-checksum-skip | journal::a_torn_entry_is_refused_by_its_checksum_and_replay_ends_before_it |
| a-journal-mac-skip | journal::a_torn_encrypted_entry_is_refused_by_its_mac_and_replay_ends_before_it |
| b-journal-after-slot | admission:: (all three stall) |
| b-cache-after-slot | admission:: (all three stall) |
| b-grants-ignored | admission::concurrent_writers_keep_the_dirty_node_limit |
| b-reclaim-on-ordinary | admission:: (all three stall) |
| c-early-pin-release | interleave::a_commit_between_a_node_write_and_its_pointer_update_keeps_every_acknowledged_key |
| c-journal-reissue-other-bytes | interleave::a_failed_journal_write_is_reissued_byte_for_byte (nonce oracle) |
| c-no-fresh-node | interleave::the_first_write_to_a_node_after_a_crash_goes_to_a_fresh_node_and_repeats_no_nonce |
| c-node-checksum-skip | interleave::a_torn_bset_is_refused_by_its_checksum |
| c-node-mac-skip | interleave::a_torn_encrypted_bset_is_refused_by_its_mac |
| c-node-reissue-other-bytes | interleave::a_failed_node_write_is_reissued_byte_for_byte (nonce oracle) |
| c-skip-0 | interleave::a_bset_naming_an_unflushed_sequence_never_reappears_unblacklisted |
| d-unmount-skips-orphans | ops::a_clean_unmount_releases_every_orphan_first |
| d-fsck-clean-keys | journal::a_clean_volume_holding_an_orphan_key_or_a_logged_op_is_found |
| e-evict-after-insert | cache::tests::a_node_just_inserted_outlives_its_own_insert_when_only_it_is_clean |
| e-values-unchecked | node::tests::a_key_whose_value_the_mount_would_decode_is_checked_at_its_boundary |

## judge/
Upstream judge: bcachefs-tools v1.39.4 in an AArch64 Linux VM (B2's), `bcachefs fsck -n -K` with stdin closed; any non-zero status fails.
- `dump_b5.rs`, `dump_b5c.rs` — uncommitted test files that write the images (copied into `engine/tests/` for one run).
- `judge-run.log` (B5b: 48 images, plus FUSE listings and four FUSE read-write continuations re-judged), `judge-run-c.log` (B5c: 21 images, root-fit listing, orphans-released continuation): every verdict PASS, exit 0.
- `judge-controls.log` — the judge's negative control: seven damaged images (kill_btree_node keys/csum/zero, zeroed nodes), every one FAIL exit 9.
- `vm/` — each guest command, its output and exit; `guest/` the guest scripts.
- `SHA256SUMS*`, `vm-sha*.txt` — image hashes host-side and in the VM.
- `regen-comparison.txt` — the images regenerated at the final head are byte-identical to all 69 judged images, so the judge's verdicts apply to the final code.
