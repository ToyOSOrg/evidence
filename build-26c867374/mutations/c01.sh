#!/bin/sh
# The whole change reverted onto the base, the tests kept: the smoke test must go red.
W=<path>
M=<path>
P=$M/c01-whole-change-reverted.patch
L=$M/c01-whole-change-reverted.log
cd $W || exit 1
git apply --check $P || exit 1
git apply $P
echo "== c01: the production half of $(git rev-parse HEAD) reverted onto $(git merge-base HEAD origin/main); cargo test -- console_image_boots" > $L
cargo test -- console_image_boots >> $L 2>&1
echo "EXIT=$?" >> $L
git apply -R $P
[ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "c01: tree not clean"; git status --porcelain; exit 1; }
tail -1 $L
