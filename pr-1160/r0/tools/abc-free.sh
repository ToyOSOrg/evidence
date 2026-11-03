#!/bin/bash
# abc.sh <tag> <rounds>: scratch. Interleaved arms of the four virtsmpcase rows, QEMU at background QoS
# (SCOUT_BG): base (main), onecopy (fix-one-copy.patch), tas (scout-tas.patch), one boot of each per round.
S=$SCRATCH/liveness
L=$S/logs; tag=$1; rounds=$2
cd $HOME/Dev/$USER/toyos-liveness || exit 1
for i in $(seq 1 $rounds); do
  for arm in base onecopy tas; do
    case $arm in onecopy) p=$S/patches/fix-one-copy.patch;; tas) p=$S/patches/scout-tas.patch;; *) p=;; esac
    [ -n "$p" ] && { git apply $p || exit 1; }
    echo "== $tag round $i $arm $(git rev-parse --short HEAD) $(uptime | sed 's/.*load/load/')"
    cargo test --test toyos-build -- virt_smp virt_el1_smp virt_mask_windows virt_off_names_the_cpus_left_on --nocapture > $L/$tag-$i-$arm.log 2>&1
    echo "rc=$? $(uptime | sed 's/.*load/load/')"
    grep -E "^\S+ +(PASS|FAIL|STALL) " $L/$tag-$i-$arm.log | cut -c1-120
    [ -n "$p" ] && { git apply -R $p || exit 1; }
  done
done
