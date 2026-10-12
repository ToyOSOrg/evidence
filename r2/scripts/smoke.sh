#!/bin/sh
# Scratch: one judge tree's QEMU smokes. usage: smoke.sh <base|head>
S=/Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/busywake-r2
which=$1
cd /Users/jan/Dev/jan/toyos-busywake-judge-$which || exit 9
git rev-parse HEAD > $S/judge/$which-head.txt
cargo test --test toyos-build -- scout_smoke wake_onto_busy_smoke > $S/judge/$which-smoke.log 2>&1; echo "EXIT=$?" >> $S/judge/$which-smoke.log
echo done > $S/judge/$which-smoke.done
