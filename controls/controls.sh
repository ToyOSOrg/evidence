#!/bin/sh
# Each control of the session models: `cargo test -p toyos-transport --features <control> --test loom`,
# every session case, its exit code. Paths masked: the worktree as <tree>, home as ~.
T=$1
O=$2
cd "$T" || exit 1
echo "head $(git rev-parse HEAD), $(rustc --version)"
mask() { sed -e "s|$T|<tree>|g" -e "s|$HOME|~|g" "$1"; }
CASES="two_sleepers a_poll_beside a_source_registered"
run() {
  echo "=== $1"
  cargo test -p toyos-transport $2 --test loom -- $CASES > "$O/run.out" 2>&1
  e=$?
  grep -E '^test |test result' "$O/run.out" | sort
  echo "=== $1 EXIT=$e"
}
run "no control" ""
for c in one-doorbell no-pass-on register-no-arm register-no-ring register-neither want-relaxed head-only; do
  run "$c" "--features $c"
done
