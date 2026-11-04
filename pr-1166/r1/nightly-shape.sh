#!/bin/bash
# nightly-shape.sh: scratch. Base (the budget reverted) then head, each `--jobs 1` with TOYOS_HOST_CORES=4,
# the nightly guest job's width on a four-core runner, over five rows.
S=$SCRATCH/liveness; L=$S/logs
cd $HOME/Dev/$USER/toyos-liveness || exit 1
ROWS="virt_smp virt_el1_smp virt_mask_windows virt_off_names_the_cpus_left_on libc_children"
for arm in base head; do
  [ $arm = base ] && { git apply -R $S/patches/guest-cpus-all.patch || exit 1; }
  cargo test --test toyos-build --no-run > $L/ns-$arm-build.log 2>&1
  echo "== $arm $(uptime | sed 's/.*load/load/')"
  TOYOS_HOST_CORES=4 cargo test --test toyos-build -- $ROWS --jobs 1 > $L/ns-$arm.log 2>&1
  echo "rc=$?"
  grep -E "^\S+ +(PASS|STALL|FAIL) |test result" $L/ns-$arm.log | grep -v " FAIL [a-z_]*:" | cut -c1-140
  echo "waits: $(grep -c 'waiting for the host CPUs' $L/ns-$arm.log)"
  [ $arm = base ] && { git apply $S/patches/guest-cpus-all.patch || exit 1; }
done
