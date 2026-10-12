#!/bin/bash
cd <worktree> || exit 1
G=<scratch>/gates
git rev-parse HEAD > $G/HEAD
cargo run -- --ci host > $G/ci-host.log 2>&1; echo "EXIT=$?" >> $G/ci-host.log
cargo run -- --build-only > $G/build-x86_64.log 2>&1; echo "EXIT=$?" >> $G/build-x86_64.log
cargo run -- --build-only --arch aarch64 > $G/build-aarch64.log 2>&1; echo "EXIT=$?" >> $G/build-aarch64.log
cargo test > $G/guest.log 2>&1; echo "EXIT=$?" >> $G/guest.log
echo done > $G/DONE
