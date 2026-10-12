#!/bin/sh
# Measurement only: PR #863's amendment B model, each case with its own exit code.
# The model's directory is masked as <dir> and the home directory as ~.
S=$1
cd "$S" || exit 1
echo "toyos-transport from ToyOSOrg/ToyOS 7ea0ff9d6 (PR #878 head), loom 0.7.2, $(rustc --version), preemption bound $(sed -n 's/^const PREEMPTIONS: usize = \(.*\);/\1/p' tests/same_direction.rs)"
mask() { sed -e "s|$S|<dir>|g" -e "s|$HOME|~|g" "$1"; }
for rule in as_written pass_on no_pass; do
  for t in bytes_left end_left room_left; do
    echo "=== ${rule}_$t"
    CARGO_TARGET_DIR="$S/target" cargo test --offline --release --test same_direction -- --exact "${rule}_$t" > "$S/case.out" 2>&1
    e=$?
    mask "$S/case.out"
    echo "=== ${rule}_$t EXIT=$e"
  done
done
for t in bytes_left end_left room_left; do
  echo "=== want-relaxed pass_on_$t"
  CARGO_TARGET_DIR="$S/target-relaxed" cargo test --offline --release --features want-relaxed --test same_direction -- --exact "pass_on_$t" > "$S/case.out" 2>&1
  e=$?
  mask "$S/case.out"
  echo "=== want-relaxed pass_on_$t EXIT=$e"
done
for t in bytes_left end_left room_left; do
  echo "=== ungated as_written_$t"
  CARGO_TARGET_DIR="$S/target-ungated" cargo test --offline --release --features ungated --test same_direction -- --exact "as_written_$t" > "$S/case.out" 2>&1
  e=$?
  mask "$S/case.out"
  echo "=== ungated as_written_$t EXIT=$e"
done
rm -f "$S/case.out"
