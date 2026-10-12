#!/bin/sh
# Scratch: stage one judge tree's T14 images. usage: stage.sh <base|head>
S=/Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/busywake-r2
which=$1
cd /Users/jan/Dev/jan/toyos-busywake-judge-$which || exit 9
git rev-parse HEAD > $S/judge/$which-stage-head.txt
git status --porcelain >> $S/judge/$which-stage-head.txt
mkdir -p $S/metal/t14-$which
cargo test --test toyos-build -- --metal --metal-readback $S/metal/t14-$which scout_wake wake_onto_busy > $S/judge/$which-stage.log 2>&1; echo "EXIT=$?" >> $S/judge/$which-stage.log
echo done > $S/judge/$which-stage.done
