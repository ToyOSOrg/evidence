#!/bin/bash
# qstall.sh: head's osbench bench groups three times, for the b4096 stall.
S=$SCRATCH/s0a2
cd $HOME/Dev/$USER/toyos-s0a || exit 1
python3 -I $S/scripts/bench.py . apply || exit 1
for i in 1 2 3; do
  echo "== $i $(git rev-parse --short HEAD) $(uptime | sed 's/.*load/load/')"
  cargo test --test toyos-build -- osbench_capability_groups_exit_0 --nocapture > $S/qstall-$i.log 2>&1
  echo "rc=$?"
done
python3 -I $S/scripts/bench.py . revert
git status --porcelain
echo done
