#!/bin/sh
# Measurement only: PR #863's two-sleeper model, each case with its own exit code.
S=$1
cd "$S" || exit 1
echo "toyos-transport from ToyOSOrg/ToyOS 7ea0ff9d6 (PR #878 head), loom 0.7.2, $(rustc --version)"
for t in one_bell_for_both_room_rung_first one_bell_for_both_data_rung_first one_bell_per_direction_room_rung_first one_bell_per_direction_data_rung_first; do
  echo "=== $t"
  CARGO_TARGET_DIR="$S/target" cargo test --offline --release --test two_sleepers -- --exact "$t" 2>&1
  echo "=== $t EXIT=$?"
done
for t in one_bell_per_direction_room_rung_first one_bell_per_direction_data_rung_first; do
  echo "=== want-relaxed $t"
  CARGO_TARGET_DIR="$S/target-relaxed" cargo test --offline --release --features toyos-transport/want-relaxed --test two_sleepers -- --exact "$t" 2>&1
  echo "=== want-relaxed $t EXIT=$?"
done
