#!/bin/bash
# #1223 round 4 (FutexWait owns the order), on main after #1256: kernel library tests with sched-check, the kernel's models and their
# controls (`--ci host models`), and clippy in the kernel's CI shapes. In one build slot.
S=<path>
L=$S/logs/futex-r4; mkdir -p $L; cd $S/wt || exit 1
echo "rev $(git rev-parse HEAD) dirty=$(git status --porcelain | wc -l)" > $L/exits.txt
A="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon -D warnings"
INSTR=debug-wait,sched-check,sched-tripwire,heap-tripwire,heap-sweep,pass-spin,stack-witness,switch-witness,switch-witness-mutate-frame,switch-witness-mutate-rsp,df-witness,df-witness-mutate,entry-df-unclean,mask-windows
run() { local name=$1; shift; "$@" > $L/$name.log 2>&1; local rc=$?; echo "$name exit=$rc $(date +%H:%M:%S)" >> $L/exits.txt; }
run kernel-lib cargo test -p kernel --lib --features sched-check
run models cargo run -- --ci host models
run clippy-host cargo clippy -p kernel --lib --tests --features sched-check -- $A
run clippy-x86 cargo clippy -p kernel --target x86_64-unknown-none -- $A
run clippy-x86-actuators cargo clippy -p kernel --target x86_64-unknown-none --features boot-actuators,test-actuators -- $A
run clippy-x86-instruments cargo clippy -p kernel --target x86_64-unknown-none --features $INSTR -- $A
run clippy-a64 cargo clippy -p kernel --target aarch64-unknown-none-softfloat -- $A
run clippy-a64-actuators cargo clippy -p kernel --target aarch64-unknown-none-softfloat --features boot-actuators,test-actuators -- $A
echo done >> $L/exits.txt
