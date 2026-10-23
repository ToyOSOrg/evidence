#!/bin/sh
# Applies each mutation, runs the verdict tests, records the exit code, restores.
cd ~/Dev/jan/toyos-ed25519-rules/lib/crypto || exit 1
D=~/.claude/jobs/2280e09e/tmp/scratchpad/agents/ed25519-rules/mutations
echo "revision $(git rev-parse HEAD) + working tree"
for p in $D/m*.patch; do
  n=$(basename $p .patch)
  git apply $p || { echo "$n: did not apply"; exit 1; }
  cargo build --features portable,sign --tests > $D/$n.build.log 2>&1; b=$?
  cargo test --features portable,sign --test ed25519_verdicts > $D/$n.log 2>&1; t=$?
  git apply -R $p || { echo "$n: did not restore"; exit 1; }
  echo "$n: build exit $b, test exit $t; failed: $(grep -E '^test .* FAILED' $D/$n.log | sed 's/^test //; s/ \.\.\. FAILED//' | tr '\n' ' ')"
done
git diff --quiet -- src && echo "src restored"
