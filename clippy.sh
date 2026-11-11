#!/bin/bash
# Clippy, as build/clippy.rs's shapes run it, on the shapes that build touched code. $1: run tag.
S=<scratch>
T=$1
cd <worktree> || exit 1
L=$S/clippy-$T
mkdir -p $L
git rev-parse HEAD > $L/rev
A="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon"
run() { local name=$1; shift; { echo "\$ $*"; "$@"; echo "exit $?"; } > $L/$name.log 2>&1; tail -1 $L/$name.log | sed "s/^/$name: /"; }
run kernel-host cargo clippy -p kernel --lib --tests --features sched-check -- $A -D warnings
run kernel-x86 cargo clippy -p kernel --target x86_64-unknown-none -- $A -D warnings
run kernel-x86-actuators cargo clippy -p kernel --target x86_64-unknown-none --features boot-actuators,test-actuators -- $A -D warnings
run kernel-aarch64 cargo clippy -p kernel --target aarch64-unknown-none-softfloat -- $A -D warnings
run sdk cargo clippy -p toyos --all-targets -- $A -D warnings
run sdk-fdtable cargo clippy -p toyos --lib --features fd-table -- $A -D warnings
run libs cargo clippy -p toyos-manifest -p toyos-session -p toyos-swap --all-targets --keep-going -- $A -D warnings
run abi cargo clippy -p toyos-abi --all-targets --keep-going --target-dir target/clippy-abi -- -W clippy::undocumented_unsafe_blocks -D warnings
