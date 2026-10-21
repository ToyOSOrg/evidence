#!/bin/sh
# Usage: run.sh <patch> [cargo test args...]; applies, tests, reverts.
set -u
W=/Users/jan/Dev/jan/toyos-crypto-sec
P=$1; shift
N=$(basename "$P" .patch)
L=$(dirname "$P")/$N.log
cd "$W" || exit 99
git apply --check "$P" || { echo "$N: does not apply" ; exit 98; }
git apply "$P"
{ echo "== $N at $(git rev-parse HEAD), patch:"; cat "$P"; echo "== cargo test -p toyos-crypto $*"; } > "$L"
cargo test -p toyos-crypto "$@" --no-fail-fast >> "$L" 2>&1
code=$?
git apply -R "$P"
echo "== exit $code" >> "$L"
git diff --quiet -- lib/crypto/src || echo "$N: TREE NOT RESTORED"
built=$(grep -c "Running " "$L")
failed=$(grep -E "^test .* FAILED$|^    [a-z_:]+$" "$L" | sort -u | tr '\n' ' ')
echo "$N exit=$code test-binaries-run=$built failed: $failed"
