#!/bin/bash
# Count runs of `kernel-sim run interactive_mix:1:4 <seed>` (seeds 0..399) whose sleeper (TaskKey(1)) waited over 2.25 ms
# on two or more woken wakes: the runner-up breach `an_interactive_wake_waits_out_at_most_one_request` asserts against.
bin=$1; bad=""
for seed in $(seq 0 399); do
  n=$(SIMDBG=1 $bin run interactive_mix:1:4 $seed 2>&1 >/dev/null | grep "DBG long wait TaskKey(1) Woken" | wc -l)
  [ "$n" -ge 2 ] && bad="$bad $seed"
done
echo "$(echo $bad | wc -w | tr -d ' ') of 400 runs breach:$bad"
