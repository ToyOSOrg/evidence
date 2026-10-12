#!/bin/sh
# Re-stages PR #873's AMD boots 2-8 and the T14's M2 boot into fresh
# directories, from the trees and mutation commits of $M/request.txt.
# Each `--metal-readback` run builds its images and writes <dir>/request.txt;
# exit 2 is Verdict::Staged. Nothing here touches a machine or an existing
# readback directory.
set -u
R=<scratchpad>/pge/restage
S=<scratchpad>/pge
M=$S/metal
AMD='<user>@<amd-bench>'
HEAD=363e0e84186184cce7bf7422ecb59f0029173d02
BASE_TREE=<path>
SCOUT_TREE=<path>
HEAD_TREE=<path>
MUT_TREE=<path>
ROWS_NEW="a_global_kernel_leafs_discharge_drops_it the_machine_flush_drops_a_global_kernel_translation"
mkdir -p $R/logs $M/amd2

stage() { # tree dir host rows...
  tree=$1; dir=$2; host=$3; shift 3
  log=$R/logs/$(echo $dir | tr / -).stage.log
  if [ -e $M/$dir ]; then echo "$dir: exists already, refused"; return 1; fi
  if [ -n "$(git -C $tree status --porcelain --ignore-submodules=none)" ]; then echo "$dir: $tree is not clean, refused"; return 1; fi
  t0=$(date -u +%s)
  if [ -n "$host" ]; then
    (cd $tree && cargo test --test toyos-build -- --metal --metal-readback $M/$dir --metal-host "$host" "$@") > $log 2>&1
  else
    (cd $tree && cargo test --test toyos-build -- --metal --metal-readback $M/$dir "$@") > $log 2>&1
  fi
  rc=$?
  t1=$(date -u +%s)
  echo "$dir: tree $tree at $(git -C $tree rev-parse HEAD) rows $* EXIT=$rc unix $t0..$t1"
}

mutate() { # name original-commit dir host
  name=$1; orig=$2; dir=$3; host=$4
  p=$S/mut/$name.patch
  [ "$(git -C $MUT_TREE rev-parse HEAD)" = "$HEAD" ] || { echo "$name: $MUT_TREE is not at $HEAD"; exit 90; }
  [ -z "$(git -C $MUT_TREE status --porcelain --ignore-submodules=none)" ] || { echo "$name: $MUT_TREE is not clean"; exit 90; }
  git -C $MUT_TREE apply --check $p; rc=$?; echo "$name: git apply --check EXIT=$rc"
  git -C $MUT_TREE apply $p || exit 91
  printf 'MUTATION, never lands: %s\n' "$name" > $R/$name.msg
  git -C $MUT_TREE commit -q -a -F $R/$name.msg || { git -C $MUT_TREE reset -q --hard $HEAD; exit 92; }
  tree=$(git -C $MUT_TREE rev-parse 'HEAD^{tree}'); want=$(git -C $MUT_TREE rev-parse "$orig^{tree}")
  echo "$name: committed locally as $(git -C $MUT_TREE rev-parse HEAD), never pushed; tree $tree, request's $orig tree $want"
  if [ "$tree" != "$want" ]; then echo "$name: TREE MISMATCH"; git -C $MUT_TREE reset -q --hard $HEAD; exit 93; fi
  stage $MUT_TREE $dir "$host" $ROWS_NEW
  git -C $MUT_TREE reset -q --hard $HEAD
  echo "$name: restored to $(git -C $MUT_TREE rev-parse HEAD); porcelain:"; git -C $MUT_TREE status --porcelain --ignore-submodules=none; echo "(end)"
}

stage $BASE_TREE amd2/base-amd "$AMD" tlb_shootdown_cost
stage $SCOUT_TREE amd2/scout-amd "$AMD" scout_tlb_base tlb_shootdown_cost
stage $HEAD_TREE amd2/head-amd "$AMD" $ROWS_NEW control_regs
mutate m1-nopcid-flush-is-a-cr3-reload f659b0d2a3abe050d9363bf4e3aa04c1a6e56d9f amd2/m1-amd "$AMD"
mutate m3-no-global-arm-in-discharge 7583f1f9787b27b3dd34f9a17dee9c4c0673b8a1 amd2/m3-amd "$AMD"
mutate m2-invpcid-type-3-in-the-machine-flush d83980e0072ad31882ecccf2a6a8b953e14694c3 m2-t14-r2 ""
for t in $BASE_TREE $SCOUT_TREE $HEAD_TREE $MUT_TREE; do
  echo "$t: $(git -C $t rev-parse HEAD); porcelain:"; git -C $t status --porcelain --ignore-submodules=none; echo "(end)"
done
echo ALL-DONE
