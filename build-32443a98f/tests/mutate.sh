#!/bin/zsh
# Each patch: checked, applied, the fenced modules' lib tests run, the exit recorded, restored; the tree is clean after each.
# A patch the type refuses fails to compile: its compiler errors are printed here from its log.
SB=${0:A:h}
WT=/Users/jan/Dev/jan/toyos-storebound
cd $WT || exit 2
echo "head $(git rev-parse HEAD)"
[ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "tree not clean"; exit 2; }
run() {
  cargo test --lib -- keystore:: compiler:: llvm:: sysroot:: > $SB/logs/$1.log 2>&1
  echo "$1 EXIT=$?"
}
mkdir -p $SB/logs
run green
for p in negative-control m1-no-reread m2-keeps-one-fewer m3-keeps-one-more m4-takes-keys-in-use m5-newest-first m6-ranks-half-made m7-lock-unbound m8-lock-dropped-before-removal; do
  git apply --check $SB/patches/$p.patch || { echo "$p does not apply"; exit 2; }
  git apply $SB/patches/$p.patch
  if [ $p = negative-control ]; then
    echo "negative-control: build/ against base 528b9a6c2, which differs only in the test modules and the test-only kept table:"
    git diff 528b9a6c2 --stat -- build/
  fi
  run $p
  grep -n '^error' $SB/logs/$p.log | sed "s/^/  $p compiler: /"
  grep -n 'test result: \|^failures:$\|^    [a-z_:]*$' $SB/logs/$p.log | sed "s/^/  $p tests: /"
  git apply -R $SB/patches/$p.patch
  [ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "$p left the tree dirty"; exit 2; }
done
echo "tree clean at $(git rev-parse HEAD)"
