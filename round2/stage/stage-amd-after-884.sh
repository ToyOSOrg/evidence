#!/bin/sh
# PR #873's AMD shared-debug arms, which can run only once main carries #884's
# fix to the `iommu-firmware-left` ring (`amdvi/mod.rs`), whose overflow panics
# every shared-debug boot on the AMD bench. Run once #884 has landed: it stages
# head, m1, m3 and m4 from wt/toyos-pge merged with origin/main at that time,
# each with --metal-host '<user>@<amd-bench>', the placeholder the request's
# run commands carry. Exit 2 per arm is Verdict::Staged.
#
# 1. In the branch's worktree: git fetch origin && git merge origin/main, the
#    merge resolved, built (--ci host, cargo test, --build-only) and pushed.
#    That merged head is $HEAD below; the patches are re-checked against it.
set -u
S=<scratchpad>/pge-r2
M=$S/metal-amd
AMD='<user>@<amd-bench>'
HEAD_TREE=<dev>/toyos-pge
MUT_TREE=<dev>/toyos-pge-mut
HEAD=$(cd $HEAD_TREE && git rev-parse HEAD)
ROWS="a_global_kernel_leafs_discharge_drops_it a_kernel_half_shootdown_drops_a_global_kernel_translation a_user_half_shootdown_keeps_a_global_kernel_translation"
git -C $HEAD_TREE merge-base --is-ancestor origin/main HEAD || { echo "HEAD $HEAD does not contain origin/main: merge first"; exit 97; }
mkdir -p $M

stage() { # tree dir rows...
  tree=$1; dir=$2; shift 2
  [ -z "$(cd $tree && git status --porcelain --ignore-submodules=none)" ] || { echo "$dir: $tree is not clean"; exit 94; }
  (cd $tree && cargo test --test toyos-build -- --metal --metal-readback $M/$dir --metal-host "$AMD" "$@") > $M/$dir.stage.log 2>&1
  rc=$?
  echo "$dir: tree $(cd $tree && git rev-parse HEAD) rows $* EXIT=$rc"
}

mutate() { # patch dir rows...
  name=$1; p=$S/mut/$1.patch; dir=$2; shift 2
  cd $MUT_TREE || exit 90
  git checkout -q --detach $HEAD || exit 95
  git apply --check $p; rc=$?; echo "$name: git apply --check EXIT=$rc"
  [ $rc -eq 0 ] || exit 91
  git apply $p || exit 92
  printf 'MUTATION, never lands: %s\n' "$name" > $S/mut/$name.msg
  git commit -q -a -F $S/mut/$name.msg || exit 96
  echo "$name: committed locally as $(git rev-parse HEAD), never pushed"
  stage $MUT_TREE $dir "$@"
  cd $MUT_TREE && git checkout -q --detach $HEAD
  echo "$name: restored to $(git rev-parse HEAD); porcelain:"; git status --porcelain --ignore-submodules=none; echo "(end)"
}

echo "head $HEAD"
stage $HEAD_TREE head-amd $ROWS control_regs
mutate m1-nopcid-machine-flush-is-a-cr3-reload m1-amd $ROWS
mutate m3-no-global-arm-in-discharge m3-amd $ROWS
mutate m4-user-half-shootdown-flushes-global m4-amd $ROWS
echo ALL-DONE
