#!/bin/sh
# The gates at the fix round's head, one after another, each with its own exit.
R=/Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/sysentry-r2/gates
cd /Users/jan/Dev/jan/toyos-sysentry || exit 3
git rev-parse HEAD > "$R/head.txt"
git status --porcelain --ignore-submodules=none > "$R/status-before.txt"
cargo run -- --build-only > "$R/build-only-x86_64.log" 2>&1; echo "EXIT=$?" >> "$R/build-only-x86_64.log"
cargo run -- --build-only --arch aarch64 > "$R/build-only-aarch64.log" 2>&1; echo "EXIT=$?" >> "$R/build-only-aarch64.log"
cargo run -- --ci host > "$R/host.log" 2>&1; echo "EXIT=$?" >> "$R/host.log"
{ uptime; cargo test; echo "EXIT=$?"; uptime; } > "$R/guest.log" 2>&1
git status --porcelain --ignore-submodules=none > "$R/status-after.txt"
git rev-parse HEAD > "$R/head-after.txt"
echo done > "$R/done"
