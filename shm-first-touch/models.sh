#!/bin/bash
set -u
cd <scratch>/spawnperf/wt || exit 1
echo "rev $(git rev-parse HEAD)"; git status --short
run() { echo "== $*"; "$@"; echo "exit $?"; }
run cargo test --manifest-path kernel/loom/Cargo.toml --test shm_slot
run cargo test --manifest-path kernel/loom/Cargo.toml --features slot-install-relaxed --test shm_slot
run cargo clippy -p kernel-loom --tests -- -D warnings
echo "all done"
