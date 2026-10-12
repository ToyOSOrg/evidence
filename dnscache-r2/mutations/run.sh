#!/bin/bash
# Each patch: checked, applied, built, the gate's test run alone, restored.
WT=<home>/Dev/jan/toyos-dnscache
M=<home>/.claude/jobs/2280e09e/tmp/scratchpad/dnscache-r2/mutations
TEST=build::tests::a_received_name_reaches_a_server_that_runs_and_never_its_own
cd "$WT" || exit 9
echo "head $(git rev-parse HEAD)"
run() {
  cargo test --lib -- --exact "$TEST" > "$M/$1.log" 2>&1
  local rc=$?
  local ran; ran=$(grep -c "^test $TEST \.\.\. " "$M/$1.log")
  echo "$1 EXIT=$rc ran=$ran $(grep "^test $TEST" "$M/$1.log")"
}
run baseline
for p in "$M"/m*.patch; do
  n=$(basename "$p" .patch)
  git apply --check "$p" || { echo "$n DOES NOT APPLY"; continue; }
  git apply "$p"
  run "$n"
  git apply -R "$p"
  [ -z "$(git status --porcelain)" ] || { echo "TREE NOT CLEAN after $n"; exit 8; }
done
echo "tree clean: $(git status --porcelain | wc -l | tr -d ' ') changes"
