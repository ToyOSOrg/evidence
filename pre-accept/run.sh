#!/bin/sh
# Measurement only: PR #863's stage 4 exit case, run against today's node tests. case.patch adds
# the case to listeners.rs; each control then drops at the accept one thing the child held (its
# in-order bytes, its out-of-order range, its FIN); then everything is restored. Paths masked:
# the worktree as <tree>, this directory as <dir>, home as ~.
T=$1
D=$2
cd "$T" || exit 1
mask() { sed -e "s|$T|<tree>|g" -e "s|$D|<dir>|g" -e "s|$HOME|~|g" "$1"; }
O=$D/case.out
run() {
  echo "=== $1: cargo test -p toyos-net-node --test listeners"
  cargo test -p toyos-net-node --test listeners > "$O" 2>&1
  e=$?
  mask "$O"
  echo "=== $1 EXIT=$e"
}
echo "head $(git rev-parse HEAD), $(rustc --version)"
git status --porcelain --ignore-submodules=none | grep . && { echo "tree not clean"; exit 2; }
git apply --check "$D/case.patch" || exit 2
git apply "$D/case.patch"
echo "=== case: git diff"
git diff > "$O"; mask "$O"
run "with the case"
for c in in-order out-of-order fin; do
  git apply --check "$D/$c.patch" || exit 2
  git apply "$D/$c.patch"
  echo "=== $c dropped at the accept: git diff -- system/netstack/shard"
  git diff -- system/netstack/shard > "$O"; mask "$O"
  run "$c dropped at the accept"
  git apply -R "$D/$c.patch"
done
git apply -R "$D/case.patch"
echo "=== restored: git status --porcelain --ignore-submodules=none"
git status --porcelain --ignore-submodules=none
echo "=== restored EXIT=$?"
rm -f "$O"
