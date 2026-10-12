#!/bin/sh
# Measurement only: PR #863's amendment C. The node's listener tests at this head, then with
# nowhere.patch, which drops what a child held before its accept as the design as written leaves
# it, then restored. Paths masked: the worktree as <tree>, the patch's directory as <dir>, home as ~.
T=$1
P=$2
cd "$T" || exit 1
mask() { sed -e "s|$T|<tree>|g" -e "s|$(dirname "$P")|<dir>|g" -e "s|$HOME|~|g" "$1"; }
O=$(dirname "$P")/case.out
echo "head $(git rev-parse HEAD), $(rustc --version)"
echo "=== at head: cargo test -p toyos-net-node --test listeners"
cargo test -p toyos-net-node --test listeners > "$O" 2>&1
e=$?
mask "$O"
echo "=== at head EXIT=$e"
git apply --check "$P" || exit 2
git apply "$P"
echo "=== mutated: git diff"
git diff > "$O"
mask "$O"
echo "=== mutated: cargo test -p toyos-net-node --test listeners"
cargo test -p toyos-net-node --test listeners > "$O" 2>&1
e=$?
mask "$O"
echo "=== mutated EXIT=$e"
git apply -R "$P"
echo "=== restored: git status --porcelain --ignore-submodules=none"
git status --porcelain --ignore-submodules=none
echo "=== restored EXIT=$?"
rm -f "$O"
