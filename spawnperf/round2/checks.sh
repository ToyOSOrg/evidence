#!/bin/bash
# #1250 review r2: the vm and frames tests, the read-past-the-source mutation, library clippy.
set -u
S=<scratch>/spawnperf
cd $S/wt || exit 1
echo "rev $(git rev-parse HEAD)"
git status --short
A="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon"
run() { echo "== $*"; "$@"; echo "exit $?"; }
run cargo test -p kernel --lib --features sched-check vm::
run cargo test -p kernel --lib --features sched-check frames::
echo "== mutation: a page that takes no bytes reads the source anyway"
git apply $S/r1/mutation-read-empty.patch || { echo "mutation does not apply"; exit 1; }
run cargo test -p kernel --lib --features sched-check vm::tests::a_copied_page
git apply -R $S/r1/mutation-read-empty.patch || { echo "mutation does not revert"; exit 1; }
git diff --quiet kernel/pure/vm.rs && echo "mutation reverted"
run cargo clippy -p kernel --lib --tests --features sched-check -- $A -D warnings
echo "all done"
