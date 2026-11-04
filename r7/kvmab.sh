#!/bin/bash
# kvmab.sh: the probe branches' osbench bench groups on the remote KVM host, interleaved.
S=$SCRATCH/s0a2
R=$HOME/.claude/jobs/2280e09e/tmp/scratchpad/orch/qemu-remote.sh
for i in 1 2; do
  for arm in base head; do
    br=s0a-probe-kvm; [ $arm = base ] && br=s0a-probe-base-kvm
    echo "== $i $arm $br"
    QEMU_REMOTE_LOGS=$S/remote-logs $R $br --test toyos-build -- osbench_capability_groups_exit_0 --nocapture > $S/kvm-$i-$arm.log 2>&1
    echo "rc=$?"
  done
done
echo done
