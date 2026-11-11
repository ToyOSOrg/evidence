#!/bin/bash
# Step one's targeted checks, each logged with its exit code; continues past failures.
D=<scratch>; cd $D/wt-step1 || exit 2
L=$D/logs/step1; mkdir -p $L; git rev-parse HEAD > $L/revision.txt; git diff --stat > $L/diffstat.txt
A="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon -D warnings"
run() { local name=$1; shift; echo "== $*" > $L/$name.log; "$@" >> $L/$name.log 2>&1; echo "rc=$?" >> $L/$name.log; echo "$name $(tail -1 $L/$name.log)" >> $L/summary.txt; }
: > $L/summary.txt
run kernel-pure cargo test -p kernel --lib paged::
run engine-data cargo test -p bcachefs --lib tests::data::
run sdk-fs cargo test -p toyos --lib fs::
run sdk-files cargo test -p toyos --lib files::
run abi cargo test -p toyos-abi
run fileserver cargo test --manifest-path system/fileserver/Cargo.toml
run clippy-kernel-host cargo clippy -p kernel --lib --tests --features sched-check -- $A
run clippy-kernel-x86 cargo clippy -p kernel --target x86_64-unknown-none -- $A
run clippy-kernel-arm cargo clippy -p kernel --target aarch64-unknown-none-softfloat -- $A
run clippy-sdk cargo clippy -p toyos --all-targets -- $A
run clippy-sdk-fd cargo clippy -p toyos --lib --features fd-table -- $A
run clippy-engine cargo clippy -p bcachefs --all-targets -- $A
run clippy-abi cargo clippy -p toyos-abi --all-targets --keep-going --target-dir target/clippy-abi -- -W clippy::undocumented_unsafe_blocks -D warnings
