#!/bin/sh
# Stages the four metal arms of PR #884; touches no machine. Each arm builds
# its shared-debug image under its own readback directory and writes its
# request.txt there. The tree is put back on the branch and left clean.
W=<worktree>
S=<scratchpad>
M=$S/metal
L=$S/logs
P=$S/mutations/switch-off-reverted.patch
AMD='<user>@<amd-bench>'
cd "$W" || exit 99
BRANCH=wt/toyos-amdvi-ring
HEAD=$(git rev-parse HEAD)
BASE=$(git merge-base HEAD origin/main)
echo "head $HEAD base $BASE"
echo "status before:"; git status --porcelain --ignore-submodules=none; echo "(end)"
git diff --stat "$BASE" HEAD
stage() { # <dir> [host]
    if [ -n "$2" ]; then
        cargo test --test toyos-build -- --metal --metal-readback "$M/$1" --metal-host "$2" iommu_firmware_left > "$L/stage-$1.log" 2>&1
    else
        cargo test --test toyos-build -- --metal --metal-readback "$M/$1" iommu_firmware_left > "$L/stage-$1.log" 2>&1
    fi
    rc=$?; echo "stage $1 at $(git rev-parse HEAD) EXIT=$rc"
}
stage head-amd "$AMD"
stage head-t14
git checkout -q --detach HEAD
git apply --check "$P" || { echo "patch does not apply"; git checkout -q "$BRANCH"; exit 98; }
git apply "$P"
git commit -q -a -F "$S/msgs/mutation.txt"
echo "mutation commit $(git rev-parse HEAD) on $(git rev-parse HEAD~1)"
git diff --stat HEAD~1 HEAD
stage switch-off-reverted-amd "$AMD"
git checkout -q "$BRANCH"
git checkout -q --detach "$BASE"
stage base-amd "$AMD"
git checkout -q "$BRANCH"
echo "back on $(git rev-parse --abbrev-ref HEAD) at $(git rev-parse HEAD)"
echo "status after:"; git status --porcelain --ignore-submodules=none; echo "(end)"
