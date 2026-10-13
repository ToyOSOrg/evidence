#!/bin/bash
# Each new test that compiles against 519b43215: that file as of 519b43215
# with the test added, built, the test run and reported red or green with its
# exit code, and the file restored to HEAD.
ROOT=<path>
BASE=519b43215
HERE=$(cd "$(dirname "$0")" && pwd)
cd "$ROOT" || exit 2
[ -z "$(git status --porcelain)" ] || { echo "tree not clean"; exit 2; }
echo "head $(git rev-parse HEAD), base $(git rev-parse $BASE)"
while read -r name pkg path test; do
  git checkout -q "$BASE" -- "$path"
  git apply --check "$HERE/$name.patch" || { echo "$name: patch does not apply"; git checkout -q HEAD -- "$path"; exit 2; }
  git apply "$HERE/$name.patch"
  cargo test -q -p "$pkg" --lib --no-run > "$HERE/$name.build.log" 2>&1; build=$?
  if [ $build -ne 0 ]; then
    verdict="DOES NOT BUILD"; run=-
  else
    cargo test -q -p "$pkg" --lib -- "$test" > "$HERE/$name.run.log" 2>&1; run=$?
    if [ $run -ne 0 ]; then verdict=RED; else verdict=GREEN; fi
  fi
  git checkout -q HEAD -- "$path"
  [ -z "$(git status --porcelain)" ] || { echo "$name: restore left the tree dirty"; exit 2; }
  echo "$name: $path at $BASE with $test: build EXIT=$build, run EXIT=$run -> $verdict"
done < "$HERE/list.txt"
echo "tree clean: $([ -z "$(git status --porcelain)" ] && echo yes || echo no)"
