#!/bin/sh
# Stage #874 round 4's metal images from the pushed trees; touches no machine.
S=<home>/.claude/jobs/2280e09e/tmp/scratchpad/agents/874-r4/metal
cd <home>/Dev/jan/toyos-busywake-judge-base || exit 2
echo "control $(git rev-parse HEAD) $(git status --porcelain --ignore-submodules=none | wc -l | tr -d ' ') changes"
cargo test --test toyos-build -- --metal --metal-readback $S/control wake_storm_cost > $S/stage-control.log 2>&1; echo "control stage EXIT=$?"
cd <home>/Dev/jan/toyos-busywake || exit 2
echo "head $(git rev-parse HEAD) $(git status --porcelain --ignore-submodules=none | wc -l | tr -d ' ') changes"
cargo test --test toyos-build -- --metal --metal-readback $S/head > $S/stage-head.log 2>&1; echo "head stage EXIT=$?"
echo DONE
