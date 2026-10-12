#!/bin/sh
# Every metal arm of #886's `microcode` row, staged with --metal-readback and
# touching no machine. Each mutation is a checked patch, committed on a
# detached HEAD that is never pushed, staged, and left: the branch is checked
# out again with the porcelain empty. Exit 2 per arm is Verdict::Staged.
set -u
S=/Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/agents/886-r2
M=$S/metal
W=/Users/jan/Dev/jan/toyos-microcode
AMD='<user>@<amd-bench>'
BRANCH=wt/toyos-microcode
cd $W || exit 90
HEAD=$(git rev-parse HEAD)
BASE=5096551ca63d235b7bce904798b8c5be8378bd3f  # origin/main merged at this head
git merge-base --is-ancestor $BASE HEAD || { echo "HEAD does not contain origin/main"; exit 97; }
clean() { [ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "$1: tree not clean"; git status --porcelain; exit 94; }; }

stage() { # dir host
  dir=$1; host=$2
  clean $dir
  if [ -n "$host" ]; then
    cargo test --test toyos-build -- --metal --metal-readback $M/$dir --metal-host "$host" microcode > $M/$dir.stage.log 2>&1
  else
    cargo test --test toyos-build -- --metal --metal-readback $M/$dir microcode > $M/$dir.stage.log 2>&1
  fi
  rc=$?; echo "EXIT=$rc" >> $M/$dir.stage.log
  echo "$dir: tree $(git rev-parse HEAD) host ${host:-T14} EXIT=$rc"
}

commit_mutation() { # name
  printf 'MUTATION, never lands: %s, on %s\n' "$1" "$HEAD" > $M/$1.msg
  git add -A && git commit -q -F $M/$1.msg || exit 96
  echo "$1: committed locally as $(git rev-parse HEAD), never pushed"
}

mutate() { # name dir host
  name=$1; dir=$2; host=$3
  git checkout -q --detach $HEAD || exit 95
  git apply --check $M/$name.patch; rc=$?; echo "$name: git apply --check EXIT=$rc"
  [ $rc -eq 0 ] || exit 91
  git apply --binary $M/$name.patch || exit 92
  commit_mutation $name
  stage $dir "$host"
  git checkout -q $BRANCH || exit 98
  clean "$name restored"
  echo "$name: restored to $(git rev-parse HEAD); porcelain empty"
}

clean start
echo "head $HEAD, base origin/main $BASE"
# The patches, written against HEAD and checked before each use.
for m in m1-t14-reseal m2-amd-trigger-removed m4-amd-no-invlpg; do
  python3 -I $M/make.py $m || exit 93
  git diff --binary > $M/$m.patch
  git checkout -q -- .
done
# The whole change reverted: every production path back to origin/main, the
# tests, the row and its fixtures kept.
git diff --binary HEAD $BASE -- kernel build NOTICE licenses Cargo.lock > $M/m3-whole-change-reverted.patch
clean patches

# Every arm, or the ones the arguments name.
for arm in ${@:-t14-head amd-head t14-reseal amd-trigger-removed t14-reverted amd-reverted amd-no-invlpg}; do
  case $arm in
    t14-head) stage t14-head "" ;;
    amd-head) stage amd-head "$AMD" ;;
    t14-reseal) mutate m1-t14-reseal t14-reseal "" ;;
    amd-trigger-removed) mutate m2-amd-trigger-removed amd-trigger-removed "$AMD" ;;
    t14-reverted) mutate m3-whole-change-reverted t14-reverted "" ;;
    amd-reverted) mutate m3-whole-change-reverted amd-reverted "$AMD" ;;
    # Reported, never gated: the boot's phase times without family 0x17's INVLPG.
    amd-no-invlpg) mutate m4-amd-no-invlpg amd-no-invlpg "$AMD" ;;
    *) echo "no arm $arm"; exit 99 ;;
  esac
done
echo ALL-DONE
