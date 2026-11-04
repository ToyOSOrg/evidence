#!/bin/bash
S=$SCRATCH/s0a2
R=$HOME/.claude/jobs/2280e09e/tmp/scratchpad/orch/qemu-remote.sh
for i in 1; do
  for br in s0a-probe-base-kvm-wseg s0a-probe2-kvm-wseg; do
    echo "== $i $br"
    QEMU_REMOTE_LOGS=$S/remote-logs $R $br --test toyos-build -- osbench_capability_groups_exit_0 --nocapture > $S/kvm6-$i-$br.log 2>&1
    echo "rc=$?"
  done
done
echo done
