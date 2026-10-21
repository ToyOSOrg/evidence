#!/bin/sh
cd ~/Dev/<user>/toyos-pkg || exit 2
S=~/.claude/jobs/<job>/tmp/scratchpad/agents/pkg/mutations
echo "revision $(git rev-parse HEAD)"
for name in btree-revert btree-early; do
  echo "=== $name"
  git apply --check $S/$name.patch || { echo "$name: does not apply"; continue; }
  git apply $S/$name.patch
  cargo test -p bcachefs --lib --no-run >/dev/null 2>&1; echo "$name build exit $?"
  for t in keys_below the_tree_agrees; do
    cargo test -p bcachefs --lib $t > $S/$name-$t.log 2>&1; echo "$name $t exit $?"
    grep -E "^test .*(FAILED|ok)$|panicked at|not found|not strictly|other keys" $S/$name-$t.log | head -3
  done
  git apply -R $S/$name.patch
done
echo "=== unmutated"
cargo test -p bcachefs --lib 2>&1 | grep "test result"
git status --short
