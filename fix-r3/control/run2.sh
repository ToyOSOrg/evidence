#!/bin/bash
# PR #871, this round, second script. run.sh's spawn-side kind mutant
# (all-kernel.patch) did not build: rustc's dead-code lint, denied, refused
# `Runs::User` never constructed. This runs the same defect at the switch,
# applied as a checked patch, run under QEMU and taken back out; then it
# builds the head and reads its trampolines, its switch and its flagged list
# with LLVM's disassembler. Every step checks the tree clean at the head.
S=/Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/sysentry-r3
W=/Users/jan/Dev/jan/toyos-sysentry
P=$S/patches
L=$S/control
OD=/Users/jan/.rustup/toolchains/nightly-2026-07-22-aarch64-apple-darwin/lib/rustlib/aarch64-apple-darwin/bin/llvm-objdump
cd $W || exit 9
echo "head $(git rev-parse HEAD)"
clean() { if git status --porcelain --ignore-submodules=none | grep -q .; then echo "tree not clean"; git status --porcelain; exit 9; fi; }
clean
shasum -a 256 $P/user-unsaved.patch

echo "== user-unsaved: user-unsaved.patch, under QEMU"
git apply --check $P/user-unsaved.patch || { echo "patch does not apply"; exit 9; }
git apply $P/user-unsaved.patch
git diff --stat | cat
cargo test --test toyos-build -- vector_state_survives_a_switch > $L/qemu-user-unsaved.log 2>&1
echo "QEMU_user-unsaved_EXIT=$?"
git apply -R $P/user-unsaved.patch
clean; echo "restored at $(git rev-parse HEAD)"

echo "== the head's kernel, built and disassembled"
cargo run -- --build-only > $L/build-only-head.log 2>&1
echo "BUILD_EXIT=$?"
clean
K=$W/target/x86_64-unknown-none/toyos/kernel
shasum -a 256 $K
$OD --version > $L/objdump-version.txt 2>&1
$OD -d --no-show-raw-insn -C $K > $L/objdump-head-r3.txt 2>&1
echo "OBJDUMP_EXIT=$?"
awk -f $S/evidence/fpgate/oracle/oracle.awk $L/objdump-head-r3.txt 2> $L/total-head-r3.txt | sort | uniq -c > $L/flagged-r3.txt
echo "ORACLE_EXIT=${PIPESTATUS[0]}"
cat $L/total-head-r3.txt
cat $L/flagged-r3.txt
for f in 'kernel::arch::x86_64::entry::kernel_start' 'kernel::arch::x86_64::entry::thread_start' 'kernel::arch::x86_64::entry::process_start' 'kernel::arch::x86_64::fpu::load_initial' '<kernel::hw::KernelHw as kernel::sched::hw::Hw>::switch'; do
  awk -v f="<$f>:" '$0 ~ /^[0-9a-f]+ </ && index($0, f) {p=1} p&&/^$/{p=0; print ""} p' $L/objdump-head-r3.txt
done > $L/head-r3-excerpt.txt
echo "EXCERPT_LINES=$(wc -l < $L/head-r3-excerpt.txt)"
echo DONE
