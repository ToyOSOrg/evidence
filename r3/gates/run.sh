#!/bin/sh
# PR #874 round 3: the mutations, the simulator, loom, then the gates and the
# row's guest smoke, each with its own exit code, at one committed head.
S=<home>/.claude/jobs/2280e09e/tmp/scratchpad/busywake-r3
G=$S/gates
cd <home>/Dev/jan/toyos-busywake || exit 9
HEAD=$(git rev-parse HEAD)
echo "head $HEAD" > $G/head.txt
[ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "tree not clean" >> $G/head.txt; exit 8; }
OUT=$G/mut/results.txt
echo "tree $HEAD" > $OUT

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
  git diff > $G/mut/$name.patch
  git checkout -q -- "$file"
}

# run <name> <label> <cmd...>: apply the checked patch, run, report, restore.
run() {
  name=$1; label=$2; shift 2
  git apply --check $G/mut/$name.patch || { echo "$name: patch does not check" >> $OUT; return; }
  git apply $G/mut/$name.patch
  "$@" > $G/mut/$name.$label.log 2>&1
  code=$?
  git apply -R $G/mut/$name.patch
  if [ -n "$(git status --porcelain)" ]; then echo "$name: TREE NOT CLEAN" >> $OUT; fi
  if [ $code -eq 0 ]; then verdict=GREEN; else verdict=RED; fi
  echo "$name $label: EXIT=$code $verdict" >> $OUT
}

LIB="cargo test -p kernel --lib --features sched-check"
SIM="cargo test -p kernel-sim --test policy"
TOPO="cargo test -p kernel-sim --test topology"

# This round's two.
make surplus-stealable kernel/pure/sched/cpu.rs 'let surplus = self.cpu.rq.fair_len() as u32;' 'let surplus = self.stealable() as u32;'
run surplus-stealable policy $SIM
run surplus-stealable topology $TOPO
make probe-not-kept kernel/pure/sched/cpu.rs '                if self.cpu.rq.fair_len() > 0 {' '                if self.cpu.rq.fair_len() > 0 && false {'
run probe-not-kept unit $LIB a_probe_for_the_task_the_cpu_stands_on_is_answered_a_pass_later
run probe-not-kept policy $SIM a_bounded_re_arm_reaches_every_cpu_the_pull_path_left_asleep

# The earlier rounds' mutations, again at this head.
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
run loaded-counted unit $LIB a_probe_for_the_task_the_cpu_stands_on_is_answered_a_pass_later
make forward-onto-kicked kernel/pure/sched/cpu.rs '                && !env.cpus.get(cpu).doorbell().kick_pending()
' ''
run forward-onto-kicked unit $LIB a_burst_of_wakes_forwards_one_per_idle_sibling
make sim-no-self-route kernel/sim/src/hw_impl.rs 'if s.poster == Some(target) {' 'if false {'
run sim-no-self-route sim cargo test -p kernel-sim --test policy --test scenarios
make late-kicks-uncounted kernel/sim/src/hw_impl.rs 's.busy_kicks[t] += u32::from(!s.halted[t]);' ''
run late-kicks-uncounted sim $SIM the_two_cures_are_priced_against_the_pull_path
echo done >> $OUT

cargo test -p kernel-sim --no-fail-fast > $G/sim.log 2>&1; echo "EXIT=$?" >> $G/sim.log
cargo test -p kernel-sim --test policy -- --nocapture --test-threads 1 > $G/sim-policy.log 2>&1; echo "EXIT=$?" >> $G/sim-policy.log
cargo test -p kernel-sim --test topology -- --nocapture > $G/sim-topology.log 2>&1; echo "EXIT=$?" >> $G/sim-topology.log
cargo test -p kernel-loom --test loom_sleep --test loom_push --test loom_mailbox > $G/loom.log 2>&1; echo "EXIT=$?" >> $G/loom.log
cargo test -p kernel-loom --features doorbell-kick-relaxed --test loom_sleep > $G/loom-doorbell-kick-relaxed.log 2>&1; echo "EXIT=$?" >> $G/loom-doorbell-kick-relaxed.log
cargo build --release -p kernel-sim --bin kernel-sim > $G/sim-gate-build.log 2>&1
./target/release/kernel-sim gate 10000 > $G/sim-gate.log 2>&1; echo "EXIT=$?" >> $G/sim-gate.log
echo "sim and loom done" > $G/stage1.done

cargo run -- --build-only > $G/build-only.log 2>&1; echo "EXIT=$?" >> $G/build-only.log
cargo run -- --ci host > $G/ci-host.log 2>&1; echo "EXIT=$?" >> $G/ci-host.log
cargo test > $G/guest.log 2>&1; echo "EXIT=$?" >> $G/guest.log
[ -z "$(git status --porcelain --ignore-submodules=none)" ] || echo "tree not clean after the gates" >> $G/head.txt

# The row on a 4-vCPU guest at this head, and with the kick reverted.
git apply $S/smoke/smoke-harness.patch || exit 3
cargo test --test toyos-build -- wake_onto_busy_smoke --nocapture > $G/row-smoke-head.log 2>&1; echo "EXIT=$?" >> $G/row-smoke-head.log
git apply $S/revert-row/busy-target-unkicked.patch || exit 4
cargo test --test toyos-build -- wake_onto_busy_smoke --nocapture > $G/row-smoke-reverted.log 2>&1; echo "EXIT=$?" >> $G/row-smoke-reverted.log
git checkout -- tests/toyos.rs kernel/pure/sched/mailbox.rs
git status --porcelain --ignore-submodules=none > $G/final-status.txt
echo done > $G/all.done
