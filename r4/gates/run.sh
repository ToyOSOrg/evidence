#!/bin/sh
# Round 4's gates at the merged head, then each mutation applied as a checked
# patch, run, and restored; the tree clean before and after.
S=<home>/.claude/jobs/2280e09e/tmp/scratchpad/agents/874-r4
G=$S/gates2; M=$S/mutations
cd <home>/Dev/jan/toyos-busywake || exit 2
echo "head: $(git rev-parse HEAD)"
git status --porcelain --ignore-submodules=none
cargo run -- --ci host > $G/ci-host.log 2>&1; echo "ci host EXIT=$?"
cargo run -- --build-only > $G/build-only.log 2>&1; echo "build-only EXIT=$?"
cargo test > $G/guest.log 2>&1; echo "guest suite EXIT=$?"
cargo test -p kernel-sim > $G/sim.log 2>&1; echo "kernel-sim EXIT=$?"
for m in self-wake-rung boosted-self-unrung every-wake-unrung sim-runs-on-never; do
  git apply --check $M/$m.patch || { echo "$m does not apply"; continue; }
  git apply $M/$m.patch
  (cd kernel && cargo test -p kernel --lib sched > $M/$m-unit.log 2>&1); echo "$m unit EXIT=$?"
  cargo test -p kernel-sim > $M/$m-sim.log 2>&1; echo "$m sim EXIT=$?"
  git apply -R $M/$m.patch
done
git status --porcelain --ignore-submodules=none
echo DONE
