#!/bin/bash
# pmm-batch on #1250's head: the frames and vm tests, the mutation of the batch's up-front check,
# clippy of the kernel on both bare targets and its library; then, if every check that must pass
# did, stage the A/B (A = pmm-batch-ab-a, B = pmm-batch-ab-b) for both benches. Staging exits
# non-zero by design (it touched no machine); the request files are the result.
set -u
S=<scratch>/spawnperf
cd $S/wt || exit 1
git checkout -q pmm-batch || exit 1
echo "rev $(git rev-parse HEAD)"
git status --short
A="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon"
bad=0
run() { echo "== $*"; "$@"; local e=$?; echo "exit $e"; return $e; }
run cargo test -p kernel --lib --features sched-check frames:: || bad=1
run cargo test -p kernel --lib --features sched-check vm:: || bad=1
echo "== mutation: the batch takes frames before checking its promises"
git apply $S/batch/mutation-no-upfront-check.patch || { echo "mutation does not apply"; exit 1; }
run cargo test -p kernel --lib --features sched-check frames::tests::a_batch && bad=1
git apply -R $S/batch/mutation-no-upfront-check.patch || { echo "mutation does not revert"; exit 1; }
git diff --quiet kernel/pure/frames.rs && echo "mutation reverted"
run cargo clippy -p kernel --target x86_64-unknown-none -- $A -D warnings || bad=1
run cargo clippy -p kernel --target x86_64-unknown-none --features boot-actuators,test-actuators -- $A -D warnings || bad=1
run cargo clippy -p kernel --target aarch64-unknown-none-softfloat -- $A -D warnings || bad=1
run cargo clippy -p kernel --lib --tests --features sched-check -- $A -D warnings || bad=1
if [ $bad != 0 ]; then echo "checks failed: not staging"; echo "all done"; exit 1; fi
for side in a b; do
  git checkout -q pmm-batch-ab-$side || { echo "checkout $side failed"; exit 1; }
  echo "== side $side rev $(git rev-parse HEAD)"
  git status --porcelain --ignore-submodules=none
  cargo test --test toyos-build -- --metal --metal-readback $S/batch/stage-$side-t14 batch_ab
  echo "exit $? ($side t14)"
  cargo test --test toyos-build -- --metal --metal-readback $S/batch/stage-$side-amd --metal-host '<amd-bench-host>' batch_ab
  echo "exit $? ($side amd)"
done
git checkout -q pmm-batch
echo "all done"
