#!/bin/sh
# Ruling 1's controls: each drops at the accept one thing the child held. Green first, then each
# patch applied (checked), the listener tests run, and the patch reverted. Paths masked.
T=$1; D=$2
cd "$T" || exit 1
mask() { sed -e "s|$T|<tree>|g" -e "s|$D|<dir>|g" -e "s|$HOME|~|g"; }
echo "head $(git rev-parse HEAD), $(rustc --version)"
git status --porcelain --ignore-submodules=none | grep . && { echo "tree not clean"; exit 2; }
run() {
  echo "=== $1: cargo test -p toyos-net-node --test listeners"
  cargo test -p toyos-net-node --test listeners 2>&1 | grep -E '^test |test result|panicked' | mask
  echo "=== $1 EXIT=${PIPESTATUS:-?}"
}
cargo test -p toyos-net-node --test listeners > "$D/o" 2>&1; e=$?; grep -E '^test |test result' "$D/o" | mask; echo "=== green EXIT=$e"
for c in accept-drops-in-order accept-drops-out-of-order accept-drops-fin; do
  git apply --check "$D/$c.patch" || exit 2
  git apply "$D/$c.patch"
  echo "=== $c: git diff"; git diff | mask
  cargo build -p toyos-net-tcp > "$D/o" 2>&1 || { echo "$c does not build"; cat "$D/o" | mask; git apply -R "$D/$c.patch"; exit 2; }
  cargo test -p toyos-net-node --test listeners > "$D/o" 2>&1; e=$?
  grep -E 'FAILED|test result|panicked' "$D/o" | mask
  echo "=== $c EXIT=$e"
  git apply -R "$D/$c.patch"
done
echo "=== restored: git status --porcelain --ignore-submodules=none"; git status --porcelain --ignore-submodules=none; echo "=== restored EXIT=$?"
rm -f "$D/o"
