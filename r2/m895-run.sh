#!/bin/sh
# Applies the scratch probe, runs the one guest boot, restores the tree.
set -u
W=<dev>/toyos-hidpi
D=<home>/.claude/jobs/2280e09e/tmp/scratchpad/agents/895-r2
cd "$W" || exit 90
git apply --check "$D/scripts/m895-probe.patch" || exit 91
git apply "$D/scripts/m895-probe.patch" || exit 92
echo "HEAD $(git rev-parse HEAD) with m895-probe.patch applied"
cargo test --test toyos-build -- iommu_virtio_platform > "$D/m895-run.log" 2>&1
echo "TEST_EXIT=$?"
git apply -R "$D/scripts/m895-probe.patch"
echo "RESTORE_EXIT=$?"
git status --porcelain --ignore-submodules=none
echo "STATUS_DONE"
