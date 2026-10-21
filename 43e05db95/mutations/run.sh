#!/bin/sh
# Apply each control patch, build, run the scheduler model tests (killed after
# 300 s: a hang is a red verdict), record, revert.
root=~/Dev/jan/toyos-sched-model
dir=$(dirname "$0")
cd "$root" || exit 1
echo "head $(git rev-parse HEAD)" > "$dir/summary.txt"
for p in "$dir"/*.patch; do
  n=$(basename "$p" .patch)
  git apply --check "$p" || { echo "$n: does not apply" >> "$dir/summary.txt"; continue; }
  git apply "$p"
  cargo test -p kernel --lib --features sched-check -- sched:: > "$dir/$n.log" 2>&1 &
  pid=$!
  ( sleep 300; if kill -0 $pid 2>/dev/null; then echo "WATCHDOG: killed after 300 s" >> "$dir/$n.log"; pkill -P $pid; fi ) &
  dog=$!
  wait $pid
  code=$?
  kill $dog 2>/dev/null
  git apply -R "$p"
  built=$(grep -c "Running unittests" "$dir/$n.log")
  failed=$(grep -E "^    sched::|^test .* FAILED" "$dir/$n.log" | sed -e 's/^ *//' -e 's/^test //' -e 's/ \.\.\. FAILED//' | sort -u | tr '\n' ' ')
  hung=$(grep -c WATCHDOG "$dir/$n.log")
  echo "$n: exit $code built=$built hung=$hung failed: $failed" >> "$dir/summary.txt"
done
git status --porcelain >> "$dir/summary.txt"
