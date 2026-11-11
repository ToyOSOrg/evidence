#!/bin/bash
# Targeted host checks for the switch branch. Each step: its own log, its exit code recorded.
WT=<path>
L=<path>
export CARGO_TARGET_DIR=<path>
cd "$WT" || exit 9
echo "rev=$(git rev-parse HEAD) dirty=$(git status --porcelain | wc -l)" > "$L/rev.txt"
ADOPTED="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon"
INSTR="debug-wait,sched-check,sched-tripwire,heap-tripwire,heap-sweep,pass-spin,stack-witness,switch-witness,switch-witness-mutate-frame,switch-witness-mutate-rsp,df-witness,df-witness-mutate,entry-df-unclean,mask-windows"
A64INSTR="debug-wait,sched-check,sched-tripwire,heap-tripwire,heap-sweep,pass-spin,stack-witness,switch-witness,switch-witness-mutate-frame,switch-witness-mutate-rsp,mask-windows"
run() { local name=$1; shift; "$@" > "$L/$name.log" 2>&1; local rc=$?; echo "$name rc=$rc :: $*" >> "$L/summary.txt"; }
: > "$L/summary.txt"
run clippy-x86 cargo clippy -p kernel --target x86_64-unknown-none -- $ADOPTED -D warnings
run clippy-x86-actuators cargo clippy -p kernel --target x86_64-unknown-none --features boot-actuators,test-actuators -- $ADOPTED -D warnings
run clippy-x86-boot cargo clippy -p kernel --target x86_64-unknown-none --features boot-actuators -- $ADOPTED -D warnings
run clippy-x86-instr cargo clippy -p kernel --target x86_64-unknown-none --features $INSTR -- $ADOPTED -D warnings
run clippy-a64 cargo clippy -p kernel --target aarch64-unknown-none-softfloat -- $ADOPTED -D warnings
run clippy-a64-actuators cargo clippy -p kernel --target aarch64-unknown-none-softfloat --features boot-actuators,test-actuators -- $ADOPTED -D warnings
run clippy-a64-boot cargo clippy -p kernel --target aarch64-unknown-none-softfloat --features boot-actuators -- $ADOPTED -D warnings
run clippy-a64-instr cargo clippy -p kernel --target aarch64-unknown-none-softfloat --features $A64INSTR -- $ADOPTED -D warnings
run clippy-lib cargo clippy -p kernel --lib --tests --features sched-check -- $ADOPTED -D warnings
run clippy-lib-controls cargo clippy -p kernel --lib --tests --features sched-check,protocol-port --features kernel/counting-allocator,kernel/iova-past-four-gib,kernel/sched-tripwire -- $ADOPTED -D warnings
run clippy-loom cargo clippy -p kernel-loom --all-targets -- $ADOPTED -D warnings
run clippy-loom-controls cargo clippy -p kernel-loom --all-targets --features tlb-tags-enter-relaxed,tlb-tags-resume-relaxed -- $ADOPTED -D warnings
run test-sched cargo test -p kernel --lib sched::
run loom-tlb-tags cargo test --manifest-path kernel/loom/Cargo.toml --test tlb_tags
run loom-tlb-tags-resume-relaxed cargo test --manifest-path kernel/loom/Cargo.toml --features tlb-tags-resume-relaxed --test tlb_tags
run loom-tlb-tags-enter-relaxed cargo test --manifest-path kernel/loom/Cargo.toml --features tlb-tags-enter-relaxed --test tlb_tags
echo done >> "$L/summary.txt"
