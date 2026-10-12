#!/bin/sh
# Scratch: the storm-diag counts with the self-kick's need_resched removed
# (remote busy kicks kept), then a second head run, then the tree restored.
S=<home>/.claude/jobs/2280e09e/tmp/scratchpad/agents/874-r4/diag
cd <home>/Dev/jan/toyos-busywake || exit 2
git apply $S/no-self-resched-diag.patch || exit 3
git diff --stat
cargo test --test toyos-build -- wake_storm_smoke --nocapture > $S/noself.log 2>&1
echo "no-self smoke EXIT=$?"
git apply -R $S/no-self-resched-diag.patch
git diff --stat
cargo test --test toyos-build -- wake_storm_smoke --nocapture > $S/head2.log 2>&1
echo "head2 smoke EXIT=$?"
echo DONE
