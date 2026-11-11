#!/bin/bash
# Each variant's source hash next to its measurements, built fresh.
S=<scratch>
cd $S/wt || exit 9
one() {
  touch lib/bcachefs/src/engine/mount/data.rs
  echo "== $1 data.rs $(shasum lib/bcachefs/src/engine/mount/data.rs | cut -c1-12) control-lines $(grep -c CONTROL lib/bcachefs/src/engine/mount/data.rs)"
  cargo test --release --manifest-path lib/bcachefs/Cargo.toml -- --nocapture --test-threads 1 within_a_transaction 2>&1 | grep -E 'MEASURE|test result: |Compiling bcachefs'
}
one fix
git apply $S/mutations/per-piece-bucket-change.diff || exit 9
one per-piece
git apply -R $S/mutations/per-piece-bucket-change.diff || exit 9
one fix-again
