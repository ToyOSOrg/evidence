#!/bin/sh
# The scribble probe's positive control: the canary written after the save, as
# a save that skipped the extended components would leave it. vector_state
# must end nonzero. Applies the checked patch, runs, restores.
W=<scratchpad>/sysentry-analysis
T=<home>/toyos-sysentry-probe
cd "$T" || exit 3
echo "tree: $(git rev-parse HEAD), clean before: [$(git status --porcelain --ignore-submodules=none)]"
git apply --check "$W/positive-control/canary-after-save.patch" || exit 4
git apply "$W/positive-control/canary-after-save.patch" || exit 5
git diff --stat
rm -rf target/red-run-serial
cargo test --test toyos-build -- vector_state_survives_a_switch > "$W/positive-control/qemu-vector_state.log" 2>&1
echo "TEST EXIT=$?"
git apply -R "$W/positive-control/canary-after-save.patch" || exit 6
echo "clean after: [$(git status --porcelain --ignore-submodules=none)]"
echo RESTORED
