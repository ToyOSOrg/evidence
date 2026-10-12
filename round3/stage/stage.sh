#!/bin/sh
# PR #873 round 3: round 2's stage-amd-after-884.sh, adapted to the head merged
# with origin/main at ab655a115, which carries #884's fix to the
# `iommu-firmware-left` ring whose overflow panicked every AMD shared-debug boot.
# Each `--metal-readback` run builds its images and writes <dir>/request.txt
# without touching a machine; exit 2 is Verdict::Staged. Every arm is its own
# directory, so judging one never rebuilds another's image.
#
#   stage.sh mut   the AMD bench's m1, m3, m4, from toyos-pge-mut, each a local
#                  commit on $HEAD that is never pushed; the tree is restored
#                  to $HEAD and checked clean after each
#   stage.sh head  the AMD bench's head (the three global-leaf rows and
#                  control_regs) and the T14's, from toyos-pge at $HEAD
set -u
S=<scratchpad>/pge-r3
M=$S/metal
AMD='<user>@<amd-bench>'
HEAD=854509da16f87602436d99bf928fa65f63be3ec9
HEAD_TREE=<dev>/toyos-pge
MUT_TREE=<dev>/toyos-pge-mut
ROWS="a_global_kernel_leafs_discharge_drops_it a_kernel_half_shootdown_drops_a_global_kernel_translation a_user_half_shootdown_keeps_a_global_kernel_translation"
[ "$(git -C $HEAD_TREE rev-parse HEAD)" = "$HEAD" ] || { echo "wt/toyos-pge is not at $HEAD"; exit 98; }
git -C $HEAD_TREE merge-base --is-ancestor ecd6d1cc5 $HEAD || { echo "$HEAD does not contain #884"; exit 97; }
mkdir -p $M

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
case "${1:-}" in
  mut)
    mutate m1-nopcid-machine-flush-is-a-cr3-reload m1-amd "$AMD" $ROWS
    mutate m3-no-global-arm-in-discharge m3-amd "$AMD" $ROWS
    mutate m4-user-half-shootdown-flushes-global m4-amd "$AMD" $ROWS
    ;;
  head)
    stage $HEAD_TREE head-amd "$AMD" $ROWS control_regs
    stage $HEAD_TREE head-t14 "" $ROWS control_regs
    ;;
  *) echo "usage: stage.sh mut|head"; exit 64 ;;
esac
echo ALL-DONE
