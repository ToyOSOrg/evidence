#!/bin/sh
# Scratch: storm-diag6 at the merged head twice; tree restored by the caller.
S=<home>/.claude/jobs/2280e09e/tmp/scratchpad/agents/874-r4/diag
cd <home>/Dev/jan/toyos-busywake || exit 2
for r in a b; do
cargo test --test toyos-build -- wake_storm_smoke --nocapture > $S/d6-head-$r.log 2>&1
echo "head $r EXIT=$?"
done
echo DONE
