#!/bin/sh
# Each mutation: applied as a checked patch, its test run, the exit kept, restored.
W=/Users/jan/Dev/jan/toyos-ps2server
M=/Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/agents/899-fix1/mut
cd $W || exit 1
for p in "$@"; do
  name=$(basename $p .patch)
  case $name in
    m11*) cmd="cargo test -p toyos-manifest" ;;
    m12*|m13*) cmd="cargo test -p toyos-input" ;;
    *) cmd="cargo test --manifest-path system/ps2server/Cargo.toml" ;;
  esac
  git apply --check $p || { echo "$name: does not apply"; exit 1; }
  git apply $p
  echo "== $name: $cmd" > $M/$name.log
  git diff >> $M/$name.log
  $cmd >> $M/$name.log 2>&1
  echo "EXIT=$?" >> $M/$name.log
  git apply -R $p
  [ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "$name: tree not clean"; exit 1; }
  echo "$name $(tail -1 $M/$name.log)"
done
