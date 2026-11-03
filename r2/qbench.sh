#!/bin/bash
# qbench.sh: the QEMU order sweep of the bounce threshold. Arms: base, claim
# (no bounce), b4096 (the bounce), b1024 (the bounce at 1024). Two interleaved
# rounds; each run the osbench capability test with the bench groups.
S=$SCRATCH/s0a2
cd $HOME/Dev/$USER/toyos-s0a || exit 1
for i in 1 2; do
  for arm in base claim b4096 b1024; do
    case $arm in base) rev=a0e8f1333;; claim) rev=19c814f63;; *) rev=0d0a03065;; esac
    git checkout -q --detach $rev || exit 1
    [ $arm = b1024 ] && sed -i '' 's/^pub const BOUNCE: usize = 4096;$/pub const BOUNCE: usize = 1024;/' kernel/src/frame_bytes.rs
    [ $arm = b1024 ] && { grep -q 'BOUNCE: usize = 1024' kernel/src/frame_bytes.rs || exit 2; }
    python3 -I $S/scripts/bench.py . apply || exit 1
    echo "== round $i $arm $(git rev-parse --short HEAD) $(uptime | sed 's/.*load/load/')"
    cargo test --test toyos-build -- osbench_capability_groups_exit_0 --nocapture > $S/qbench-$i-$arm.log 2>&1
    echo "rc=$?"
    python3 -I $S/scripts/bench.py . revert
    git checkout -q -- kernel/src/frame_bytes.rs
  done
done
git checkout -q s0a-wide-own
git status --porcelain
echo done
