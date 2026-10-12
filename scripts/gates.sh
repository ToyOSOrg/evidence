#!/bin/sh
# Scratch: the head's gates, in order, each with its own exit code.
S=/private/tmp/claude-502/-Users-jan-Dev-jan-toyos/80e90c3a-7449-46b8-84cc-b59e9dd31ae9/scratchpad/busywake
cd /Users/jan/Dev/jan/toyos-busywake || exit 9
git rev-parse HEAD > $S/gates-head.txt
cargo run -- --build-only > $S/g-build-only.log 2>&1; echo "EXIT=$?" >> $S/g-build-only.log
cargo run -- --ci host > $S/g-ci-host.log 2>&1; echo "EXIT=$?" >> $S/g-ci-host.log
cargo test > $S/g-guest.log 2>&1; echo "EXIT=$?" >> $S/g-guest.log
echo done > $S/gates.done
