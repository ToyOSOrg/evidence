#!/bin/bash
# Review r1 of #1239: compile checks of the type-level fix, host and guest.
H=<path>
L=$H/logs/a2-checks
mkdir -p "$L"
cd $H/wt-a2 || exit 1
ADOPTED="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon"
echo "revision $(git rev-parse HEAD); tree clean: $(git status --porcelain | wc -l | tr -d ' ') changes" > "$L/summary.txt"
run() { name=$1; shift; echo "\$ $*" > "$L/$name.log"; "$@" >> "$L/$name.log" 2>&1; code=$?; echo "exit $code" >> "$L/$name.log"; echo "$name: exit $code ($*)" >> "$L/summary.txt"; }
export CARGO_TARGET_DIR=$H/target-host
run sdk-ipc cargo test -p toyos --lib ipc::
run clippy-sdk cargo clippy -p toyos --all-targets -- $ADOPTED -D warnings
run clippy-sdk-fdtable cargo clippy -p toyos --lib --features fd-table -- $ADOPTED -D warnings
run clippy-abi cargo clippy -p toyos-abi --all-targets --keep-going --target-dir $H/target-host/clippy-abi -- -W clippy::undocumented_unsafe_blocks -D warnings
unset CARGO_TARGET_DIR
# The guest side compiles here: std, libc, every program and every guest binary.
run guest-compile cargo test --test toyos-build -- --metal --metal-readback $H/compile-a2 served_file_offset
cat "$L/summary.txt"
