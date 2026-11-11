#!/bin/bash
# The x86-64 kernel check at every commit of the rewritten #1252 range, under the
# `-Dwarnings` `.cargo/config.toml` gives that target. The old 150fcb847 runs first
# as the negative control: it should fail on the dead `user_str`.
# argv: <new head>. Summary in kcheck-range/summary.txt; one log per commit, each ending with its exit.
S=<scratch>
T=$S/rewt2
L=$S/kcheck-range2
NEW=$1
mkdir -p $L
cd $T || exit 1
: > $L/summary.txt
check() {
  local label=$1 c=$2
  git checkout -q --detach $c || { echo "$label $c checkout-failed" >> $L/summary.txt; return; }
  { echo "revision $(git rev-parse HEAD)"; echo "\$ cargo check -p kernel --target x86_64-unknown-none"
    cargo check -p kernel --target x86_64-unknown-none; echo "exit $?"; } > $L/$label-$(git rev-parse --short=9 HEAD).log 2>&1
  echo "$label $(git rev-parse --short=9 HEAD) $(tail -1 $L/$label-$(git rev-parse --short=9 HEAD).log)" >> $L/summary.txt
}
check control 150fcb847
i=0
for c in $(git rev-list --reverse origin/main..$NEW); do
  i=$((i + 1)); check $(printf 'new%02d' $i) $c
done
git checkout -q --detach $NEW
echo done >> $L/summary.txt
