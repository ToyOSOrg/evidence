#!/bin/bash
# #1250 round 1: the touched modules' host tests, the mutation that reads past the source again,
# and clippy of the kernel library. (checks-1.log: the kernel on both bare targets and the guest
# test binaries built at 2a9e60755, which differs from this head only in a test module import.)
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
run cargo test -p kernel --lib --features sched-check vm::tests::a_
git apply -R $S/r1/mutation-read-empty.patch || { echo "mutation does not revert"; exit 1; }
git diff --quiet kernel/pure/vm.rs && echo "mutation reverted"
run cargo clippy -p kernel --lib --tests --features sched-check -- $A -D warnings



echo "all done"
