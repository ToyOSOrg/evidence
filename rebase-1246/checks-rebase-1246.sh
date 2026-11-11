#!/bin/bash
# After the rebase onto main 06fcb81ea (#1246): the kernel host tests and
# clippy shapes for each PR, and B's loom models and control table.
H=<path>
ADOPTED="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon"
run() { name=$1; shift; echo "\$ $*" > "$L/$name.log"; "$@" >> "$L/$name.log" 2>&1; code=$?; echo "exit $code" >> "$L/$name.log"; echo "$name: exit $code ($*)" >> "$L/summary.txt"; }
kernel_shapes() {
  run kernel-lib cargo test -p kernel --lib --features sched-check
  run clippy-kernel-lib cargo clippy -p kernel --lib --tests --features sched-check -- $ADOPTED -D warnings
  run clippy-kernel-x86 cargo clippy -p kernel --target x86_64-unknown-none -- $ADOPTED -D warnings
  run clippy-kernel-x86-actuators cargo clippy -p kernel --target x86_64-unknown-none --features boot-actuators,test-actuators -- $ADOPTED -D warnings
  run clippy-kernel-aarch64 cargo clippy -p kernel --target aarch64-unknown-none-softfloat -- $ADOPTED -D warnings
}
for pr in a b; do
  case $pr in a) WT=$H/wt-a2;; b) WT=$H/wt-b3;; esac
  L=$H/logs/rebase-1246-$pr; mkdir -p "$L"; cd "$WT" || exit 1
  export CARGO_TARGET_DIR=$H/target-host-$pr
  echo "revision $(git rev-parse HEAD); clean: $(git status --porcelain | wc -l | tr -d ' ') changes" > "$L/summary.txt"
  kernel_shapes
  if [ $pr = b ]; then
    run loom cargo test -p kernel-loom --test loom_watch --test inbox_answer --test poll_once
    run clippy-loom cargo clippy -p kernel-loom --all-targets -- $ADOPTED -D warnings
    run control-table cargo test -p toyos-build --lib every_model_control_is_run
  fi
  cat "$L/summary.txt"
done
