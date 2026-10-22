#!/bin/sh
# Usage: forms.sh <worktree> <log>: builds, then times each crypto form's tests.
cd "$1" || exit 99
for f in "--features std,sign,wpa2,rustls-provider" "--all-features" ""; do
  cargo test -p toyos-crypto $f --no-run > /dev/null 2>&1 || { echo "build failed: $f"; exit 1; }
done
for f in "--features std,sign,wpa2,rustls-provider" "--all-features" ""; do
  echo "== form: ${f:-default features}"
  /usr/bin/time -p cargo test -p toyos-crypto $f 2>&1 | grep -E "test result|^real|^user|^sys|FAILED"
done
