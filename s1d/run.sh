#!/bin/sh
# Each arm: apply, build+run, report exit, restore, check clean.
S=<scratch>
W=<worktree>
cd $W || exit 1
T='cargo test -p fileserver --lib an_append_stopped'
arm() { # name, setup, restore
  name=$1; shift
  log=$S/$name.log
  { echo "HEAD=$(git rev-parse HEAD)"; echo "ARM=$name"; echo "SETUP=$1"; echo "CMD=$T"; } > $log
  sh -c "$1" >> $log 2>&1 || { echo "SETUP FAILED" >> $log; return; }
  git diff >> $log
  $T >> $log 2>&1; echo "EXIT=$?" >> $log
  sh -c "$2" >> $log 2>&1
  [ -z "$(git status --porcelain --ignore-submodules=none)" ] && echo RESTORED_CLEAN=yes >> $log || echo RESTORED_CLEAN=no >> $log
}
arm b-at-17ea52983 "git checkout 17ea52983 -- system/fileserver/src/fat.rs && git apply $S/b-record-meta.patch" \
  "git apply -R $S/b-record-meta.patch && git checkout HEAD -- system/fileserver/src/fat.rs"
arm b-tightened "git apply $S/b-record-meta.patch" "git apply -R $S/b-record-meta.patch"
arm three-names "git apply $S/three-names.patch" "git apply -R $S/three-names.patch"
echo ALLDONE > $S/run.done
