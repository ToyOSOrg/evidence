#!/bin/bash
# Round 8 (b) of #1258: the B1 control, then every kernel library test, the kernel's three clippy shapes, the SDK's
# and ABI's checks, and the testcases image (its sysroot builds libc's and std's mappings).
D=<scratch>; cd $D/wt-step1 || exit 2
L=$D/logs/$1; mkdir -p $L; { git rev-parse HEAD; git status --porcelain --ignore-submodules=none; } > $L/tree.txt
A="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon -D warnings"
run() { local name=$1; shift; echo "== $*" > $L/$name.log; "$@" >> $L/$name.log 2>&1; echo "rc=$?" >> $L/$name.log; echo "$name $(tail -1 $L/$name.log)" >> $L/summary.txt; }
# B1 control: a removal that unmarks only list 0 must fail the test; it must build.
git apply --check $D/r8b/one-list.patch && git apply $D/r8b/one-list.patch && git diff > $L/control-one-list.diff
run control-one-list-build cargo test -p kernel --lib --no-run
run control-one-list cargo test -p kernel --lib slots::
git apply -R $D/r8b/one-list.patch; git diff --quiet || { echo "control not restored" >> $L/summary.txt; exit 3; }
run kernel cargo test -p kernel --lib --features sched-check
run clippy-kernel-host cargo clippy -p kernel --lib --tests --features sched-check -- $A
run clippy-kernel-x86 cargo clippy -p kernel --target x86_64-unknown-none -- $A
run clippy-kernel-arm cargo clippy -p kernel --target aarch64-unknown-none-softfloat -- $A
run sdk cargo test -p toyos --lib
run clippy-sdk cargo clippy -p toyos --all-targets -- $A
run clippy-sdk-fd cargo clippy -p toyos --lib --features fd-table -- $A
run abi cargo test -p toyos-abi
run clippy-abi cargo clippy -p toyos-abi --all-targets --keep-going --target-dir target/clippy-abi -- -W clippy::undocumented_unsafe_blocks -D warnings
run build-testcases cargo run -- --build-only --boot-config tests/images/testcases.toml
git status --porcelain --ignore-submodules=none >> $L/tree.txt
