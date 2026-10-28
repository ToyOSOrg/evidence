#!/bin/bash
# run2.sh: m4 applied, toyos-metal's stamp tests run, and reverted, in one run.
cd <home>/Dev/jan/toyos-bench-fair
M=<scratch>/agents/bench-fair/mutations
git apply --check $M/m4-volume-overwritten.patch && git apply $M/m4-volume-overwritten.patch || exit 2
cargo build -q -p toyos-metal --tests > $M/m4.build.log 2>&1; echo "m4 build EXIT=$?"
cargo test -q -p toyos-metal stamp > $M/m4.test.log 2>&1; echo "m4 test EXIT=$?"
grep -E "panicked at|test result" $M/m4.test.log | head -3
git apply -R $M/m4-volume-overwritten.patch && echo "m4 restored"
