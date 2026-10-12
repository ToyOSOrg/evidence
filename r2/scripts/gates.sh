#!/bin/sh
# Scratch: the head's gates, each with its own exit code.
S=/Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/busywake-r2
cd /Users/jan/Dev/jan/toyos-busywake || exit 9
git rev-parse HEAD > $S/gates/head.txt
cargo run -- --build-only > $S/gates/g-build-only.log 2>&1; echo "EXIT=$?" >> $S/gates/g-build-only.log
cargo run -- --ci host > $S/gates/g-ci-host.log 2>&1; echo "EXIT=$?" >> $S/gates/g-ci-host.log
cargo test > $S/gates/g-guest.log 2>&1; echo "EXIT=$?" >> $S/gates/g-guest.log
echo done > $S/gates/done
