#!/bin/sh
# Scratch: storm-diag2 at the merged head twice, then with the self-kick's
# need_resched removed, then with the busy-target kick reverted; tree restored.
S=<home>/.claude/jobs/2280e09e/tmp/scratchpad/agents/874-r4/diag
cd <home>/Dev/jan/toyos-busywake || exit 2
for r in a b; do
  cargo test --test toyos-build -- wake_storm_smoke --nocapture > $S/d2-head-$r.log 2>&1
  echo "head $r EXIT=$?"
done
git apply $S/no-self-resched-diag.patch || exit 3
cargo test --test toyos-build -- wake_storm_smoke --nocapture > $S/d2-noself.log 2>&1
echo "noself EXIT=$?"
git apply -R $S/no-self-resched-diag.patch
git apply $S/busy-target-unkicked-diag.patch || exit 4
cargo test --test toyos-build -- wake_storm_smoke --nocapture > $S/d2-reverted.log 2>&1
echo "reverted EXIT=$?"
git apply -R $S/busy-target-unkicked-diag.patch
git diff --stat
echo DONE
