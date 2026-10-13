#!/bin/sh
# The whole change reverted onto the base, the tests kept: the smoke test must go red.
W=/Users/jan/Dev/jan/toyos-ps2server
M=/Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/agents/899-fix1/mut
P=$M/c01-whole-change-reverted.patch
L=$M/c01-whole-change-reverted.log
cd $W || exit 1
git apply --check $P || exit 1
git apply $P
echo "== c01: the production half of $(git rev-parse HEAD) reverted onto $(git merge-base HEAD origin/main); cargo test -- console_image_boots" > $L
cargo test -- console_image_boots >> $L 2>&1
echo "EXIT=$?" >> $L
git apply -R $P
# Files the reverse made fresh, which the apply had deleted and the reverse put back, are tracked again.
[ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "c01: tree not clean"; git status --porcelain; exit 1; }
tail -1 $L
