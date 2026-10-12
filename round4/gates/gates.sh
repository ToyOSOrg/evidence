#!/bin/sh
# Round 4's gates after ci-host (run first, its own log): both images and the
# whole guest suite, each log ending in its exit and the host load before it ran.
set -u
L=<path>
cd <path> || exit 90
[ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "tree not clean"; exit 94; }
[ "$(git rev-parse HEAD)" = "$(cat $L/gates.head)" ] || { echo "HEAD is not gates.head"; exit 95; }
run() { # log words...
  log=$L/$1; shift
  load=$(sysctl -n vm.loadavg)
  "$@" > $log 2>&1; rc=$?
  printf 'host load before: %s\nEXIT=%s\n' "$load" "$rc" >> $log
  echo "$(basename $log): EXIT=$rc (load before $load)"
}
run build-x86_64.log cargo run -- --build-only
run build-aarch64.log cargo run -- --build-only --arch aarch64
run guest.log cargo test
[ "$(git rev-parse HEAD)" = "$(cat $L/gates.head)" ] || echo "HEAD MOVED"
echo GATES-DONE
