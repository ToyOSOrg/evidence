#!/bin/sh
# The review's revert (busy-target-unkicked) against the row as it stands at
# d5165c28a, on a guest: the judge-head tree (b84bd8157, whose kernel/ is
# d5165c28a's) unpatched, then patched, then restored.
S=<home>/.claude/jobs/2280e09e/tmp/scratchpad/busywake-r3/revert-row
cd <home>/Dev/jan/toyos-busywake-judge-head || exit 2
git status --porcelain --ignore-submodules=none
echo "head: $(git rev-parse HEAD)"
cargo test --test toyos-build -- wake_onto_busy_smoke --nocapture > $S/head-smoke.log 2>&1
echo "head smoke EXIT=$?"
git apply $S/busy-target-unkicked.patch || exit 3
git diff --stat
cargo test --test toyos-build -- wake_onto_busy_smoke --nocapture > $S/reverted-smoke.log 2>&1
echo "reverted smoke EXIT=$?"
git checkout -- kernel/pure/sched/mailbox.rs
git status --porcelain --ignore-submodules=none
echo DONE
