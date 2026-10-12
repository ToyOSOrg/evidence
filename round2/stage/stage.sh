#!/bin/sh
# Stages PR #873 round 2's metal arms that can run now. Each `--metal-readback`
# run builds its images and writes <dir>/request.txt; exit 2 is
# Verdict::Staged. The AMD bench's shared-debug arms are not staged here: they
# wait for #884 (stage-amd-after-884.sh).
set -u
S=<scratchpad>/pge-r2
M=$S/metal
AMD='<user>@<amd-bench>'
HEAD=$(cd <dev>/toyos-pge && git rev-parse HEAD)
BASE_TREE=<dev>/toyos-pge-base
SCOUT_TREE=<dev>/toyos-pge-scout
HEAD_TREE=<dev>/toyos-pge
MUT_TREE=<dev>/toyos-pge-mut
ROWS="a_global_kernel_leafs_discharge_drops_it a_kernel_half_shootdown_drops_a_global_kernel_translation a_user_half_shootdown_keeps_a_global_kernel_translation"

stage() { # tree dir host rows...
  tree=$1; dir=$2; host=$3; shift 3
  if [ -n "$(cd $tree && git status --porcelain --ignore-submodules=none)" ]; then echo "$dir: $tree is not clean"; exit 94; fi
  if [ -n "$host" ]; then
    (cd $tree && cargo test --test toyos-build -- --metal --metal-readback $M/$dir --metal-host "$host" "$@") > $M/$dir.stage.log 2>&1
  else
    (cd $tree && cargo test --test toyos-build -- --metal --metal-readback $M/$dir "$@") > $M/$dir.stage.log 2>&1
  fi
  rc=$?
  echo "$dir: tree $(cd $tree && git rev-parse HEAD) rows $* EXIT=$rc"
}

mutate() { # patch dir host rows...
  name=$1; p=$S/mut/$1.patch; dir=$2; host=$3; shift 3
  cd $MUT_TREE || exit 90
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
# The T14: base and head of both measurement rows, the head's three new rows
# and control_regs, and the mutations m2, m3 and m4.
stage $BASE_TREE base-t14 "" scout_tlb_base tlb_shootdown_cost
stage $SCOUT_TREE scout-t14 "" scout_tlb_base tlb_shootdown_cost
stage $HEAD_TREE head-t14 "" $ROWS control_regs
mutate m2-invpcid-type-3-in-the-machine-flush m2-t14 "" $ROWS
mutate m3-no-global-arm-in-discharge m3-t14 "" $ROWS
mutate m4-user-half-shootdown-flushes-global m4-t14 "" $ROWS
# The AMD bench: base and head of both measurement rows, which need no
# shared-debug boot.
stage $BASE_TREE base-amd "$AMD" scout_tlb_base tlb_shootdown_cost
stage $SCOUT_TREE scout-amd "$AMD" scout_tlb_base tlb_shootdown_cost
echo ALL-DONE
