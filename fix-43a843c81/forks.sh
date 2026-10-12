#!/bin/sh
# Every caller of the deleted `toyos_manifest::launch::refused` outside the
# superproject: a fork clone, a cargo checkout or the toolchain's library
# naming toyos-manifest at all. Exit 1 from grep is "no match".
set -u
fail=0
for root in "$HOME/.cargo/git/checkouts" <forks> <primary>/rust/library; do
  out=$(grep -rIl -e 'toyos_manifest' -e 'toyos-manifest' -e 'launch::refused' "$root" 2>&1)
  code=$?
  echo "== grep -rIl -e toyos_manifest -e toyos-manifest -e launch::refused $root -> exit $code"
  [ -n "$out" ] && echo "$out"
  [ $code -eq 1 ] || fail=1
done
echo "fail=$fail"
exit $fail
