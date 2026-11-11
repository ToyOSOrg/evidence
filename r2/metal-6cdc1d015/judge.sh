#!/bin/bash
# Judge process_tree's T14 readback from this worktree detached at the image's revision, then return it to its branch.
S=<path>
cd <path> || exit 2
{
  git checkout -q --detach 6cdc1d0159c814b4f7a91b928a724beca7b923cf || { echo "checkout failed"; exit 2; }
  echo "rev=$(git rev-parse HEAD) changed=$(git status --porcelain --ignore-submodules=none | wc -l | tr -d ' ')"
  cargo test --test toyos-build -- --metal --metal-readback "$S/metal" process_tree
  code=$?
  echo "exit=$code"
  git checkout -q spawnpath && echo "back on $(git rev-parse --abbrev-ref HEAD) at $(git rev-parse HEAD)"
} > "$S/r2/judge.log" 2>&1
grep "^exit=\|^back on" "$S/r2/judge.log"
