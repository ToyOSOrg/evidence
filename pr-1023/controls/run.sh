#!/bin/zsh
# Each control: apply checked, build, run toyos-ssh's tests, restore; the tree must end clean.
W=~/Dev/jan/toyos-ssh-adopt
M=~/.claude/jobs/2280e09e/tmp/scratchpad/agents/ssh/mutations3
cd $W || exit 1
[ -z "$(git status --porcelain)" ] || { echo "tree not clean"; exit 1; }
echo "revision $(git rev-parse HEAD)"
for p in $M/m*.patch; do
  n=$(basename $p .patch)
  git apply --check $p || { echo "$n: does not apply"; exit 1; }
  git apply $p
  cargo test -p toyos-ssh --no-run > $M/$n.build.log 2>&1; b=$?
  cargo test -p toyos-ssh --no-fail-fast > $M/$n.test.log 2>&1; t=$?
  git apply -R $p
  echo "$n: build exit $b, test exit $t, failed: $(grep -E '^test .* FAILED$' $M/$n.test.log | sed 's/^test //;s/ \.\.\. FAILED//' | tr '\n' ' ')"
done
[ -z "$(git status --porcelain)" ] && echo "restored clean" || echo "NOT CLEAN"
