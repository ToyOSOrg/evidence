#!/bin/sh
W=<worktree>
L=<scratchpad>/logs
cd "$W" || exit 99
echo "head $(git rev-parse HEAD)"; echo "status before:"; git status --porcelain --ignore-submodules=none; echo "(end)"; uptime
cargo run -- --build-only --arch x86_64 > "$L/build-only-x86_64-head.log" 2>&1; echo "build-only x86_64 EXIT=$?"
cargo run -- --build-only --arch aarch64 > "$L/build-only-aarch64.log" 2>&1; echo "build-only aarch64 EXIT=$?"
uptime
cargo run -- --ci host > "$L/ci-host.log" 2>&1; echo "ci host EXIT=$?"
uptime; df -h "$W" | tail -1
echo "status after:"; git status --porcelain --ignore-submodules=none; echo "(end)"
