#!/bin/bash
# Scratch: runs a static x86_64 Linux binary as PID 1 under QEMU TCG with AVX2 and BMI2
# (no AVX-512). $1 = binary, the rest = its arguments; $VM_TREES = directories carried at
# their own absolute paths. Correctness only: TCG timing means nothing.
set -euo pipefail
S=<home>/.claude/jobs/2280e09e/tmp/scratchpad/agents/p256
B=$1; shift
T=$(mktemp -d $S/vm.XXXXXX)
python3 -I $S/tools/initramfs.py $T/init.cpio "$B" ${VM_TREES:-}
qemu-system-x86_64 -accel tcg -cpu max \
  -m 2048 -smp 2 -nographic -no-reboot -kernel <home>/.claude/jobs/2280e09e/tmp/scratchpad/agents/chacha-avx2/dl/alpine/vmlinuz-virt -initrd $T/init.cpio \
  -append "earlyprintk=serial,ttyS0,115200 console=ttyS0,115200 loglevel=7 panic=-1 -- $*" < /dev/null
rm -rf $T
