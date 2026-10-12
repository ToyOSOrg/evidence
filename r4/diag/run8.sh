#!/bin/sh
# Scratch: wake_storm_cost on an 8-vCPU guest, three runs at the fix (the
# smoke harness entry only), then the harness entry removed.
S=<home>/.claude/jobs/2280e09e/tmp/scratchpad/agents/874-r4/diag
cd <home>/Dev/jan/toyos-busywake || exit 2
git apply $S/smoke-harness.patch || exit 3
for r in a b c; do
cargo test --test toyos-build -- wake_storm_smoke --nocapture > $S/fix-$r.log 2>&1
echo "fix $r EXIT=$?"
done
git apply -R $S/smoke-harness.patch
echo DONE
