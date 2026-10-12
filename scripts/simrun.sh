#!/bin/sh
S=/private/tmp/claude-502/-Users-jan-Dev-jan-toyos/80e90c3a-7449-46b8-84cc-b59e9dd31ae9/scratchpad/busywake
cd /Users/jan/Dev/jan/toyos-busywake-sim || exit 9
git rev-parse HEAD > $S/final/sim-head.txt
cargo test -p kernel-sim --test policy -- --nocapture --test-threads 1 > $S/final/sim-policy.log 2>&1; echo "EXIT=$?" >> $S/final/sim-policy.log
cargo test -p kernel-loom --test loom_sleep --test loom_push --test loom_mailbox > $S/final/loom.log 2>&1; echo "EXIT=$?" >> $S/final/loom.log
cargo test -p kernel-loom --features doorbell-kick-relaxed --test loom_sleep > $S/final/loom-doorbell-kick-relaxed.log 2>&1; echo "EXIT=$?" >> $S/final/loom-doorbell-kick-relaxed.log
cargo build --release -p kernel-sim --bin kernel-sim > $S/final/sim-gate-build.log 2>&1
./target/release/kernel-sim gate 10000 > $S/final/sim-gate.log 2>&1; echo "EXIT=$?" >> $S/final/sim-gate.log
echo done > $S/final/sim.done
