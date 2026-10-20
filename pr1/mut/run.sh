#!/bin/sh
# run.sh <patch> <log> <command...>: apply, prove it builds by running, restore.
patch=$1; log=$2; shift 2
cd <dev>/toyos-usbd || exit 2
{
  echo "HEAD $(git rev-parse HEAD) + uncommitted PR-1 tree"
  echo "PATCH $patch"; cat "$patch"
  git apply --check "$patch" || { echo "PATCH DOES NOT APPLY"; exit 2; }
  git apply "$patch"
  echo "COMMAND $*"
  "$@"; echo "EXIT $?"
  git apply -R "$patch" && echo RESTORED_CLEAN=yes || echo RESTORED_CLEAN=no
} > "$log" 2>&1
