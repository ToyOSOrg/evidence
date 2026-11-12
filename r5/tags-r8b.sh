#!/bin/bash
# #1272 rebased onto #1258's round-8 head: the SDK's tests and clippy, the flight core's loom models, and the testcases
# image (its sysroot builds libc's and std's mappings, which both branches change).
D=<scratch>; cd $D/wt-tags || exit 2
L=$D/logs/$1; mkdir -p $L; { git rev-parse HEAD; git status --porcelain --ignore-submodules=none; } > $L/tree.txt
A="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon -D warnings"
run() { local name=$1; shift; echo "== $*" > $L/$name.log; "$@" >> $L/$name.log 2>&1; echo "rc=$?" >> $L/$name.log; echo "$name $(tail -1 $L/$name.log)" >> $L/summary.txt; }
run sdk cargo test -p toyos --lib
run clippy-sdk cargo clippy -p toyos --all-targets -- $A
run clippy-sdk-fd cargo clippy -p toyos --lib --features fd-table -- $A
run loom-flight cargo test --manifest-path kernel/loom/Cargo.toml --test fs_flight
run fileserver cargo test --manifest-path system/fileserver/Cargo.toml
run build-testcases cargo run -- --build-only --boot-config tests/images/testcases.toml
