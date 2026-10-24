#!/bin/bash
# Every B6 mutation control, one after another; summary in all.log.
C=$B6/controls
cd $C
run() { echo "=== $1 [$2]"; bash $C/run.sh $C/$1.patch "$2" ${3:-600}; }
{
echo "revision: $(git -C $WORKTREE rev-parse HEAD) dirty: $(git -C $WORKTREE status --porcelain | wc -l)"
run m-reuse-before-durable buckets::a_bucket_emptied_by
cp $C/m-reuse-before-durable.patch.log $C/m-reuse-before-durable.constructed.log
run m-reuse-before-durable crash::renames_reusing 1200
cp $C/m-reuse-before-durable.patch.log $C/m-reuse-before-durable.crash.log
run m-reuse-while-read buckets::a_bucket_a_traversal
run m-never-reuse buckets::renames_past
run m-admission-ignores-room buckets::a_full_volume
run m-removal-no-reserve buckets::a_full_volume
run m-backpointers-unchecked buckets::an_empty_bucket_a_backpointer
run m-stale-kept buckets::a_bucket_a_traversal
run m-fsck-emptied-unchecked buckets::a_bucket_emptied_past
run m-durable-never buckets::renames_past
run m-last-seq-own crash::a_torn_newest 1200
run m-unclean-before-entry crash::the_superblock_goes_unclean 1200
run m-header-with-entry crash::the_superblock_goes_unclean 1200
} > $C/all.log 2>&1
