#!/bin/sh
# Every head measurement in sequence: the mutations, the decisions reverted, the tables, the throwaway measurement, the image.
S=/private/tmp/claude-502/-Users-jan-Dev-jan-toyos/80e90c3a-7449-46b8-84cc-b59e9dd31ae9/scratchpad/sched-s0
M=$S/mut
cd /Users/jan/Dev/jan/toyos-sched-s0 || exit 1
$M/run-branch.sh > $M/run-branch.out 2>&1
$M/run-decisions.sh > $M/run-decisions.out 2>&1
{ git rev-parse HEAD; uptime; /usr/bin/time -p cargo test -p kernel-sim --test topology -- --nocapture --test-threads 1; echo "EXIT=$?"; } > $S/topology-tables.log 2>&1
cp $M/zz_measure.rs kernel/sim/tests/zz_measure.rs
{ git rev-parse HEAD; cargo test -p kernel-sim --test zz_measure -- --nocapture; echo "EXIT=$?"; } > $M/multi-victim-measure.log 2>&1
rm kernel/sim/tests/zz_measure.rs
[ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "tree not clean"; exit 1; }
{ git rev-parse HEAD; cargo run -- --build-only; echo "EXIT=$?"; } > $S/build-only.log 2>&1
echo DONE
