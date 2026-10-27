#!/bin/sh
S=$SCRATCH; W=$WORKTREES/toyos-flash-settle
cd $W || exit 9
echo "head $(git rev-parse HEAD)"
for p in m1-no-reread m2-reread-before-settle m3-no-partition-wipe m4-no-final-settle; do
  echo "=== $p"
  git apply --check $S/mut/$p.patch || { echo "check failed"; exit 9; }
  git apply $S/mut/$p.patch
  (cd tests/metal && cargo test --no-run 2>&1 | tail -2); echo "build exit: $?"
  (cd tests/metal && cargo test --lib -- a_flash_reads_back_the_table_it_had_the_kernel_reread an_adopted_scratch_partition_carries_no_signature_the_old_image_left 2>&1); echo "test exit: $?"
  git apply -R $S/mut/$p.patch
  git diff --quiet && echo "restored"
done
echo "=== unmutated"
(cd tests/metal && cargo test --lib -- a_flash_reads_back_the_table_it_had_the_kernel_reread an_adopted_scratch_partition_carries_no_signature_the_old_image_left 2>&1); echo "test exit: $?"
