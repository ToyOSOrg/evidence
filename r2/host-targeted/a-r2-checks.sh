#!/bin/bash
# A round 2: targeted tests and clippy at the committed head, then the
# controls (patches and the CI's blockring features).
S=<path>
W=$S/wt-client; E=$S/client-ev/r2
mkdir -p $E; cd $W || exit 9
[ -z "$(git status --porcelain)" ] || { echo "worktree not clean"; exit 9; }
git rev-parse HEAD > $E/revision.txt
L="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon -D warnings"
{ echo "\$ cargo test -p toyos-blockring -p diskserver -p toyos"; cargo test -p toyos-blockring -p diskserver -p toyos 2>&1; echo "exit $?"; } > $E/test.log
echo "test: $(tail -1 $E/test.log)"
{ echo "\$ cargo clippy -p toyos-blockring -p toyos --all-targets -- $L"; cargo clippy -p toyos-blockring -p toyos --all-targets -- $L 2>&1; echo "exit $?"; } > $E/clippy.log
echo "clippy: $(tail -1 $E/clippy.log)"
{ echo "\$ cargo clippy -p diskserver --all-targets -- $L"; cargo clippy -p diskserver --all-targets -- $L 2>&1; echo "exit $?"; } > $E/clippy-diskserver.log
echo "clippy diskserver: $(tail -1 $E/clippy-diskserver.log)"
$S/scripts/a-controls.sh
for f in mutate-session-end-forgets mutate-abort-keeps-inflight mutate-no-reissue-after-loss; do
  { echo "\$ cargo test -p toyos-blockring --lib --features $f"; cargo test -p toyos-blockring --lib --features $f 2>&1; echo "exit $?"; } > $E/feature-$f.log
  echo "$f: $(tail -1 $E/feature-$f.log); $(grep '\.\.\. FAILED' $E/feature-$f.log | tr '\n' ' ')"
done
