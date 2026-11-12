#!/bin/bash
# The stack rebased onto main a7ca8ad09: at each head, the vm and frames tests and the kernel's
# clippy shapes; at #1270's head also the slot's loom models and their control.
set -u
S=<scratch>/spawnperf
cd $S/wt || exit 1
A="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon"
run() { echo "== $*"; "$@"; echo "exit $?"; }
for b in spawnperf pmm-batch shm-first-touch; do
  git checkout -q $b || exit 1
  echo "### $b rev $(git rev-parse HEAD)"
  git status --short
  run cargo test -p kernel --lib --features sched-check vm::
  run cargo test -p kernel --lib --features sched-check frames::
  run cargo clippy -p kernel --target x86_64-unknown-none -- $A -D warnings
  run cargo clippy -p kernel --target x86_64-unknown-none --features boot-actuators,test-actuators -- $A -D warnings
  run cargo clippy -p kernel --target aarch64-unknown-none-softfloat -- $A -D warnings
  run cargo clippy -p kernel --lib --tests --features sched-check -- $A -D warnings
done
run cargo test --manifest-path kernel/loom/Cargo.toml --test shm_slot
run cargo test --manifest-path kernel/loom/Cargo.toml --features slot-install-relaxed --test shm_slot
echo "all done"
