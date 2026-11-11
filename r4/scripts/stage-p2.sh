#!/bin/bash
# Stage P' (refs/scratch/seqwrite-P2 = PR head d3d67f8b5 + the osbench_disk row) for the second A/B; touches no
# machine. Then the record commit's identifier gate on the branch head.
S=<scratch>
cd $S/wt || exit 9
git checkout -q --detach refs/scratch/seqwrite-P2 || exit 9
mkdir -p $S/metal/P2
cargo test --test toyos-build -- --metal --metal-readback $S/metal/P2 osbench_disk > $S/logs/stage-P2.log 2>&1
echo "exit $?" >> $S/logs/stage-P2.log
git checkout -q seqwrite || exit 9
cargo test --lib sourcegate > $S/logs/sourcegate-d3d67f8b5.log 2>&1
echo "exit $?" >> $S/logs/sourcegate-d3d67f8b5.log
