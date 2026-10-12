#!/bin/sh
S=/Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/busywake-r2
$S/judge.sh head
$S/judge.sh base
echo done > $S/judge/both.done
