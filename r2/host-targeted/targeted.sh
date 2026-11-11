#!/bin/bash
# Round 2 targeted host checks for the spawnpath branch; each log records its revision, command and exit code.
S=<path>
mkdir -p "$S"
cd <path> || exit 2
rev=$(git rev-parse HEAD)
dirty=$(git status --porcelain --ignore-submodules=none | wc -l)
W=(-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone
   -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon)
run() {
  local name=$1; shift
  { echo "rev=$rev dirty=$dirty"; echo "cmd=$*"; "$@"; echo "exit=$?"; } > "$S/$name.log" 2>&1
  tail -1 "$S/$name.log" | sed "s/^/$name /"
}
run abi cargo test -p toyos-abi
run sdk cargo test -p toyos --lib spawn
run bootlog cargo test --lib bootlog
run checks cargo test --test toyos-checks
run clippy-abi cargo clippy -p toyos-abi --all-targets --target-dir target/clippy-abi -- -W clippy::undocumented_unsafe_blocks -D warnings
run clippy-sdk cargo clippy -p toyos --all-targets -- "${W[@]}" -D warnings
run clippy-build cargo clippy -p toyos-build --all-targets -- "${W[@]}" -D warnings
