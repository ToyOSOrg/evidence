#!/bin/sh
# Scratch: the launcher's argv, with the cocoa display and coreaudio swapped for headless ones.
n=$#
i=0
while [ $i -lt $n ]; do
  a="$1"; shift
  case "$a" in
    cocoa) a=none ;;
    coreaudio,*) a="none,${a#coreaudio,}" ;;
  esac
  set -- "$@" "$a"
  i=$((i+1))
done
printf "'%s' " "$@" > "<scratch>/qemu-argv.txt"
exec /opt/homebrew/bin/qemu-system-x86_64 "$@"
