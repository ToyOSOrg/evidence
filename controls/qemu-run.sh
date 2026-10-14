#!/bin/sh
# Runs shared-boot rust-tests binaries in QEMU through the harness's --debug mode:
# $1 = worktree, $2 = output dir, rest = binaries (test_rs_<name>). Masks paths.
T=$1; O=$2; shift 2
cd "$T" || exit 1
rm -f /tmp/toyos-debug-cmd /tmp/toyos-debug-result /tmp/toyos-debug-ready
cargo test --test toyos-build -- --debug > "$O/debug.log" 2>&1 &
P=$!
n=0; until [ -f /tmp/toyos-debug-ready ] || [ $((n+=1)) -gt 1800 ] || ! kill -0 $P 2>/dev/null; do sleep 1; done
[ -f /tmp/toyos-debug-ready ] || { echo "the debug boot never became ready"; tail -40 "$O/debug.log"; kill $P 2>/dev/null; exit 3; }
for b in "$@"; do
  rm -f /tmp/toyos-debug-result
  echo "run $b" > /tmp/toyos-debug-cmd
  n=0; until [ -f /tmp/toyos-debug-result ] || [ $((n+=1)) -gt 600 ]; do sleep 1; done
  echo "=== $b"; sed -e "s|$T|<tree>|g" -e "s|$HOME|~|g" /tmp/toyos-debug-result
done
rm -f /tmp/toyos-debug-result; echo quit > /tmp/toyos-debug-cmd
n=0; until [ -f /tmp/toyos-debug-result ] || [ $((n+=1)) -gt 60 ]; do sleep 1; done
wait $P; echo "harness EXIT=$?"
