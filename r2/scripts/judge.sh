#!/bin/sh
# Scratch: one judge tree's QEMU smokes, then its T14 images. usage: judge.sh <base|head>
S=/Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/busywake-r2
$S/smoke.sh $1
$S/stage.sh $1
