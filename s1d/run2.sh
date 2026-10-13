#!/bin/sh
S=<scratch>
cd <worktree> || exit 1
T='cargo test -p fileserver --lib an_append_stopped'
log=$S/negative-control.log
{ echo "HEAD=$(git rev-parse HEAD)"; echo "ARM=the fileserver barrier reverted (the production change to fat.rs, whole)"; echo "CMD=$T"; } > $log
git apply $S/negative-control.patch && git diff >> $log
$T >> $log 2>&1; echo "EXIT=$?" >> $log
git apply -R $S/negative-control.patch
[ -z "$(git status --porcelain --ignore-submodules=none)" ] && echo RESTORED_CLEAN=yes >> $log || echo RESTORED_CLEAN=no >> $log
