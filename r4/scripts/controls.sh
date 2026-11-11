#!/bin/bash
# PR #1216 r3: footprint measurements on the fix, then each negative control applied, run and reverted.
# Starts with mutations/measure-prints.diff applied to the working tree (prints only), ends with it reverted.
S=<scratch>
M=$S/mutations
L=$S/logs
cd $S/wt || exit 9
run() { # run <log> <filters...>
  local log=$1; shift
  cargo test --release --manifest-path lib/bcachefs/Cargo.toml -- --nocapture "$@" > "$L/$log" 2>&1
  echo "exit $?" >> "$L/$log"
  echo "$log: $(tail -1 "$L/$log"); $(grep -h 'test result' "$L/$log" | head -1)"
}
control() { # control <patch> <log> <filters...>
  local patch=$1 log=$2; shift 2
  git apply --check "$M/$patch.diff" || { echo "$patch does not apply"; exit 9; }
  git apply "$M/$patch.diff"
  run "$log" "$@"
  git apply -R "$M/$patch.diff" || { echo "$patch does not revert"; exit 9; }
}
run measure-fix.log stay_within
control per-piece-bucket-change control-per-piece-bucket-change.log stay_within
control grouping-off control-grouping-off.log reserved_write_cut stay_within
control refill-keeps-sectors control-refill-keeps-sectors.log refilled
git apply -R "$M/measure-prints.diff" || { echo "prints do not revert"; exit 9; }
shasum lib/bcachefs/src/engine/mount/data.rs lib/bcachefs/src/engine/tests/data.rs
echo done
