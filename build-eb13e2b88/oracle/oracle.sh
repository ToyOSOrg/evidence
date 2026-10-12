#!/bin/zsh
# The independent oracle: the host store's physical extents (physdu.py), df and a census before
# and after the first sweep under this branch's code, which a patched build triggers by placing a
# fresh sysroot key. The patch is checked, applied, built and reverted here; the tree is left clean.
zmodload zsh/datetime
OR=${0:A:h}
WT=/Users/jan/Dev/jan/toyos-storebound
store=$HOME/.cache/toyos
cd $WT || exit 2
echo "head $(git rev-parse HEAD)"
[ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "tree not clean"; exit 2; }
git apply --check $OR/fresh-sysroot.patch || { echo "patch does not apply"; exit 2; }

python3 -I /private/tmp/claude-502/-Users-jan-Dev-jan-toyos/80e90c3a-7449-46b8-84cc-b59e9dd31ae9/scratchpad/physdu.py $store 2 $OR/physdu-before.json > $OR/physdu-before.txt 2>&1; echo "physdu-before EXIT=$? at $(date -u +%FT%TZ)"
$OR/perkind.sh $OR/physdu-before.txt > $OR/perkind-before.txt 2>&1; echo "perkind-before EXIT=$?"
lsof +D $store/locks > $OR/locks-open-before.txt 2>&1; echo "lsof-before EXIT=$? (1: no lock file open)"
$OR/census.sh > $OR/census-before.txt 2>&1; echo "census-before EXIT=$?"
$OR/workingset.sh $OR/census-before.txt > $OR/workingset-before.txt 2>&1; echo "workingset-before EXIT=$?"
df -k $store > $OR/df-before.txt 2>&1; echo "df-before EXIT=$? at $(date -u +%FT%TZ)"

git apply $OR/fresh-sysroot.patch
echo "build start $EPOCHREALTIME"
swept=0; marked=0
cargo run -- --build-only 2>&1 | while IFS= read -r line; do
  print -r -- "$EPOCHREALTIME $line"
  if [[ $line == "Removed sysroot "* ]]; then
    swept=1
  elif (( swept && ! marked )); then
    marked=1
    df -k $store > $OR/df-at-sweep-end.txt 2>&1
    $OR/census.sh > $OR/census-at-sweep-end.txt 2>&1
  fi
done > $OR/build-fresh-sysroot.log
build=${pipestatus[1]}
echo "build EXIT=$build end $EPOCHREALTIME"
git apply -R $OR/fresh-sysroot.patch
[ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "the patch left the tree dirty"; exit 2; }
echo "tree clean at $(git rev-parse HEAD)"

df -k $store > $OR/df-after.txt 2>&1; echo "df-after EXIT=$? at $(date -u +%FT%TZ)"
$OR/census.sh > $OR/census-after.txt 2>&1; echo "census-after EXIT=$?"
$OR/workingset.sh $OR/census-after.txt > $OR/workingset-after.txt 2>&1; echo "workingset-after EXIT=$?"
lsof +D $store/locks > $OR/locks-open-after.txt 2>&1; echo "lsof-after EXIT=$? (1: no lock file open)"
python3 -I /private/tmp/claude-502/-Users-jan-Dev-jan-toyos/80e90c3a-7449-46b8-84cc-b59e9dd31ae9/scratchpad/physdu.py $store 2 $OR/physdu-after.json > $OR/physdu-after.txt 2>&1; echo "physdu-after EXIT=$? at $(date -u +%FT%TZ)"
$OR/perkind.sh $OR/physdu-after.txt > $OR/perkind-after.txt 2>&1; echo "perkind-after EXIT=$?"
exit $build
