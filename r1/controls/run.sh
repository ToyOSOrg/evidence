#!/bin/sh
# Apply each control patch, prove it builds, run the pipe tests, restore.
cd ~/Dev/<user>/toyos-pipebuf || exit 1
D=~/.claude/jobs/2280e09e/tmp/scratchpad/agents/pipebuf/controls
echo "revision $(git rev-parse HEAD)"
for p in $D/c*.patch; do
  n=$(basename $p .patch)
  git apply --check $p || { echo "$n: patch does not apply"; exit 1; }
  git apply $p
  cargo test -p kernel --lib --features sched-check --no-run > $D/$n.build.log 2>&1; b=$?
  cargo test -p kernel --lib --features sched-check pipe:: > $D/$n.test.log 2>&1; t=$?
  git apply -R $p
  echo "$n: build exit $b, test exit $t; failed: $(grep -E '^    pipe::' $D/$n.test.log | tr -d ' ' | tr '\n' ' ')"
done
cargo test -p kernel --lib --features sched-check pipe:: > $D/restored.test.log 2>&1
echo "restored: test exit $?; tree: $(git status --porcelain | wc -l | tr -d ' ') changed"
