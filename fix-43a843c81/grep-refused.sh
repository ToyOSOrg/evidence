#!/bin/sh
# The deleted `toyos_manifest::launch::refused`, by every name the tree could
# call it under, outside issues/.
set -u
echo "head: $(git rev-parse HEAD)"
out=$(git grep -n -e 'launch::refused' -e 'authority::refused' -e 'pub fn refused(caller' -- ':!issues/')
code=$?
echo "== git grep -n -e launch::refused -e authority::refused -e 'pub fn refused(caller' -- ':!issues/' -> exit $code"
[ -n "$out" ] && echo "$out"
[ $code -eq 1 ]
