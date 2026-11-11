#!/bin/bash
S=<scratch>
cd $S/wt || exit 9
DIAG_TXN=1 cargo test --release --manifest-path lib/bcachefs/Cargo.toml -- --nocapture --test-threads 1 within_a_transaction > $S/logs/diag-fix.log 2>&1; echo "exit $?" >> $S/logs/diag-fix.log
git apply $S/mutations/per-piece-bucket-change.diff || exit 9
DIAG_TXN=1 cargo test --release --manifest-path lib/bcachefs/Cargo.toml -- --nocapture --test-threads 1 within_a_transaction > $S/logs/diag-per-piece.log 2>&1; echo "exit $?" >> $S/logs/diag-per-piece.log
git apply -R $S/mutations/per-piece-bucket-change.diff || exit 9
