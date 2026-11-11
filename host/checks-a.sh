#!/bin/bash
# PR A's targeted host checks: each command's own log and exit code.
H=<path>
WT=$H/wt
L=$H/logs/a-checks
mkdir -p "$L"
cd "$WT" || exit 1
export CARGO_TARGET_DIR=$H/target-host
ADOPTED="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon"
echo "revision $(git rev-parse HEAD) plus the uncommitted tree; diff sha $(git diff HEAD | shasum -a 256 | cut -c1-16)" > "$L/summary.txt"
run() {
  name=$1; shift
  echo "\$ $*" > "$L/$name.log"
  "$@" >> "$L/$name.log" 2>&1
  code=$?
  echo "exit $code" >> "$L/$name.log"
  echo "$name: exit $code ($*)" >> "$L/summary.txt"
}
run test-host-libs cargo test -p toyos-abi -p toyos-blockserve -p toyos-link -p toyos-session
run test-guest-libs cargo test -p toyos -p logkeeper-api
for p in system/diskserver system/hda system/logkeeper system/netstack system/session system/sshserver system/supervisor tests/guest/osbench; do
  run "test-$(basename $p)" cargo test --manifest-path $p/Cargo.toml
done
run clippy-host-libs cargo clippy -p toyos-abi -p toyos-blockserve -p toyos-link -p toyos-session --all-targets -- $ADOPTED -D warnings
run clippy-sdk cargo clippy -p toyos --all-targets -- $ADOPTED -D warnings
run clippy-sdk-fdtable cargo clippy -p toyos --lib --features fd-table -- $ADOPTED -D warnings
run clippy-abi cargo clippy -p toyos-abi --all-targets --keep-going --target-dir $H/target-host/clippy-abi -- -W clippy::undocumented_unsafe_blocks -D warnings
run clippy-kernel-x86 cargo clippy -p kernel --target x86_64-unknown-none -- $ADOPTED -D warnings
run clippy-kernel-x86-actuators cargo clippy -p kernel --target x86_64-unknown-none --features boot-actuators,test-actuators -- $ADOPTED -D warnings
cat "$L/summary.txt"
