#!/bin/bash
# Host microbenchmark, indicative only: base and head trees exported by `git archive`, the scratch benches inserted,
# the kernel's `toyos` profile, separate target dirs. Order B H H B H B; each run prints best-of-7.
S=<wakeperf>
for side in base head head base head base; do
  cd $S/benchtree/$side || exit 99
  echo "=== $side"
  CARGO_TARGET_DIR=$S/benchtarget/$side cargo test -q --profile toyos -p kernel --lib bench_ -- --ignored --nocapture --test-threads 1 2>&1 | grep -E "BENCH|error|panicked"
done
