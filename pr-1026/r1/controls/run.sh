#!/bin/zsh
W=<worktree>
M=<scratch>/mutations2r1
cd $W || exit 1
[ -z "$(git status --porcelain -- system/sshserver)" ] || { echo "sshserver not committed"; exit 1; }
echo "revision $(git rev-parse HEAD)"
for p in $M/c*.patch; do
  n=$(basename $p .patch)
  git apply --check $p || { echo "$n: does not apply"; exit 1; }
  git apply $p
  cargo test -p sshserver --no-run > $M/$n.build.log 2>&1; b=$?
  cargo test -p sshserver --no-fail-fast > $M/$n.test.log 2>&1; t=$?
  git apply -R $p
  echo "$n: build exit $b, test exit $t, failed: $(grep -E '^test .* FAILED$' $M/$n.test.log | sed 's/^test //;s/ \.\.\. FAILED//' | tr '\n' ' ')"
done
[ -z "$(git status --porcelain -- system/sshserver)" ] && echo "restored clean" || echo "NOT CLEAN"
