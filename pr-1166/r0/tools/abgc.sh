#!/bin/bash
# abgc.sh <tag> <rounds>: scratch. Interleaved arms of the four virtsmpcase rows in one invocation:
# base (guest-cpus.patch reverted, = main) and head (the branch), at the host's ambient load.
S=$SCRATCH/liveness
L=$S/logs; tag=$1; rounds=$2
cd $HOME/Dev/$USER/toyos-liveness || exit 1
for i in $(seq 1 $rounds); do
  for arm in base head; do
    [ $arm = base ] && { git apply -R $S/patches/guest-cpus.patch || exit 1; }
    echo "== $tag round $i $arm $(git rev-parse --short HEAD) $(uptime | sed 's/.*load/load/')"
    cargo test --test toyos-build -- virt_smp virt_el1_smp virt_mask_windows virt_off_names_the_cpus_left_on --nocapture > $L/$tag-$i-$arm.log 2>&1
    echo "rc=$? $(uptime | sed 's/.*load/load/')"
    grep -E "^\S+ +(PASS|STALL|FAIL) " $L/$tag-$i-$arm.log | grep -v " FAIL [a-z_]*:" | cut -c1-120
    [ $arm = base ] && { git apply $S/patches/guest-cpus.patch || exit 1; }
  done
done
