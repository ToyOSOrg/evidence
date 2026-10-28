#!/bin/bash
# run5.sh: m8 (the probe's minimum removed) applied, osbench-rules tested, and reverted, in one run.
cd <home>/Dev/jan/toyos-bench-fair
M=<scratch>/agents/bench-fair/mutations
git apply --check $M/m8-no-probe-minimum.patch && git apply $M/m8-no-probe-minimum.patch || exit 2
cargo build -q -p osbench-rules --tests > $M/m8.build.log 2>&1; echo "m8 build EXIT=$?"
cargo test -q -p osbench-rules > $M/m8.test.log 2>&1; echo "m8 test EXIT=$?"
grep -E "panicked at|preempted" $M/m8.test.log | head -3
git apply -R $M/m8-no-probe-minimum.patch && echo "m8 restored"
