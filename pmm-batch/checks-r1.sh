#!/bin/bash
# #1268 review r1: the frames and vm tests and library clippy at the rebased head (doc and test edits only
# since 2cfa7887b's full checks).
set -u
S=<scratch>/spawnperf
cd $S/wt || exit 1
echo "rev $(git rev-parse HEAD)"
git status --short
A="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon"
run() { echo "== $*"; "$@"; echo "exit $?"; }
run cargo test -p kernel --lib --features sched-check frames::
run cargo test -p kernel --lib --features sched-check vm::
run cargo clippy -p kernel --lib --tests --features sched-check -- $A -D warnings
run cargo clippy -p kernel --target x86_64-unknown-none -- $A -D warnings
echo "all done"
