#!/bin/sh
# PR #873 round 4: the head's three global-leaf rows and control_regs, and the
# m3 and m4 mutations, on the T14 and the AMD bench. Each `--metal-readback`
# run builds its images and writes <dir>/request.txt without touching a
# machine; exit 2 is Verdict::Staged. Every arm is its own directory.
# A mutation is a local commit on $HEAD in toyos-pge-mut, never pushed; the tree
# is restored to $HEAD and checked clean after each.
set -u
S=<path>
M=$S/metal
AMD='<user>@<amd-bench>'
HEAD=806130ce9a4a0e395391b1d3bcd90fab8d89fbde
HEAD_TREE=<path>
MUT_TREE=<path>
ROWS="a_global_kernel_leafs_discharge_drops_it a_kernel_half_shootdown_drops_a_global_kernel_translation a_user_half_shootdown_keeps_a_global_kernel_translation"
[ "$(git -C $HEAD_TREE rev-parse HEAD)" = "$HEAD" ] || { echo "wt/toyos-pge is not at $HEAD"; exit 98; }

stage() { # tree dir host rows...
  tree=$1; dir=$2; host=$3; shift 3
  [ -z "$(cd $tree && git status --porcelain --ignore-submodules=none)" ] || { echo "$dir: $tree is not clean"; exit 94; }
  [ ! -e $M/$dir ] || { echo "$dir: $M/$dir exists already"; exit 93; }
  if [ -n "$host" ]; then
    (cd $tree && cargo test --test toyos-build -- --metal --metal-readback $M/$dir --metal-host "$host" "$@") > $M/$dir.stage.log 2>&1
  else
    (cd $tree && cargo test --test toyos-build -- --metal --metal-readback $M/$dir "$@") > $M/$dir.stage.log 2>&1
  fi
  rc=$?
  echo "EXIT=$rc" >> $M/$dir.stage.log
  echo "$dir: tree $(cd $tree && git rev-parse HEAD) host ${host:-T14} rows $* EXIT=$rc"
}

mutate() { # patch dir host rows...
  name=$1; p=$S/mut/$1.patch; dir=$2; host=$3; shift 3
  cd $MUT_TREE || exit 90
  [ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "$name: $MUT_TREE is not clean"; exit 94; }
  git checkout -q --detach $HEAD || exit 95
  git apply --check $p; rc=$?; echo "$name: git apply --check EXIT=$rc"
  [ $rc -eq 0 ] || exit 91
  git apply $p || exit 92
  printf 'MUTATION, never lands: %s\n' "$name" > $S/mut/$name.msg
  git commit -q -a -F $S/mut/$name.msg || exit 96
  echo "$name: committed locally as $(git rev-parse HEAD), never pushed"
  stage $MUT_TREE $dir "$host" "$@"
  cd $MUT_TREE && git checkout -q --detach $HEAD
  echo "$name: restored to $(git rev-parse HEAD); porcelain:"; git status --porcelain --ignore-submodules=none; echo "(end)"
}

echo "head $HEAD"
stage $HEAD_TREE head-t14 "" $ROWS control_regs
stage $HEAD_TREE head-amd "$AMD" $ROWS control_regs
mutate m3-no-global-arm-in-discharge m3-t14 "" $ROWS
mutate m3-no-global-arm-in-discharge m3-amd "$AMD" $ROWS
mutate m4-user-half-shootdown-flushes-global m4-t14 "" $ROWS
mutate m4-user-half-shootdown-flushes-global m4-amd "$AMD" $ROWS
echo ALL-DONE
