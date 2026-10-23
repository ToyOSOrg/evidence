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
run c-node-reissue-other-bytes interleave::a_failed_node
run c-skip-0 interleave::a_bset_naming
run d-unmount-skips-orphans ops::a_clean_unmount_releases_every_orphan_first
run d-fsck-clean-keys journal::a_clean_volume_holding
run e-evict-after-insert cache::tests
run e-values-unchecked node::tests
} > $C/all.log 2>&1
echo finished >> $C/all.log
