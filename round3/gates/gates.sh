#!/bin/sh
# Round 3's gates at the merged head, each log ending in its exit and the host
# load before it ran.
set -u
L=<scratchpad>/pge-r3/logs
cd <dev>/toyos-pge || exit 90
[ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "tree not clean"; exit 94; }
git rev-parse HEAD > $L/gates.head
run() { # log words...
  log=$L/$1; shift
  load=$(sysctl -n vm.loadavg)
  "$@" > $log 2>&1; rc=$?
  printf 'host load before: %s\nEXIT=%s\n' "$load" "$rc" >> $log
  echo "$(basename $log): EXIT=$rc (load before $load)"
}
run ci-host.log cargo run -- --ci host
run build-x86_64.log cargo run -- --build-only
run build-aarch64.log cargo run -- --build-only --arch aarch64
run guest.log cargo test
[ "$(git rev-parse HEAD)" = "$(cat $L/gates.head)" ] || echo "HEAD MOVED"
echo GATES-DONE
