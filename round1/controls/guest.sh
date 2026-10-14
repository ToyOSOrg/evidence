#!/bin/sh
# Each std control of stream_handles: the patch applied (checked), the shared binaries and the
# debug image rebuilt by the harness, the kernel's debug gate released over its gdb stub, the test
# run in QEMU, the patch reverted. Paths masked.
T=$1; D=$2; shift 2
cd "$T" || exit 1
mask() { sed -e "s|$T|<tree>|g" -e "s|$D|<dir>|g" -e "s|$HOME|~|g"; }
K=$T/target/x86_64-unknown-none/toyos/kernel
echo "head $(git rev-parse HEAD)"
git status --porcelain --ignore-submodules=none | grep . && exit 2
for c in "$@"; do
  if [ "$c" != green ]; then git apply --check "$D/$c.patch" || exit 2; git apply "$D/$c.patch"; fi
  echo "=== $c: git diff"; git diff | mask
  rm -f /tmp/toyos-debug-cmd /tmp/toyos-debug-result /tmp/toyos-debug-ready
  cargo test --test toyos-build -- --debug > "$D/$c.debug.log" 2>&1 &
  P=$!
  n=0
  until [ -f /tmp/toyos-debug-ready ] || ! kill -0 $P 2>/dev/null || [ $((n+=1)) -gt 1500 ]; do
    if lsof -nP -iTCP:1234 -sTCP:LISTEN >/dev/null 2>&1; then
      SYM=$(/opt/homebrew/opt/binutils/bin/nm "$K" | grep " DEBUG_WAIT$" | cut -d" " -f1)
      [ -n "$SYM" ] || { echo "the booted kernel names no DEBUG_WAIT"; kill $P; break; }
      GATE=0xffff8000$(printf %08x $((0x7c000000 + 0x$SYM)))
      lldb -b -o "gdb-remote localhost:1234" -o "memory write --size 1 $GATE 0" -o "process detach" >/dev/null 2>&1
    fi
    sleep 2
  done
  if [ -f /tmp/toyos-debug-ready ]; then
    rm -f /tmp/toyos-debug-result
    echo "run test_rs_stream_handles" > /tmp/toyos-debug-cmd
    n=0; until [ -f /tmp/toyos-debug-result ] || [ $((n+=1)) -gt 300 ]; do sleep 1; done
    echo "=== $c result"; mask < /tmp/toyos-debug-result
    rm -f /tmp/toyos-debug-result; echo quit > /tmp/toyos-debug-cmd
  else
    echo "=== $c: the debug boot never became ready"; tail -30 "$D/$c.debug.log" | mask
    kill $P
  fi
  wait $P; echo "=== $c harness EXIT=$?"
  [ "$c" = green ] || git apply -R "$D/$c.patch"
done
echo "=== restored"; git status --porcelain --ignore-submodules=none; echo "=== restored EXIT=$?"
