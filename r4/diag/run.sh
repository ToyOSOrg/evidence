#!/bin/sh
# Scratch: the storm-diag counts on an 8-vCPU guest at the merged head, then
# with the busy-target kick reverted, then the tree restored.
S=<home>/.claude/jobs/2280e09e/tmp/scratchpad/agents/874-r4/diag
cd <home>/Dev/jan/toyos-busywake || exit 2
echo "head: $(git rev-parse HEAD)"
git diff --stat
cargo test --test toyos-build -- wake_storm_smoke --nocapture > $S/head.log 2>&1
echo "head smoke EXIT=$?"
git apply $S/busy-target-unkicked-diag.patch || exit 3
git diff --stat
cargo test --test toyos-build -- wake_storm_smoke --nocapture > $S/reverted.log 2>&1
echo "reverted smoke EXIT=$?"
git apply -R $S/busy-target-unkicked-diag.patch
git diff --stat
echo DONE
