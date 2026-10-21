#!/bin/sh
# Each mutation: check it applies, apply, build, run the tests that should catch it, restore.
cd ~/Dev/<user>/toyos-pkg || exit 2
S=~/.claude/jobs/<job>/tmp/scratchpad/agents/pkg/mutations
echo "revision $(git rev-parse HEAD)"
run() { name=$1; pkgarg=$2; filter=$3
  echo "=== $name: cargo test $pkgarg $filter"
  git apply --check $S/$name.patch || { echo "$name: does not apply"; return; }
  git apply $S/$name.patch
  cargo test $pkgarg --no-run >/dev/null 2>&1; echo "$name build exit $?"
  cargo test $pkgarg $filter > $S/$name.log 2>&1; echo "$name test exit $?"
  grep -E "^test .*(FAILED|ok)$|test result" $S/$name.log
  git apply -R $S/$name.patch
}
run room "-p pkg --lib" room
run link "-p pkg --lib" link
run beneath "-p pkg --lib" beneath
run replan "-p pkg --bin pkg" swapped
run truncation "-p pkg --lib" truncated
run drain "-p pkg --bin pkg" digest_covers
run reserve "-p fileserver --lib" room
run btree "-p bcachefs --lib" keys_below
run btree-nolower "-p bcachefs --lib" keys_below
echo "=== unmutated"
cargo test -p pkg 2>&1 | grep "test result"
cargo test -p bcachefs --lib keys_below 2>&1 | grep "test result"
git status --short
