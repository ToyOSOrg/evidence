#!/bin/bash
# run4.sh: m7 applied, osbench-rules tested, and reverted, in one run.
cd <home>/Dev/jan/toyos-bench-fair
M=<scratch>/agents/bench-fair/mutations
git apply --check $M/m7-tolerance-10pct.patch && git apply $M/m7-tolerance-10pct.patch || exit 2
cargo build -q -p osbench-rules --tests > $M/m7.build.log 2>&1; echo "m7 build EXIT=$?"
cargo test -q -p osbench-rules > $M/m7.test.log 2>&1; echo "m7 test EXIT=$?"
grep -E "panicked at|3789 to 4189|1650 to 1850" $M/m7.test.log | head -4
git apply -R $M/m7-tolerance-10pct.patch && echo "m7 restored"
