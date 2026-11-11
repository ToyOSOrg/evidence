#!/bin/bash
# The four x86 kernel clippy shapes of build/clippy.rs, each logged with its exit code.
SW=<path>
L=$SW/logs/r4; mkdir -p "$L"; cd "$SW/wt" || exit 9
export CARGO_TARGET_DIR=$SW/check-target CARGO_BUILD_JOBS=4
A=(-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon -D warnings)
INSTR=debug-wait,sched-check,sched-tripwire,heap-tripwire,heap-sweep,pass-spin,stack-witness,switch-witness,switch-witness-mutate-frame,switch-witness-mutate-rsp,df-witness,df-witness-mutate,entry-df-unclean,mask-windows
echo "rev=$(git rev-parse HEAD) dirty=$(git status --porcelain | wc -l)" > "$L/rev.txt"
: > "$L/summary.txt"
run() { local name=$1; shift; cargo clippy -p kernel --target x86_64-unknown-none "$@" -- "${A[@]}" > "$L/$name.log" 2>&1; echo "$name rc=$? :: cargo clippy -p kernel --target x86_64-unknown-none $* -- <adopted lints> -D warnings" >> "$L/summary.txt"; }
run clippy-x86
run clippy-x86-actuators --features boot-actuators,test-actuators
run clippy-x86-boot --features boot-actuators
run clippy-x86-instr --features "$INSTR"
