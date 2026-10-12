#!/bin/sh
# The guest test's green arm at the head, then the switch-off reverted, applied
# as a checked patch, run, and restored, leaving the tree as it was.
W=<worktree>
S=<scratchpad>
P=$S/mutations/switch-off-reverted.patch
cd "$W" || exit 99
echo "head $(git rev-parse HEAD)"
echo "status before:"; git status --porcelain --ignore-submodules=none; echo "(end)"
uptime
cargo test --test toyos-build -- amdvi_firmware_left > "$S/logs/guest-green.log" 2>&1
echo "green arm EXIT=$?"
git apply --check "$P" || { echo "patch does not apply"; exit 98; }
git apply "$P"
git diff --stat
cargo test --test toyos-build -- amdvi_firmware_left > "$S/logs/guest-switch-off-reverted.log" 2>&1
echo "switch-off reverted EXIT=$?"
git apply -R "$P"
echo "status after:"; git status --porcelain --ignore-submodules=none; echo "(end)"
uptime
