#!/bin/bash
# At every commit of the rebased #1252 range: the x86-64 kernel under the `-Dwarnings`
# `.cargo/config.toml` gives that target, and the SDK with all its targets. The old
# 150fcb847 runs first as the kernel's negative control: it should fail on the dead `user_str`.
# argv: <new head>. Summary in kcheck-range5/summary.txt; one log per commit and check, each ending with its exit.
S=<scratch>
T=$S/rewt3
L=$S/kcheck-range5
NEW=$1
mkdir -p $L
cd $T || exit 1
: > $L/summary.txt
one() {
  local label=$1 what=$2; shift 2
  local log=$L/$label-$(git rev-parse --short=9 HEAD)-$what.log
  { echo "revision $(git rev-parse HEAD)"; echo "\$ $*"; "$@"; echo "exit $?"; } > $log 2>&1
  echo "$label $(git rev-parse --short=9 HEAD) $what $(tail -1 $log)" >> $L/summary.txt
}
check() {
  local label=$1 c=$2 sdk=$3
  git checkout -q --detach $c || { echo "$label $c checkout-failed" >> $L/summary.txt; return; }
  one $label kernel cargo check -p kernel --target x86_64-unknown-none
  [ "$sdk" = 1 ] && one $label sdk cargo check -p toyos --all-targets
}
check control 150fcb847 0
i=0
for c in $(git rev-list --reverse origin/main..$NEW); do
  i=$((i + 1)); check $(printf 'new%02d' $i) $c 1
done
git checkout -q --detach $NEW
echo done >> $L/summary.txt
