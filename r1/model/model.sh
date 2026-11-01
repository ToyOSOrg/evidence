#!/bin/sh
# Runs the scratch ramp model on the worktree's head and on each variant, restoring after each.
S=<scratch>
W=<dev>/toyos-tcp-ramp2
cd "$W" || exit 1
export CARGO_TARGET_DIR="$W/target"
cp "$S/patches/ramp_probe.rs" system/netstack/shard/tcp/tests/ramp_probe.rs
echo "head $(git rev-parse HEAD) (+ uncommitted: $(git status --porcelain | tr '\n' ' '))"
for v in none variant-window-stop-grows variant-bucket-1ms variant-no-pacing; do
  [ "$v" = none ] || git apply "$S/patches/$v.patch" || exit 1
  echo "== $v"
  cargo test -q -p toyos-net-tcp --test ramp_probe -- --nocapture > "$S/logs/model-$v.log" 2>&1
  echo "exit $?"
  grep -E "^rtt" "$S/logs/model-$v.log"
  [ "$v" = none ] || git apply -R "$S/patches/$v.patch" || exit 1
done
rm system/netstack/shard/tcp/tests/ramp_probe.rs
git status --porcelain
