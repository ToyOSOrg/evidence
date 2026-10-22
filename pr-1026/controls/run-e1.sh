#!/bin/zsh
# The flow-control control through the end-to-end instrument: apply checked, build, run, restore.
W=~/Dev/jan/toyos-ssh-adopt
M=~/.claude/jobs/2280e09e/tmp/scratchpad/agents/ssh/mutations2
E=~/.claude/jobs/2280e09e/tmp/scratchpad/agents/ssh/e2e
cd $W || exit 1
[ -z "$(git status --porcelain)" ] || { echo "tree not clean"; exit 1; }
echo "revision $(git rev-parse HEAD)"
p=$M/e1-partial-send-dropped.patch; n=e1-partial-send-dropped
git apply --check $p || { echo "$n: does not apply"; exit 1; }
git apply $p
cargo build -p sshserver > $M/$n.build.log 2>&1; b=$?
(cd $E && ./run-short.sh > $M/$n.e2e.log 2>&1); t=$?
git apply -R $p
cargo build -p sshserver > /dev/null 2>&1
echo "$n: build exit $b, e2e exit $t: $(grep -E 'same: NO' $M/$n.e2e.log | tr '\n' ';')"
[ -z "$(git status --porcelain)" ] && echo "restored clean" || echo "NOT CLEAN"
