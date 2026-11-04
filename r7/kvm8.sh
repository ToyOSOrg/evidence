#!/bin/bash
S=$SCRATCH/s0a2
R=$HOME/.claude/jobs/2280e09e/tmp/scratchpad/orch/qemu-remote.sh
for br in s0a-probe2-kvm-noarc s0a-probe-base-kvm-wseg s0a-probe2-kvm-wseg s0a-probe2-kvm-noarc; do
  echo "== $br"
  QEMU_REMOTE_LOGS=$S/remote-logs $R $br --test toyos-build -- osbench_capability_groups_exit_0 --nocapture > $S/kvm8-$br-$(date +%s).log 2>&1
  echo "rc=$?"
done
echo done
