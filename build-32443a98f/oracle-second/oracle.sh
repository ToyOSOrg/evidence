#!/bin/zsh
# The independent oracle at this head, a second placement after oracle/'s: the host store's physical extents
# (physdu.py), df, a census and the open key locks before a sweep, at its end and after it, which a patched
# build triggers by placing a fresh sysroot key; and before the build, predict.sh's census-only reading of
# which sysroots that sweep removes, compared after it with those the build log names. Every helper runs from its committed path in this evidence clone, checked against the commit
# that holds it. The patch is checked, applied, built and reverted here; the tree is left clean.
zmodload zsh/datetime
OR=${0:A:h}
EV=${OR:h:h}
WT=/Users/jan/Dev/jan/toyos-storebound
store=$HOME/.cache/toyos
PHYSDU=$EV/design/physdu.py
HELP=$EV/build-eb13e2b88/oracle
cd $WT || exit 2
echo "head $(git rev-parse HEAD)"
[ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "tree not clean"; exit 2; }
git apply --check $OR/fresh-sysroot.patch || { echo "patch does not apply"; exit 2; }

# The copy that runs is the committed blob: its git hash against the commit's, and its sha256.
committed() {
  local rel=${1#$EV/} at=$2 blob ran
  blob=$(git -C $EV rev-parse $at:$rel) ran=$(git -C $EV hash-object $1)
  echo "$rel: committed at $at as blob $blob; the copy that runs is blob $ran, sha256 $(shasum -a 256 $1 | cut -d' ' -f1)"
  [ "$blob" = "$ran" ] || { echo "$rel differs from its committed copy"; exit 2; }
}
committed $PHYSDU 75d48526da52b6caf2535b2ee4a3ec029fac86ca
for h in census.sh perkind.sh workingset.sh; do committed $HELP/$h 25304576dbc746a5da1e86c913a4825bf475c634; done

# Who holds a key lock: lsof's listing (its exit is 1 whenever any lock file is closed: ../first-sweep/lsof-exit-probe.txt),
# and for each holder its start, command line and working directory.
holders() {
  lsof +D $store/locks > $OR/locks-open-$1.txt 2>&1; echo "lsof-$1 EXIT=$? at $EPOCHREALTIME, $(( $(wc -l < $OR/locks-open-$1.txt) > 0 ? $(wc -l < $OR/locks-open-$1.txt) - 1 : 0 )) lock(s) open"
  for pid in $(awk 'NR>1 {print $2}' $OR/locks-open-$1.txt | sort -u); do
    ps -o pid=,ppid=,lstart=,command= -p $pid
    lsof -a -p $pid -d cwd -Fn | awk '/^n/ {print "  cwd " substr($0, 2)}'
  done > $OR/holders-$1.txt 2>&1
  ps -Ao pid,ppid,lstart,command | awk 'NR==1 || /toyos-build|toyos_build-/ && !/awk/' > $OR/builds-running-$1.txt 2>&1
}

python3 -I $PHYSDU $store 2 $OR/physdu-before.json > $OR/physdu-before.txt 2>&1; echo "physdu-before EXIT=$? at $(date -u +%FT%TZ)"
$HELP/perkind.sh $OR/physdu-before.txt > $OR/perkind-before.txt 2>&1; echo "perkind-before EXIT=$?"
holders before
$HELP/census.sh > $OR/census-before.txt 2>&1; echo "census-before EXIT=$?"
$HELP/workingset.sh $OR/census-before.txt > $OR/workingset-before.txt 2>&1; echo "workingset-before EXIT=$?"
df -k $store > $OR/df-before.txt 2>&1; echo "df-before EXIT=$? at $(date -u +%FT%TZ)"
$OR/predict.sh $OR/census-before.txt 24 $OR/locks-open-before.txt > $OR/predicted.txt 2>&1; echo "predict EXIT=$?: $(head -n 1 $OR/predicted.txt)"

git apply $OR/fresh-sysroot.patch
echo "build start $EPOCHREALTIME"
swept=0; marked=0
cargo run -- --build-only 2>&1 | while IFS= read -r line; do
  print -r -- "$EPOCHREALTIME $line"
  if [[ $line == *"Removed sysroot "* ]]; then
    swept=1
  elif (( swept && ! marked )); then
    marked=1
    holders sweep-end > /dev/null 2>&1
    df -k $store > $OR/df-sweep-end.txt 2>&1
    $HELP/census.sh > $OR/census-sweep-end.txt 2>&1
  fi
done > $OR/build-fresh-sysroot.log
build=${pipestatus[1]}
echo "build EXIT=$build end $EPOCHREALTIME; sweep-end readings taken: $([ -s $OR/census-sweep-end.txt ] && echo yes || echo no)"
git apply -R $OR/fresh-sysroot.patch
[ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "the patch left the tree dirty"; exit 2; }
echo "tree clean at $(git rev-parse HEAD)"

df -k $store > $OR/df-after.txt 2>&1; echo "df-after EXIT=$? at $(date -u +%FT%TZ)"
$HELP/census.sh > $OR/census-after.txt 2>&1; echo "census-after EXIT=$?"
$HELP/workingset.sh $OR/census-after.txt > $OR/workingset-after.txt 2>&1; echo "workingset-after EXIT=$?"
holders after
python3 -I $PHYSDU $store 2 $OR/physdu-after.json > $OR/physdu-after.txt 2>&1; echo "physdu-after EXIT=$? at $(date -u +%FT%TZ)"
$HELP/perkind.sh $OR/physdu-after.txt > $OR/perkind-after.txt 2>&1; echo "perkind-after EXIT=$?"
$OR/censusdiff.sh $OR/census-before.txt $OR/census-after.txt > $OR/census-diff.txt 2>&1; echo "censusdiff EXIT=$?"
placed=($(awk '$1=="placed" && $2=="sysroots" {print $3}' $OR/census-diff.txt))
for p in $store/sysroots/$^placed $store/locks/sysroots/$^placed $store/sysroots; do stat -f '%N ctime=%Fc mtime=%Fm birth=%FB' $p; done > $OR/sweep-times.txt 2>&1
echo "sweep-times EXIT=$? (placed sysroots: ${placed:-none})"
awk '/^goes/ {print $2}' $OR/predicted.txt | sort > $OR/predicted-goes.txt
grep -o 'Removed sysroot [^:]*' $OR/build-fresh-sysroot.log | awk -F/ '{print $NF}' | sort > $OR/removed.txt
echo "predicted $(wc -l < $OR/predicted-goes.txt | tr -d ' ') to go, the build removed $(wc -l < $OR/removed.txt | tr -d ' ')"
diff $OR/predicted-goes.txt $OR/removed.txt; echo "diff predicted removed EXIT=$?"
committed $PHYSDU 75d48526da52b6caf2535b2ee4a3ec029fac86ca
exit $build
