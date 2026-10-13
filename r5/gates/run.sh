#!/bin/sh
# PR #874 round 5 gates, each with its own exit, stamped with the tree they ran on.
G=<path>
cd <path> || exit 2
echo "head: $(git rev-parse HEAD) ($(git status --porcelain --ignore-submodules=none | wc -l | tr -d ' ') uncommitted changes)"
cargo run -- --ci host > $G/ci-host.log 2>&1; echo "cargo run -- --ci host EXIT=$?"
cargo test -p kernel-sim > $G/sim.log 2>&1; echo "cargo test -p kernel-sim EXIT=$?"
cargo run -- --build-only > $G/build-only.log 2>&1; echo "cargo run -- --build-only EXIT=$?"
echo "head after: $(git rev-parse HEAD) ($(git status --porcelain --ignore-submodules=none | wc -l | tr -d ' ') uncommitted changes)"
echo DONE
