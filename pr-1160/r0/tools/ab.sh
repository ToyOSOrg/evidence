#!/bin/bash
# ab.sh <tag> <rounds> <patch>: scratch. Interleaved A/B of the four virtsmpcase rows under the
# background QoS clamp: base (the worktree as it is) then head (with <patch> applied), per round.
L=$SCRATCH/liveness/logs
tag=$1; rounds=$2; patch=$3
cd $HOME/Dev/$USER/toyos-liveness || exit 1
for i in $(seq 1 $rounds); do
  for arm in base head; do
    [ $arm = head ] && { git apply $patch || exit 1; }
    echo "== $tag round $i $arm $(git rev-parse --short HEAD) $(uptime | sed 's/.*load/load/')"
    SCOUT_BG=1 cargo test --test toyos-build -- virt_smp virt_el1_smp virt_mask_windows virt_off_names_the_cpus_left_on --nocapture > $L/$tag-$i-$arm.log 2>&1
    echo "rc=$? $(uptime | sed 's/.*load/load/')"
    grep -E "^\S+ +(PASS|FAIL|STALL) " $L/$tag-$i-$arm.log | cut -c1-110
    [ $arm = head ] && { git apply -R $patch || exit 1; }
  done
done
