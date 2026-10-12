#!/bin/sh
# Scratch: the simulator and loom at the head, in the detached worktree; then the whole-change control.
S=/Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/busywake-r2
cd /Users/jan/Dev/jan/toyos-busywake-inv || exit 9
git rev-parse HEAD > $S/sim/head.txt
cargo test -p kernel-sim --test policy -- --nocapture --test-threads 1 > $S/sim/sim-policy.log 2>&1; echo "EXIT=$?" >> $S/sim/sim-policy.log
cargo test -p kernel-sim > $S/sim/sim-all.log 2>&1; echo "EXIT=$?" >> $S/sim/sim-all.log
cargo test -p kernel-loom --test loom_sleep --test loom_push --test loom_mailbox > $S/sim/loom.log 2>&1; echo "EXIT=$?" >> $S/sim/loom.log
cargo test -p kernel-loom --features doorbell-kick-relaxed --test loom_sleep > $S/sim/loom-doorbell-kick-relaxed.log 2>&1; echo "EXIT=$?" >> $S/sim/loom-doorbell-kick-relaxed.log
cargo build --release -p kernel-sim --bin kernel-sim > $S/sim/sim-gate-build.log 2>&1; echo "EXIT=$?" >> $S/sim/sim-gate-build.log
./target/release/kernel-sim gate 10000 > $S/sim/sim-gate.log 2>&1; echo "EXIT=$?" >> $S/sim/sim-gate.log
git status --porcelain > $S/sim/tree-after.txt
cd /Users/jan/Dev/jan/toyos-busywake-ctl || exit 9
{ echo "tree: 131970ac8 production code, kernel/sim and kernel/loom from 362ab397b, plus the shim:"; git diff HEAD -- kernel/pure; git diff --stat HEAD; } > $S/control/whole-change-reverted.log
cargo test -p kernel-sim >> $S/control/whole-change-reverted.log 2>&1; echo "EXIT=$?" >> $S/control/whole-change-reverted.log
echo done > $S/sim/done
