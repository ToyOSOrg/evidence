#!/bin/sh
# Apply each mutation, build, run the scheduler model tests, record, revert.
root=~/Dev/jan/toyos-sched-model
dir=$SCRATCH/mutations-fae62adbf
cd "$root" || exit 1
echo "head $(git rev-parse HEAD)" > "$dir/summary.txt"
for p in "$dir"/[mn]*.patch; do
  n=$(basename "$p" .patch)
  git apply --check "$p" || { echo "$n: does not apply" >> "$dir/summary.txt"; continue; }
  git apply "$p"
  cargo test -p kernel --lib --features sched-check -- sched:: > "$dir/$n.log" 2>&1
  code=$?
  git apply -R "$p"
  built=$(grep -c "Running unittests" "$dir/$n.log")
  failed=$(grep -E "^    sched::" "$dir/$n.log" | sed 's/^ *//' | tr '\n' ' ')
  echo "$n: exit $code built=$built failed: $failed" >> "$dir/summary.txt"
done
git status --porcelain >> "$dir/summary.txt"
