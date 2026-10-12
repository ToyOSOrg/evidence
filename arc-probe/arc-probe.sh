#!/bin/sh
# The stream model on loom's Arc, under `want-relaxed`, which deadlocks both wake models.
# Usage: arc-probe.sh <worktree> <patch> <log dir>
W=$1; P=$2; L=$3
cd "$W" || exit 2
echo "head $(git rev-parse HEAD)"
git apply --check "$P" || exit 3
git apply "$P"
cargo test -p toyos-transport --features want-relaxed --test loom --no-run > "$L/arc-probe.build.log" 2>&1; b=$?
cargo test -p toyos-transport --features want-relaxed --test loom -- a_consumer_that_looked_again_is_rung_for_bytes_it_missed --exact > "$L/arc-probe.loom-arc.log" 2>&1; t=$?
git apply -R "$P"
cargo test -p toyos-transport --features want-relaxed --test loom -- a_consumer_that_looked_again_is_rung_for_bytes_it_missed --exact > "$L/arc-probe.std-arc.log" 2>&1; u=$?
dirty=$(git status --porcelain --ignore-submodules=none)
echo "loom Arc: build=$b test=$t; std Arc: test=$u; tree-clean=$([ -z "$dirty" ] && echo yes || echo NO)"
