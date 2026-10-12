#!/bin/sh
# Measurement only: PR #863's amendment B model with no preemption bound, one
# case, stopped after ten minutes if loom has given no verdict. Runs a copy of
# <dir> whose one change is printed below. The copy is masked as <copy>, the
# model as <dir> and the home directory as ~.
S=$1
C=$2
CASE=pass_on_bytes_left
LIMIT=600
rm -rf "$C" && mkdir -p "$C" && cp -R "$S/Cargo.toml" "$S/Cargo.lock" "$S/src" "$S/tests" "$C/" || exit 1
sed -i '' 's/builder.preemption_bound = Some(PREEMPTIONS);/builder.preemption_bound = None;/' "$C/tests/same_direction.rs"
mask() { sed -e "s|$C|<copy>|g" -e "s|$S|<dir>|g" -e "s|$HOME|~|g"; }
diff "$S/tests/same_direction.rs" "$C/tests/same_direction.rs" | mask
cd "$C" || exit 1
CARGO_TARGET_DIR="$C/target" cargo test --offline --release --test same_direction --no-run > "$C/build.out" 2>&1 || { mask < "$C/build.out"; exit 1; }
mask < "$C/build.out"
BIN=$(sed -n 's/.*Executable tests\/same_direction.rs (\(.*\))$/\1/p' "$C/build.out")
case "$BIN" in /*) ;; *) BIN="$C/$BIN" ;; esac
echo "=== $CASE, unbounded, started $(date -u +%H:%M:%SZ)"
"$BIN" --exact "$CASE" > "$C/case.out" 2>&1 &
pid=$!
t=0
while kill -0 "$pid" 2>/dev/null && [ "$t" -lt "$LIMIT" ]; do
  sleep 5
  t=$((t + 5))
done
if kill -0 "$pid" 2>/dev/null; then
  kill "$pid"
  wait "$pid" 2>/dev/null
  k=$?
  stopped=$(date -u +%H:%M:%SZ)
  mask < "$C/case.out"
  echo "=== $CASE, unbounded: no verdict after ${LIMIT} s; stopped at $stopped, EXIT=$k (SIGTERM)"
else
  wait "$pid"
  e=$?
  mask < "$C/case.out"
  echo "=== $CASE, unbounded: EXIT=$e after about ${t} s, $(date -u +%H:%M:%SZ)"
fi
