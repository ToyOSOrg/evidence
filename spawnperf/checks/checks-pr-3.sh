#!/bin/bash
# Round 3, after the rebase onto main 45935f4b9: the touched module's tests and clippy of the kernel on both bare targets and its library.

set -u
S=<scratch>/spawnperf
cd $S/wt || exit 1
echo "rev $(git rev-parse HEAD)"
git status --short
A="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon"
run() { echo "== $*"; "$@"; echo "exit $?"; }
run cargo test -p kernel --lib --features sched-check vm::
run cargo clippy -p kernel --target x86_64-unknown-none -- $A -D warnings
run cargo clippy -p kernel --target x86_64-unknown-none --features boot-actuators,test-actuators -- $A -D warnings
run cargo clippy -p kernel --target aarch64-unknown-none-softfloat -- $A -D warnings
run cargo clippy -p kernel --lib --tests --features sched-check -- $A -D warnings
echo "all done"
