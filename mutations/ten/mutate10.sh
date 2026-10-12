#!/bin/sh
# Each of the earlier ten mutations: checked, applied, built, the crate's suite run, restored.
# Usage: mutate10.sh <worktree> <patch dir> <log dir>
W=$1; P=$2; L=$3
cd "$W" || exit 2
echo "head $(git rev-parse HEAD)"
echo "stream.rs blob $(git rev-parse HEAD:lib/blockring/transport/src/stream.rs)"
for p in "$P"/m*.patch; do
  name=$(basename "$p" .patch)
  [ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "$name: tree not clean before"; exit 3; }
  git apply --check "$p" || { echo "$name: does not apply"; exit 3; }
  git apply "$p"
  cargo build -p toyos-transport --tests > "$L/$name.build.log" 2>&1; build=$?
  cargo test -p toyos-transport --no-fail-fast --lib --test loom > "$L/$name.log" 2>&1; test=$?
  git apply -R "$p"
  red=$(grep -E ' \.\.\. FAILED$' "$L/$name.log" | sed 's/^test //; s/ \.\.\. FAILED$//' | tr '\n' ' ')
  echo "$name: build EXIT=$build, suite EXIT=$test, red: ${red:-none}"
  [ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "$name: tree not clean after"; exit 4; }
done
echo "restored: $(git status --porcelain --ignore-submodules=none | wc -l | tr -d ' ') paths dirty"
