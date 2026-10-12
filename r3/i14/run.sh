#!/bin/sh
# Which path hands the corpse on in the re-shrunk I14 corpus replay: each
# marker patch panics at one hand_off site when the task it hands is killed.
# Applied, built, replayed and restored one at a time.
E=<home>/.claude/jobs/2280e09e/tmp/scratchpad/busywake-r3/ev/i14
cd <home>/Dev/jan/toyos-busywake || exit 2
echo "head $(git rev-parse HEAD), tree clean: $(git status --porcelain --ignore-submodules=none | wc -l | tr -d ' ') changes"
cargo build -p kernel-sim --release -q || exit 3
echo "== unpatched"
./target/release/kernel-sim replay kernel/sim/corpus/old_migrate_kept_the_corpse_i14.trace; echo "replay EXIT=$?"
for p in forward-marker steal-marker; do
  git apply --check $E/$p.patch || exit 4
  git apply $E/$p.patch
  cargo build -p kernel-sim --release -q || exit 5
  echo "== $p"
  ./target/release/kernel-sim replay kernel/sim/corpus/old_migrate_kept_the_corpse_i14.trace 2>&1 | grep -v "^ *[0-9]*: \|^ *at \|stack backtrace\|RUST_BACKTRACE"
  echo "replay EXIT=$?  (grep's; the replay's own exit is the line above)"
  git checkout -- kernel/pure/sched/cpu.rs
done
echo "restored: $(git status --porcelain --ignore-submodules=none | wc -l | tr -d ' ') changes"
