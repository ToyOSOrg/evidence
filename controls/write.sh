#!/bin/sh
# The write-after-reset case, green and under its control (checked patch, reverted). Paths masked.
T=$1; D=$2; cd "$T" || exit 1
mask() { sed -e "s|$T|<tree>|g" -e "s|$D|<dir>|g" -e "s|$HOME|~|g"; }
echo "head $(git rev-parse HEAD)"
git status --porcelain --ignore-submodules=none | grep . && exit 2
C="cargo test -p toyos-transport --lib session::tests::a_write_with_room_after_a_reset_answers_it_and_copies_nothing -- --exact"
$C > "$D/o" 2>&1; e=$?; grep -E '^test |test result' "$D/o" | mask; echo "=== green EXIT=$e"
git apply --check "$D/write-copies-before-end.patch" || exit 2
git apply "$D/write-copies-before-end.patch"; git diff | mask
$C > "$D/o" 2>&1; e=$?; grep -E '^test |test result|panicked|left|right' "$D/o" | mask; echo "=== write-copies-before-end EXIT=$e"
git apply -R "$D/write-copies-before-end.patch"
git status --porcelain --ignore-submodules=none; echo "=== restored EXIT=$?"; rm -f "$D/o"
