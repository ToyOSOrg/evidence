#!/bin/sh
# The OutsideLogin mutation: may_start stops refusing swap and update
# outside a login session. Checked, applied, shown to build, the manifest crate's host
# tests run (expected red), and restored in this one script.
set -u
W=<worktree>
P=<scratch>/outsidelogin.patch
cd "$W" || exit 99
echo "head: $(git rev-parse HEAD)"
[ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "tree not clean"; exit 98; }
git apply --check "$P" || exit 97
git apply "$P"
echo "== applied:"; git diff
echo "== build (cargo test -p toyos-manifest --no-run)"
cargo test -p toyos-manifest --no-run 2>&1; build=$?
echo "BUILD_EXIT=$build"
echo "== run (cargo test -p toyos-manifest)"
cargo test -p toyos-manifest 2>&1; run=$?
echo "RUN_EXIT=$run"
git apply -R "$P"
echo "== restored: git status --porcelain"; git status --porcelain --ignore-submodules=none
[ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "restore failed"; exit 96; }
# Red is the mutation's success: the build must pass and the run must fail.
if [ $build -eq 0 ] && [ $run -ne 0 ]; then echo "MUTATION RED (run exit $run)"; exit 0; fi
echo "MUTATION NOT RED"; exit 1
