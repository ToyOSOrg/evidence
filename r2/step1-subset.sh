#!/bin/bash
# A subset of step1-checks-r.sh: $1 = log dir name, then step names to run.
D=<scratch>; cd $D/wt-step1 || exit 2
L=$D/logs/$1; shift; mkdir -p $L; { git rev-parse HEAD; git diff --stat; } > $L/tree.txt
A="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon -D warnings"
run() { local name=$1; shift; echo "== $*" > $L/$name.log; "$@" >> $L/$name.log 2>&1; echo "rc=$?" >> $L/$name.log; echo "$name $(tail -1 $L/$name.log)" >> $L/summary.txt; }
for step in "$@"; do case $step in
  kernel-pure) run kernel-pure cargo test -p kernel --lib paged:: ;;
  fileserver) run fileserver cargo test --manifest-path system/fileserver/Cargo.toml ;;
  clippy-fileserver) run clippy-fileserver cargo clippy --manifest-path system/fileserver/Cargo.toml --all-targets -- $A ;;
  clippy-kernel-host) run clippy-kernel-host cargo clippy -p kernel --lib --tests --features sched-check -- $A ;;
  clippy-kernel-x86) run clippy-kernel-x86 cargo clippy -p kernel --target x86_64-unknown-none -- $A ;;
  clippy-kernel-arm) run clippy-kernel-arm cargo clippy -p kernel --target aarch64-unknown-none-softfloat -- $A ;;
  sdk) run sdk-fs cargo test -p toyos --lib fs:: ; run sdk-files cargo test -p toyos --lib files:: ;;
  clippy-sdk) run clippy-sdk cargo clippy -p toyos --all-targets -- $A; run clippy-sdk-fd cargo clippy -p toyos --lib --features fd-table -- $A ;;
  abi) run abi cargo test -p toyos-abi; run clippy-abi cargo clippy -p toyos-abi --all-targets --keep-going --target-dir target/clippy-abi -- -W clippy::undocumented_unsafe_blocks -D warnings ;;
  engine) run engine-data cargo test -p bcachefs --lib tests::data::; run clippy-engine cargo clippy -p bcachefs --all-targets -- $A ;;
esac; done
