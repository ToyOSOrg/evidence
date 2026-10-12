#!/bin/bash
# Each mutant applied as a checked patch, its tests run, its exit recorded,
# and the patch reversed: the tree is clean after each.
T=<worktree>
M=$(dirname "$0")
cd "$T" || exit 1
run() {
  name=$1; shift
  echo "=== $name: $*"
  git apply --check "$M/$name.patch" || { echo "PATCH DOES NOT APPLY"; return; }
  git apply "$M/$name.patch"
  "$@" > "$M/$name.log" 2>&1
  code=$?
  git apply -R "$M/$name.patch"
  grep -E "^test .* FAILED$|^error(\[|:)" "$M/$name.log" | head -5
  echo "EXIT=$code"
  echo "tree clean: $(git status --porcelain | wc -l | tr -d ' ') changed"
}
run s1-checksum cargo test -p toyos-aml --test load
run s1-method-exit-unwinds-static cargo test -p toyos-aml --test load
run s1-memory-type cargo test -p acpiserver osc_commits_only
run s1-commit-sends-the-claim cargo test -p acpiserver a_commit_sends
run s2-mmio-refused cargo test -p toyos-userbound --test firmware
run s2-mmio-cached-passes cargo test -p toyos-userbound --test firmware
run s2-smi-cmd-denied cargo test -p acpiserver host::tests
run s2-memory-write-denied cargo test -p acpiserver host::tests
run s3-functional-not-examined cargo test -p acpiserver init::tests
run s3-reg-before-ini cargo test -p acpiserver the_controllers_reg_runs
run s3-bridge-by-hid-dropped cargo test -p toyos-aml --test regions
run s3-glk-ignored cargo test -p acpiserver battery::tests
run s4-store-answers-its-source cargo test -p toyos-aml --test spaces
run s4-load-table-parameter-unstored cargo test -p toyos-aml --test load
run s5-refused-gpe-still-served cargo test -p acpiserver runtime_gpes
run s5-edge-status-uncleared cargo test -p acpiserver runtime_gpes
run s5-sleep-takes-no-press cargo test -p acpiserver sci::tests
run s6-mutexes-unbounded cargo test -p toyos-aml --test heap an_evaluation_holds
