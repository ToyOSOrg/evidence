#!/bin/bash
# #1270 review r1: the slot's loom models and control, every model and control (CI's models part),
# the build crate's control table, the kernel library's tests, and the clippy shapes.
set -u
S=<scratch>/spawnperf
cd $S/wt || exit 1
echo "rev $(git rev-parse HEAD)"
git status --short
A="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon"
run() { echo "== $*"; "$@"; echo "exit $?"; }
run cargo test --manifest-path kernel/loom/Cargo.toml --test shm_slot
run cargo test --manifest-path kernel/loom/Cargo.toml --features slot-install-relaxed --test shm_slot
run cargo clippy -p kernel-loom --all-targets -- $A -D warnings
run cargo clippy -p kernel-loom --all-targets --features slot-install-relaxed -- $A -D warnings
run cargo test -p toyos-build --lib ci::
run cargo test -p kernel --lib --features sched-check
run cargo run -- --ci host models
run cargo clippy -p kernel --target x86_64-unknown-none -- $A -D warnings
run cargo clippy -p kernel --target x86_64-unknown-none --features boot-actuators,test-actuators -- $A -D warnings
run cargo clippy -p kernel --target x86_64-unknown-none --features boot-actuators -- $A -D warnings
run cargo clippy -p kernel --target aarch64-unknown-none-softfloat -- $A -D warnings
run cargo clippy -p kernel --target aarch64-unknown-none-softfloat --features boot-actuators,test-actuators -- $A -D warnings
run cargo clippy -p kernel --lib --tests --features sched-check -- $A -D warnings
echo "all done"
