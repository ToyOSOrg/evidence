#!/bin/sh
# The four gates, one after another, each log ending in its exit.
G=/Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/microcode-build/gates
cd /Users/jan/Dev/jan/toyos-microcode || exit 90
git rev-parse HEAD > $G/gates.head
git status --porcelain --ignore-submodules=none > $G/porcelain.txt
run() { name=$1; shift; "$@" > $G/$name.log 2>&1; rc=$?; echo "EXIT=$rc" >> $G/$name.log; echo "$name EXIT=$rc" >> $G/summary.txt; }
: > $G/summary.txt
run build-x86_64 cargo run -- --build-only
run build-aarch64 cargo run -- --build-only --arch aarch64
run ci-host cargo run -- --ci host
uptime > $G/guest.load; run guest cargo test; uptime >> $G/guest.load
echo DONE >> $G/summary.txt
