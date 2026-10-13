#!/bin/sh
# Applies each patch to the worktree, judges round 4's T14 readback, restores.
W=<path>
S=<path>
cd $W || exit 9
for p in "revert-9af220a1f:-R" "mutant-amd-ruled:"; do
  name=${p%%:*}; flag=${p#*:}
  git apply --check $flag $S/neg/$name.patch || { echo "$name: patch does not apply"; exit 9; }
  git apply $flag $S/neg/$name.patch
  git diff --stat
  cargo test --test toyos-build -- --metal --metal-readback $S/readback/t14-r4 acpi_tables_loaded acpi_server_events battery_read > $S/neg/$name.log 2>&1
  echo "$name EXIT=$?"
  git checkout -- tests/toyos.rs
  git status --porcelain --ignore-submodules=none
done
