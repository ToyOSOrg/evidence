#!/bin/bash
# Round 2 negative controls: each mutation is checked, applied, built, its claim's test run, then restored and rerun.
S=<path>
cd <path> || exit 2
control() {
  local patch=$1; shift
  echo "=== $patch at $(git rev-parse HEAD), $(git status --porcelain --ignore-submodules=none | wc -l | tr -d ' ') changed before"
  git apply --check "$S/$patch" && git apply "$S/$patch" || { echo "the patch does not apply"; return 2; }
  git diff --stat
  "$@"; echo "mutated exit=$?"
  git apply -R "$S/$patch"; echo "restore exit=$?"
  echo "changed after restore: $(git status --porcelain --ignore-submodules=none | wc -l | tr -d ' ')"
  "$@"; echo "restored exit=$?"
}
control sdk-label-keeps-control-characters.patch cargo test -p toyos --lib a_path_label_is_the_path_as_the_kernel_takes_one > "$S/control-sdk.log" 2>&1
control audio-start-takes-a-jobs-line.patch cargo test --test toyos-checks audio > "$S/control-audio.log" 2>&1
grep -h "^===\|exit=\|changed after" "$S/control-sdk.log" "$S/control-audio.log"
