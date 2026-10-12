#!/bin/sh
# Stage the T14's images for #874 round 3; touches no machine.
S=<home>/.claude/jobs/2280e09e/tmp/scratchpad/busywake-r3
cd <home>/Dev/jan/toyos-busywake-judge-base || exit 2
echo "control $(git rev-parse HEAD) $(git status --porcelain --ignore-submodules=none | wc -l | tr -d ' ') changes"
cargo test --test toyos-build -- --metal --metal-readback $S/metal/t14-control wake_onto_busy > $S/metal/stage-control.log 2>&1; echo "control stage EXIT=$?"
cd <home>/Dev/jan/toyos-busywake || exit 2
echo "head $(git rev-parse HEAD) $(git status --porcelain --ignore-submodules=none | wc -l | tr -d ' ') changes"
cargo test --test toyos-build -- --metal --metal-readback $S/metal/t14-head > $S/metal/stage-head.log 2>&1; echo "head stage EXIT=$?"
echo DONE
