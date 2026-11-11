#!/bin/bash
# Round-2 re-verification after the rebase onto #1218 and #1211: the
# touched crates' tests, the loom models and control, and clippy on the touched
# packages in CI's shapes. Each step's log ends with its exit code.
cd <path> || exit 1
L=<path>
mkdir -p "$L"
: > "$L/summary.txt"
rev=$(git rev-parse HEAD)
echo "rev $rev" >> "$L/summary.txt"
run() {
  name=$1; shift
  { echo "== $name"; echo "rev $rev"; echo "cmd: $*"; date; } > "$L/$name.log"
  "$@" >> "$L/$name.log" 2>&1
  ec=$?
  { date; echo "exit=$ec"; } >> "$L/$name.log"
  echo "$name exit=$ec" >> "$L/summary.txt"
}
A=(-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint
   -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon
   -D warnings)

run build-system cargo test --lib
run kernel-sched cargo test -p kernel --lib --features sched-check sched::
run loom cargo test -p kernel-loom --test loom_sleep
run control-doorbell cargo test -p kernel-loom --features doorbell-kick-relaxed --test loom_sleep -- --exact a_pass_that_answers_a_demand_reads_what_its_demander_wrote
run sim cargo test -p kernel-sim

run clippy-kernel-lib cargo clippy -p kernel --lib --tests --features sched-check -- "${A[@]}"
run clippy-kernel-lib-controls cargo clippy -p kernel --lib --tests --features sched-check,protocol-port --features kernel/counting-allocator,kernel/iova-past-four-gib,kernel/sched-tripwire -- "${A[@]}"
X86_INSTR=debug-wait,sched-check,sched-tripwire,heap-tripwire,heap-sweep,pass-spin,stack-witness,switch-witness,switch-witness-mutate-frame,switch-witness-mutate-rsp,df-witness,df-witness-mutate,entry-df-unclean,mask-windows
ARM_INSTR=debug-wait,sched-check,sched-tripwire,heap-tripwire,heap-sweep,pass-spin,stack-witness,switch-witness,switch-witness-mutate-frame,switch-witness-mutate-rsp,mask-windows
for t in x86_64-unknown-none aarch64-unknown-none-softfloat; do
  instr=$X86_INSTR; [ "$t" = aarch64-unknown-none-softfloat ] && instr=$ARM_INSTR
  run "clippy-kernel-$t" cargo clippy -p kernel --target "$t" -- "${A[@]}"
  run "clippy-kernel-$t-actuators" cargo clippy -p kernel --target "$t" --features boot-actuators,test-actuators -- "${A[@]}"
  run "clippy-kernel-$t-boot-actuators" cargo clippy -p kernel --target "$t" --features boot-actuators -- "${A[@]}"
  run "clippy-kernel-$t-instruments" cargo clippy -p kernel --target "$t" --features "$instr" -- "${A[@]}"
done
echo done >> "$L/summary.txt"
