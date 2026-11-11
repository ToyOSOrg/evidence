#!/bin/bash
# PR #1216 r3 negative controls, each built fresh with its source hash beside its result.
# Expects measure-prints and diag-txn-prints applied; reverts both at the end.
S=<scratch>
M=$S/mutations
cd $S/wt || exit 9
f=lib/bcachefs/src/engine/mount/data.rs
control() { # control <patch> <filters...>
  local patch=$1; shift
  git apply --check "$M/$patch.diff" || { echo "$patch does not apply"; exit 9; }
  git apply "$M/$patch.diff"; touch $f
  echo "== $patch: data.rs $(shasum $f | cut -c1-12)"
  cargo test --release --manifest-path lib/bcachefs/Cargo.toml -- "$@" > "$S/logs/control2-$patch.log" 2>&1
  echo "exit $?" | tee -a "$S/logs/control2-$patch.log"
  grep -E '^test .*(FAILED|ok)$|test result: [A-Z]' "$S/logs/control2-$patch.log" | head -6
  grep -A3 'panicked at' "$S/logs/control2-$patch.log" | grep -v '^--' | cut -c1-220 | head -9
  git apply -R "$M/$patch.diff" || { echo "$patch does not revert"; exit 9; }
}
control grouping-off reserved_write_cut within_a_transaction
control refill-keeps-sectors refilled
git apply -R "$M/measure-prints.diff" && git apply -R "$M/diag-txn-prints.diff" || { echo "prints do not revert"; exit 9; }
echo "after: data.rs $(shasum $f | cut -c1-12), tests/data.rs $(shasum lib/bcachefs/src/engine/tests/data.rs | cut -c1-12), mod.rs $(shasum lib/bcachefs/src/engine/mount/mod.rs | cut -c1-12)"
