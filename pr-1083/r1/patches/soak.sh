#!/bin/zsh
# soak.sh <label> <bin> <first> <last>: runs the test alone once per index,
# logging each run's output and exit code.
label=$1 bin=$2 first=$3 last=$4
S=<home>/.claude/jobs/2280e09e/tmp/scratchpad/agents/socket-wake
mkdir -p $S/soak
cd <dev>/toyos-socket-wake
for i in $(seq $first $last); do
  $bin netstack_holders_exported_to_children --nocapture > $S/soak/$label-$i.log 2>&1
  echo "exit $?" >> $S/soak/$label-$i.log
done
