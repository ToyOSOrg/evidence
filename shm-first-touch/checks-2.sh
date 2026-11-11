#!/bin/bash
# First-touch regions at the PR head: every kernel model and its control (the CI part that runs
# them, since this adds one), the build crate's CI-table tests, and clippy of the kernel.
set -u
S=<scratch>/spawnperf
cd $S/wt || exit 1
echo "rev $(git rev-parse HEAD)"
git status --short
A="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon"
run() { echo "== $*"; "$@"; echo "exit $?"; }
run cargo test -p toyos-build --lib ci::
run cargo run -- --ci host models
run cargo clippy -p kernel --target x86_64-unknown-none -- $A -D warnings
run cargo clippy -p kernel --target x86_64-unknown-none --features boot-actuators,test-actuators -- $A -D warnings
run cargo clippy -p kernel --target aarch64-unknown-none-softfloat -- $A -D warnings
run cargo clippy -p kernel --lib --tests --features sched-check -- $A -D warnings
echo "all done"
