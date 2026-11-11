#!/bin/bash
# Targeted host checks for the spawnpath branch; each log records its revision and exit code.
S=<path>
cd <path> || exit 2
rev=$(git rev-parse HEAD)
run() {
  local name=$1; shift
  { echo "rev=$rev"; echo "cmd=$*"; "$@"; echo "exit=$?"; } > "$S/$name.log" 2>&1
  tail -1 "$S/$name.log" | sed "s/^/$name /"
}
run t-abi cargo test -p toyos-abi
run t-bootlog cargo test --lib bootlog
