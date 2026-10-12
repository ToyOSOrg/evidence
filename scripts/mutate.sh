#!/bin/sh
# Scratch: each mutation as a checked patch, built, run, reported with its exit
# code, and restored, in the detached mutation tree at the branch's head.
S=/private/tmp/claude-502/-Users-jan-Dev-jan-toyos/80e90c3a-7449-46b8-84cc-b59e9dd31ae9/scratchpad/busywake
T=/Users/jan/Dev/jan/toyos-busywake-sim
cd $T || exit 9
mkdir -p $S/mut
OUT=$S/mut/results.txt
echo "tree $(git rev-parse HEAD)" > $OUT

# make <name> <file> <from> <to>: write the mutation as a patch, never leave it applied.
make() {
  name=$1 file=$2 from=$3 to=$4
  python3 -I -c '
import sys
p, a, b = sys.argv[1], sys.argv[2], sys.argv[3]
s = open(p).read()
assert s.count(a) == 1, (p, a, s.count(a))
open(p, "w").write(s.replace(a, b))
' "$file" "$from" "$to" || { echo "$name: the mutation does not apply" >> $OUT; git checkout -q -- "$file"; return 1; }
  git diff > $S/mut/$name.patch
  git checkout -q -- "$file"
}

# run <name> <label> <cmd...>: apply the checked patch, run, report, restore.
run() {
  name=$1; label=$2; shift 2
  git apply --check $S/mut/$name.patch || { echo "$name: patch does not check" >> $OUT; return; }
  git apply $S/mut/$name.patch
  "$@" > $S/mut/$name.$label.log 2>&1
  code=$?
  git apply -R $S/mut/$name.patch
  if [ -n "$(git status --porcelain)" ]; then echo "$name: TREE NOT CLEAN" >> $OUT; fi
  if [ $code -eq 0 ]; then verdict=GREEN; else verdict=RED; fi
  echo "$name $label: EXIT=$code $verdict" >> $OUT
}

LIB="cargo test -p kernel --lib --features sched-check"
SIM="cargo test -p kernel-sim --test policy"

make strict-to-leq kernel/pure/sched/cpu.rs 'behind_fair.is_some_and(|held| queued < held)' 'behind_fair.is_some_and(|held| queued <= held)'
run strict-to-leq unit $LIB a_wake_that_ties_the_running_tasks_key_cuts_nothing
run strict-to-leq sim $SIM a_sibling_that_naps_does_not_preempt_the_one_that_spins

make dispatch-from-quantum-end kernel/pure/sched/cpu.rs 'let protected = self.dispatched_at.after(PROTECTED_RUN_NS);' 'let protected = Nanos(self.quantum_end.0.saturating_sub(QUANTUM_NS)).after(PROTECTED_RUN_NS);'
run dispatch-from-quantum-end unit $LIB a_second_owed_wake_does_not_cut_inside_the_protected_run

make no-fair-forward kernel/pure/sched/cpu.rs 'if behind_fair.is_some() || behind_rt {' 'if behind_rt {'
run no-fair-forward unit $LIB a_wake_to_a_busy_cpu_is_handed_to_an_idle_sibling
run no-fair-forward sim $SIM a_wake_to_a_busy_cpu_beside_an_idle_one_runs_within_two_hops

make no-cut kernel/pure/sched/cpu.rs 'if behind_fair.is_some_and(|held| queued < held) {' 'if behind_fair.is_some_and(|held| queued < held) && false {'
run no-cut unit $LIB a_wake_with_a_lower_key_cuts_the_running_quantum_to_the_protected_run
run no-cut sim $SIM a_wake_owed_the_cpu_waits_out_the_protected_run_and_no_more

make busy-target-unkicked kernel/pure/sched/mailbox.rs '                if prev & KICK_PENDING == 0 {' '                if prev & SLEEPING != 0 && prev & KICK_PENDING == 0 {'
run busy-target-unkicked unit $LIB doorbell_kick_policy
run busy-target-unkicked sim-owed $SIM a_wake_owed_the_cpu_waits_out_the_protected_run_and_no_more
run busy-target-unkicked sim-home $SIM a_wake_to_a_busy_cpu_beside_an_idle_one_runs_within_two_hops

make lone-task-not-surplus kernel/pure/sched/cpu.rs 'self.cpu.rq.fair_len() - usize::from(loaded_queued)' 'self.cpu.rq.fair_len().saturating_sub(1)'
run lone-task-not-surplus unit $LIB a_lone_queued_task_is_published_and_given_to_a_probe

make loaded-counted kernel/pure/sched/cpu.rs 'self.cpu.rq.fair_len() - usize::from(loaded_queued)' 'self.cpu.rq.fair_len() - usize::from(loaded_queued && false)'
run loaded-counted unit $LIB a_lone_queued_task_the_cpu_stands_on_is_not_surplus

make forward-onto-kicked kernel/pure/sched/cpu.rs '                && !env.cpus.get(cpu).doorbell().kick_pending()
' ''
run forward-onto-kicked unit $LIB a_burst_of_wakes_forwards_one_per_idle_sibling

make sim-no-self-route kernel/sim/src/hw_impl.rs 'if s.poster == Some(target) {' 'if false {'
run sim-no-self-route sim cargo test -p kernel-sim --test policy --test scenarios

make late-kicks-uncounted kernel/sim/src/hw_impl.rs 's.busy_kicks[t] += u32::from(!s.halted[t]);' ''
run late-kicks-uncounted sim $SIM the_two_cures_are_priced_against_the_pull_path

echo done >> $OUT
