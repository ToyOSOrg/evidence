#!/bin/bash
# Every B5 mutation control, one after another; summary in all.log.
C=$B5/controls
cd $C
run() { echo "=== $1 [$2]"; bash $C/run.sh $C/$1.patch "$2" ${3:-300}; }
{
echo "revision: $(git -C $WORKTREE rev-parse HEAD) dirty: $(git -C $WORKTREE status --porcelain | wc -l)"
run a-accounting-every-delta unclean_fixture
run a-journal-checksum-skip a_torn_entry_is_refused_by_its_checksum
run a-journal-mac-skip a_torn_encrypted_entry_is_refused_by_its_mac
run b-journal-after-slot admission::
run b-cache-after-slot admission::
run b-grants-ignored admission::concurrent
run b-reclaim-on-ordinary admission::
run c-early-pin-release interleave::a_commit_between
run c-journal-reissue-other-bytes interleave::a_failed_journal
run c-no-fresh-node interleave::the_first_write
run c-node-checksum-skip interleave::a_torn_bset_is_refused_by_its_checksum
run c-node-mac-skip interleave::a_torn_encrypted_bset
run c-node-reissue-other-bytes interleave::a_failed_node_write
run c-skip-0 interleave::a_bset_naming
run d-unmount-skips-orphans ops::a_clean_unmount_releases_every_orphan_first
run d-fsck-clean-keys journal::a_clean_volume_holding
run e-evict-after-insert cache::tests
run e-values-unchecked node::tests
run f-fsck-zero-unexpected journal::a_stored_zero_accounting
run f-no-restate mount::a_clean_volume_with_an_empty_journal
run f-window-per-sequence journal::a_window_spanning 60
run f-ancestors-unbounded ops::counts_at_their_edges 60
run f-nlink-more-unchecked ops::counts_at_their_edges
run f-nlink-less-wrapping ops::counts_at_their_edges
run f-depth-unchecked ops::counts_at_their_edges
run f-geometry-unchecked mount::small_blocks
run f-alloc-trusted interleave::a_reclaim_plan_failing
run f-cache-by-sector-alone mount::a_pointer_to_a_cached
run f-reclaim-failure-unstopped interleave::a_reclaim_plan_failing
run f-hold-ignores-read-only interleave::a_node_write_failing 60
run f-rename-grant-short ops::a_rename_across_many
} > $C/all.log 2>&1
echo finished >> $C/all.log
