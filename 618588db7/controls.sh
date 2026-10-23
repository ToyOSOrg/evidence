#!/bin/sh
# Each control applied as a checked patch, built and run by the test, and reverted in the same run.
S=<SCRATCH>/agents/usbd-boot/r3
cd <WORKTREE> || exit 9
run() { # name, test, patches...
  name=$1; test=$2; shift 2
  for p in "$@"; do git apply --check $S/$p.patch || { echo "$name: $p does not apply"; return; }; done
  for p in "$@"; do git apply $S/$p.patch; done
  git diff --stat > $S/$name.log
  cargo test --test toyos-build -- $test >> $S/$name.log 2>&1
  echo "exit $?" >> $S/$name.log
  for p in "$@"; do git apply -R $S/$p.patch; done
  echo "$name: $(tail -1 $S/$name.log)"
}
run control-boot-only the_log_lands_on_the_boot_stick control-boot-only
run control-no-controller the_log_lands_on_the_boot_stick control-boot-only mutation-no-controller
run control-trailing-path nvme_disk_boots mutation-trailing-path
git status --short | grep -v '^??' > $S/after-controls-status.txt
