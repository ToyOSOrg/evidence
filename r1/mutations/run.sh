#!/bin/zsh
# Each mutation: apply checked, build, run the message tests, restore in the same run.
cd ~/Dev/<user>/toyos-handle-wake
S=~/.claude/jobs/2280e09e/tmp/scratchpad/agents/pkg/mutations
echo "rev $(git rev-parse HEAD) (+ uncommitted comment renames)"
echo "== base"; cargo test -p kernel --lib --features sched-check message:: > $S/base.log 2>&1; echo "base exit $?"
for p in $S/*.patch; do
  n=${p:t:r}
  git apply --check $p || { echo "$n: does not apply"; continue; }
  git apply $p
  cargo build -p kernel --lib --tests --features sched-check > $S/$n.build.log 2>&1; echo "$n build exit $?"
  cargo test -p kernel --lib --features sched-check message:: > $S/$n.log 2>&1; echo "$n test exit $?"
  git apply -R $p; echo "$n restored exit $?"
done
git diff --stat -- kernel/pure/message.rs
