#!/bin/bash
# Scratch: each portable-path mutation as a checked patch on the worktree,
# built and tested under Rosetta (portable four words), then restored.
cd ~/Dev/jan/toyos-crypto-25519
S=~/.claude/jobs/2280e09e/tmp/scratchpad/agents/crypto-25519
for m in "$@"; do
  git diff --quiet || { echo "worktree dirty"; exit 2; }
  git apply --check $S/controls/$m.patch || { echo "$m: patch does not apply"; exit 2; }
  git apply $S/controls/$m.patch
  cargo build -p toyos-crypto --features std,sign,wpa2 --target x86_64-apple-darwin > $S/logs/control-$m-build.log 2>&1; b=$?
  cargo test -p toyos-crypto --features std,sign,wpa2 --profile toyos --target x86_64-apple-darwin --lib -- --skip the_register_saving_sha256_block > $S/logs/control-$m.log 2>&1; r=$?
  git apply -R $S/controls/$m.patch
  echo "$m build=$b test=$r $(grep -c FAILED $S/logs/control-$m.log) FAILED lines; $(grep '^test result' $S/logs/control-$m.log)"
  grep -E '^    [a-z_:0-9]+$' $S/logs/control-$m.log | sed 's/^/    failed: /'
done
git diff --quiet && echo restored
