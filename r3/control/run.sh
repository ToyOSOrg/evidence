#!/bin/sh
# The whole change reverted onto the base: origin/main's kernel/pure and
# kernel/src/hw.rs under this head's kernel/sim and kernel/loom, plus a shim
# declaring PROTECTED_RUN_NS so the head's tests compile; then restored.
S=<home>/.claude/jobs/2280e09e/tmp/scratchpad/busywake-r3
cd <home>/Dev/jan/toyos-busywake || exit 9
echo "head $(git rev-parse HEAD), base $(git rev-parse origin/main)"
git checkout origin/main -- kernel/pure kernel/src/hw.rs
git apply --recount $S/control/shim.patch || { echo "shim does not apply"; git checkout HEAD -- kernel/pure kernel/src/hw.rs; exit 3; }
git diff --stat HEAD
cargo test -p kernel-sim --no-fail-fast > $S/control/whole-change-reverted.log 2>&1; echo "EXIT=$?" >> $S/control/whole-change-reverted.log
git checkout HEAD -- kernel/pure kernel/src/hw.rs
echo "restored: $(git status --porcelain --ignore-submodules=none | wc -l | tr -d ' ') changes"
