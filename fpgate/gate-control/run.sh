#!/bin/sh
# The gate's negative control: plant `movaps` in `hw::halt`, build, restore.
S=/private/tmp/claude-502/-Users-jan-Dev-jan-toyos/80e90c3a-7449-46b8-84cc-b59e9dd31ae9/scratchpad/sysentry
W=/Users/jan/Dev/jan/toyos-sysentry
cd "$W" || exit 3
git apply --check "$S/patches/gate-control-movaps.patch" || exit 4
git apply "$S/patches/gate-control-movaps.patch" || exit 5
git diff --stat
cargo run -- --build-only > "$S/logs/gate-control.log" 2>&1
echo "BUILD EXIT=$?"
git apply -R "$S/patches/gate-control-movaps.patch" || exit 6
git status --porcelain --ignore-submodules=none
echo "RESTORED"
