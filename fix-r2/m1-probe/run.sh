#!/bin/bash
# M1: the stack-slot mutant, the slot-line probe and a per-syscall depth census,
# applied as one checked patch to the candidate head; vector_state under QEMU;
# the patch taken back out, leaving the tree clean.
S=/Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/sysentry-r2
W=/Users/jan/Dev/jan/toyos-sysentry
cd $W || exit 9
echo "head $(git rev-parse HEAD)"
git status --porcelain --ignore-submodules=none | grep . && { echo "tree not clean"; exit 9; }
git apply --check $S/patches/stack-all.patch || { echo "patch does not apply"; exit 9; }
git apply $S/patches/stack-all.patch
echo "applied: $(git diff --stat | tail -1)"
cargo test --test toyos-build -- vector_state_survives_a_switch > $S/m1/test.log 2>&1
echo "TEST_EXIT=$?"
git apply -R $S/patches/stack-all.patch
git status --porcelain --ignore-submodules=none
echo "restored; status above is empty when clean"
echo DONE
