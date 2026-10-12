#!/bin/sh
# Scratch: the judge trees one at a time, then the branch's gates.
S=/Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/busywake-r2
$S/judge.sh head
$S/judge.sh base
echo done > $S/judge/both.done
rm -f $S/gates/done
$S/gates.sh
