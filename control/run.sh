#!/bin/sh
# The gate's negative control with the whole change reverted: the tree of the
# base 050e46beb (main 177e72a9e with #859), with the same movaps planted in
# `hw::halt` that bbe8df088 refused, built; then both patches taken back out.
C=/private/tmp/claude-502/-Users-jan-Dev-jan-toyos/80e90c3a-7449-46b8-84cc-b59e9dd31ae9/scratchpad/sysentry/resume/control
W=/Users/jan/Dev/jan/toyos-sysentry
OBJDUMP=/Users/jan/.rustup/toolchains/nightly-2026-07-22-aarch64-apple-darwin/lib/rustlib/aarch64-apple-darwin/bin/llvm-objdump
HEAD_WAS=5151e194a
cd "$W" || exit 3
[ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "tree not clean"; exit 4; }
[ "$(git rev-parse --short=9 HEAD)" = "$HEAD_WAS" ] || { echo "HEAD is not $HEAD_WAS"; exit 5; }
git apply --check "$C/whole-change-reverted.patch" || exit 6
git apply "$C/whole-change-reverted.patch" || exit 7
git apply --check "$C/movaps.patch" || { git apply -R "$C/whole-change-reverted.patch"; exit 8; }
git apply "$C/movaps.patch" || exit 9
echo "tree against 050e46beb:"
git diff --stat 050e46beb
cargo run -- --build-only > "$C/build.log" 2>&1
echo "BUILD EXIT=$?"
shasum -a 256 target/x86_64-unknown-none/toyos/kernel
"$OBJDUMP" -d -C --no-show-raw-insn --x86-asm-syntax=intel target/x86_64-unknown-none/toyos/kernel > "$C/objdump-control.txt" 2>&1
echo "OBJDUMP EXIT=$?"
awk -f "$C/oracle.awk" "$C/objdump-control.txt" 2> "$C/total-control.txt" | sort | uniq -c > "$C/flagged-control.txt"
echo "ORACLE EXIT=$?"
git apply -R "$C/movaps.patch" || exit 10
git apply -R "$C/whole-change-reverted.patch" || exit 11
echo "status after restore:"
git status --porcelain --ignore-submodules=none
echo "HEAD $(git rev-parse --short=9 HEAD)"
echo RESTORED
