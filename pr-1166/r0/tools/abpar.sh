#!/bin/bash
# abpar.sh <tag> <rounds>: scratch. Per round and arm, two harness invocations of the four virtsmpcase
# rows at once: base (the branch's commit reverted, = main with #1160) and head (the branch).
S=$SCRATCH/liveness
L=$S/logs; tag=$1; rounds=$2
cd $HOME/Dev/$USER/toyos-liveness || exit 1
for i in $(seq 1 $rounds); do
  for arm in base head; do
    [ $arm = base ] && { git apply -R $S/patches/guest-cpus-commit.patch || exit 1; }
    cargo test --test toyos-build --no-run > $L/$tag-$i-$arm-build.log 2>&1
    echo "== $tag round $i $arm $(git rev-parse --short HEAD) $(uptime | sed 's/.*load/load/')"
    for half in a b; do
      cargo test --test toyos-build -- virt_smp virt_el1_smp virt_mask_windows virt_off_names_the_cpus_left_on --nocapture > $L/$tag-$i-$arm-$half.log 2>&1 &
    done
    wait
    echo "done $(uptime | sed 's/.*load/load/')"
    grep -hE "^\S+ +(PASS|STALL) " $L/$tag-$i-$arm-[ab].log | cut -c1-120
    [ $arm = base ] && { git apply $S/patches/guest-cpus-commit.patch || exit 1; }
  done
done
