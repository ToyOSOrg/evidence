#!/bin/bash
# Each mutation: applied as a checked patch, shown to build, its named test
# run, reported red or green with its exit code, and restored.
ROOT=$WORKTREE
HERE=$(cd "$(dirname "$0")" && pwd)
cd "$ROOT" || exit 2
[ -z "$(git status --porcelain)" ] || { echo "tree not clean"; exit 2; }
echo "head $(git rev-parse HEAD)"
while read -r name pkg test; do
  patch="$HERE/$name.patch"
  git apply --check "$patch" || { echo "$name: patch does not apply"; exit 2; }
  git apply "$patch"
  cargo test -q -p "$pkg" --lib --no-run > "$HERE/$name.build.log" 2>&1; build=$?
  if [ $build -ne 0 ]; then
    verdict="DOES NOT BUILD"; run=-
  else
    cargo test -q -p "$pkg" --lib -- "$test" > "$HERE/$name.run.log" 2>&1; run=$?
    if [ $run -ne 0 ]; then verdict=RED; else verdict=GREEN; fi
  fi
  git apply -R "$patch"
  [ -z "$(git status --porcelain)" ] || { echo "$name: restore left the tree dirty"; exit 2; }
  echo "$name: build EXIT=$build, $pkg $test EXIT=$run -> $verdict"
done < "$HERE/list.txt"
echo "tree clean: $([ -z "$(git status --porcelain)" ] && echo yes || echo no)"
