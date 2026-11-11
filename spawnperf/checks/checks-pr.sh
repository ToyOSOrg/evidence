#!/bin/bash
# Targeted checks of the local-defects PR: the touched pure module's tests, its
# mutation control, and clippy of the kernel library and of the kernel on both bare targets.
set -u
S=<scratch>/spawnperf
cd $S/wt || exit 1
echo "rev $(git rev-parse HEAD)"
git status --short
A="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon"
run() { echo "== $*"; "$@"; echo "exit $?"; }

run cargo test -p kernel --lib --features sched-check vm::

echo "== mutation: drop the zeroing past the copied bytes"
git apply $S/mutation-tail.patch || { echo "mutation does not apply"; exit 1; }
run cargo test -p kernel --lib --features sched-check vm::tests::a_copied_page_keeps_nothing_its_frame_held
git apply -R $S/mutation-tail.patch || { echo "mutation does not revert"; exit 1; }
git diff --quiet kernel/pure/vm.rs && echo "mutation reverted"

run cargo clippy -p kernel --lib --tests --features sched-check -- $A -D warnings
run cargo clippy -p kernel --target x86_64-unknown-none -- $A -D warnings
run cargo clippy -p kernel --target aarch64-unknown-none-softfloat -- $A -D warnings
echo "all done"
