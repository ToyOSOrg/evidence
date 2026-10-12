#!/bin/bash
# PR #871, the round answering the review at 1eeca8742. At the head, each
# mutant applied as a checked patch, built and run, reported with its own
# exit, and taken back out; then the metal images staged from committed
# trees: the head for the T14 and the AMD bench, and the stack-slot mutant
# for the T14 from a local commit of head + patch, which is then dropped.
# Every step checks the tree clean at the head.
S=/Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/sysentry-r3
W=/Users/jan/Dev/jan/toyos-sysentry
P=$S/patches
L=$S/control
cd $W || exit 9
HEAD=$(git rev-parse HEAD)
echo "head $HEAD"
clean() { if git status --porcelain --ignore-submodules=none | grep -q .; then echo "tree not clean"; git status --porcelain; exit 9; fi; }
clean
shasum -a 256 $P/stack-slot.patch $P/all-kernel.patch $P/no-load-initial.patch $P/gate-entry-owner.patch

guest() { # <name> <patch>: QEMU vector_state_survives_a_switch with the patch applied
  echo "== $1: $(basename $2), under QEMU"
  git apply --check $2 || { echo "patch does not apply"; exit 9; }
  git apply $2
  git diff --stat | cat
  cargo test --test toyos-build -- vector_state_survives_a_switch > $L/qemu-$1.log 2>&1
  echo "QEMU_$1_EXIT=$?"
  git apply -R $2
  clean; echo "restored at $(git rev-parse HEAD)"
}
guest stack-slot $P/stack-slot.patch
guest all-kernel $P/all-kernel.patch
guest no-load-initial $P/no-load-initial.patch

echo "== gate-entry-owner: $(basename $P/gate-entry-owner.patch), the build system's host tests"
git apply --check $P/gate-entry-owner.patch || { echo "patch does not apply"; exit 9; }
git apply $P/gate-entry-owner.patch
git diff --stat | cat
cargo test --lib -- fpgate > $L/host-gate-entry-owner.log 2>&1
echo "HOST_gate-entry-owner_EXIT=$?"
git apply -R $P/gate-entry-owner.patch
clean; echo "restored at $(git rev-parse HEAD)"

echo "== stage, T14, head"
cargo test --test toyos-build -- --metal --metal-readback $S/metal/t14-head vector_state > $L/stage-t14-head.log 2>&1
echo "STAGE_T14_HEAD_EXIT=$?"
clean

echo "== stage, AMD bench, head"
cargo test --test toyos-build -- --metal --metal-readback $S/metal/amd-head --metal-host '<user>@<amd-bench>' vector_state > $L/stage-amd-head.log 2>&1
echo "STAGE_AMD_HEAD_EXIT=$?"
clean

echo "== stage, T14, stack-slot mutant"
git apply $P/stack-slot.patch
git commit -q -a -F $L/mutant-msg.txt
MUT=$(git rev-parse HEAD)
echo "mutant commit $MUT (local, never pushed; head + stack-slot.patch)"
git diff --stat $HEAD $MUT | cat
clean
cargo test --test toyos-build -- --metal --metal-readback $S/metal/t14-mut-slot vector_state > $L/stage-t14-mut-slot.log 2>&1
echo "STAGE_T14_MUT_EXIT=$?"
clean
OD=/Users/jan/.rustup/toolchains/nightly-2026-07-22-aarch64-apple-darwin/lib/rustlib/aarch64-apple-darwin/bin/llvm-objdump
for k in $(find $W/target -path '*x86_64-unknown-none*' -name kernel -type f -newer $L/stage-amd-head.log); do
  echo "kernel the mutant's staging built: ${k#$W/}"; shasum -a 256 $k
  $OD -d --no-show-raw-insn -C --x86-asm-syntax=intel $k | awk '/<<kernel::hw::KernelHw as kernel::sched::hw::Hw>::switch>:/{p=1} p&&/^$/{exit} p' > $L/switch-mut-slot.txt
  echo "OBJDUMP_EXIT=${PIPESTATUS[0]}"
done
git reset -q --hard $HEAD
clean; echo "back at $(git rev-parse HEAD)"
shasum -a 256 $S/metal/*/testcases/image.img
echo DONE
