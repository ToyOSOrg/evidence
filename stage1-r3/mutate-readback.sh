#!/bin/sh
# m14: `new` drops the mode read-back. The patch is checked, applied, built,
# the medium oracle run against it (red is a non-zero exit), and the patch
# restored in the same script, which ends by showing the tree clean.
# $1: the ToyOS worktree; $2: this directory; $3: an empty scratch directory.
set -u
W=$1; H=$2; D=$3
cd "$W" || exit 2
git apply --check "$H/m14-no-readback.patch"; echo "check EXIT=$?"
git apply "$H/m14-no-readback.patch"; echo "apply EXIT=$?"
git diff --stat
cargo build -q --release -p toyos-root --target aarch64-apple-darwin; echo "build EXIT=$?"
mkdir -p "$D/mutated"
"$H/medium-oracle.sh" "$W/target/aarch64-apple-darwin/release/toyos-root" "$D/mutated"; m=$?
echo "mutated oracle EXIT=$m"
git apply -R "$H/m14-no-readback.patch"; echo "restore EXIT=$?"
cargo build -q --release -p toyos-root --target aarch64-apple-darwin; echo "rebuild EXIT=$?"
mkdir -p "$D/restored"
"$H/medium-oracle.sh" "$W/target/aarch64-apple-darwin/release/toyos-root" "$D/restored"; r=$?
echo "restored oracle EXIT=$r"
echo "git status --porcelain --ignore-submodules=none:"; git status --porcelain --ignore-submodules=none; echo "(end)"
[ "$m" -ne 0 ] && [ "$r" -eq 0 ]
