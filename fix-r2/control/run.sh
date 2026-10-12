#!/bin/bash
# The stack-slot mutant (b0d75d331's patch) against vector_state at the head:
#   1. under QEMU (TCG's XSAVEOPT, which skips nothing), applied as a checked
#      patch, run, and taken back out;
#   2. the T14's images staged, the head's from the clean head and the
#      mutant's from a local commit of head + patch, which is then dropped.
# Every step leaves the tree clean at the head; each command's own exit.
S=/Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/sysentry-r2
W=/Users/jan/Dev/jan/toyos-sysentry
P=$S/patches/mutant-stack-slot.patch
cd $W || exit 9
HEAD=$(git rev-parse HEAD)
echo "head $HEAD"
clean() { git status --porcelain --ignore-submodules=none | grep -q . && { echo "tree not clean"; git status --porcelain; exit 9; }; return 0; }
clean
shasum -a 256 $P

echo "== 1. QEMU, mutant applied"
git apply --check $P || { echo "patch does not apply"; exit 9; }
git apply $P
git diff --stat | cat
cargo test --test toyos-build -- vector_state_survives_a_switch > $S/control/qemu-mutant.log 2>&1
echo "QEMU_MUTANT_EXIT=$?"
git apply -R $P
clean; echo "restored at $(git rev-parse HEAD)"

echo "== 2a. T14 stage, head"
cargo test --test toyos-build -- --metal --metal-readback $S/metal/t14-head vector_state > $S/control/stage-t14-head.log 2>&1
echo "STAGE_HEAD_EXIT=$?"
clean

echo "== 2b. T14 stage, mutant"
git apply $P
git commit -q -a -F $S/control/mutant-msg.txt
MUT=$(git rev-parse HEAD)
echo "mutant commit $MUT (local, never pushed; head + $P)"
git diff --stat $HEAD $MUT | cat
clean
cargo test --test toyos-build -- --metal --metal-readback $S/metal/t14-mut-slot vector_state > $S/control/stage-t14-mut-slot.log 2>&1
echo "STAGE_MUT_EXIT=$?"
clean
git reset -q --hard $HEAD
clean; echo "back at $(git rev-parse HEAD)"
echo DONE
