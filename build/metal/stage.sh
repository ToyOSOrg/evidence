#!/bin/sh
# Stages the base and head testcases boots for the T14 and the AMD bench.
# Touches no machine: `--metal-readback` writes each <dir>/request.txt.
M=<home>/.claude/jobs/2280e09e/tmp/scratchpad/agents/cpufacts/metal
T14_ROWS="control_regs counters syscall_cost spawn_cost wake_storm_cost wake_onto_busy timer_calibration smp_roster_and_tsc_trail"
AMD_ROWS="control_regs syscall_cost spawn_cost wake_storm_cost wake_onto_busy timer_calibration"
for arm in head:<home>/Dev/jan/toyos-cpufacts base:<home>/Dev/jan/toyos-cpufacts-base; do
  name=${arm%%:*}; tree=${arm#*:}
  cd $tree || exit 1
  echo "=== $name $(git rev-parse HEAD) clean=$(git status --porcelain | wc -l | tr -d ' ')"
  cargo test --test toyos-build -- --metal --metal-readback $M/$name-t14 $T14_ROWS > $M/stage-$name-t14.log 2>&1
  echo "$name-t14 exit $?"
  cargo test --test toyos-build -- --metal --metal-readback $M/$name-amd --metal-host '<user>@<amd-bench>' $AMD_ROWS > $M/stage-$name-amd.log 2>&1
  echo "$name-amd exit $?"
done
uptime
