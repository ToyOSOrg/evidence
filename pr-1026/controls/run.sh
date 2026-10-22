#!/bin/zsh
# Each control: apply checked, build, run the tests that hold it, restore; the tree must end clean.
W=<worktree>
M=<scratch>/mutations2
E=<scratch>/e2e
cd $W || exit 1
[ -z "$(git status --porcelain)" ] || { echo "tree not clean"; exit 1; }
echo "revision $(git rev-parse HEAD)"
for p in $M/m*.patch; do
  n=$(basename $p .patch)
  git apply --check $p || { echo "$n: does not apply"; exit 1; }
  git apply $p
  cargo test -p toyos-ssh -p sshserver --no-run > $M/$n.build.log 2>&1; b=$?
  cargo test -p toyos-ssh -p sshserver --no-fail-fast > $M/$n.test.log 2>&1; t=$?
  git apply -R $p
  echo "$n: build exit $b, test exit $t, failed: $(grep -E '^test .* FAILED$' $M/$n.test.log | sed 's/^test //;s/ \.\.\. FAILED//' | tr '\n' ' ')"
done
for p in $M/e*.patch; do
  n=$(basename $p .patch)
  git apply --check $p || { echo "$n: does not apply"; exit 1; }
  git apply $p
  cargo build -p sshserver > $M/$n.build.log 2>&1; b=$?
  (cd $E && ./run-short.sh > $M/$n.e2e.log 2>&1); t=$?
  git apply -R $p
  echo "$n: build exit $b, e2e exit $t: $(grep -E 'same: NO|exit [1-9]' $M/$n.e2e.log | tr '\n' ';')"
done
cargo build -p sshserver > /dev/null 2>&1
[ -z "$(git status --porcelain)" ] && echo "restored clean" || echo "NOT CLEAN"
