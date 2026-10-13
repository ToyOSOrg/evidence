#!/bin/sh
# Judges each readback with the fixed judge, then with the fix reverted (the negative control), restoring it.
W=<path>
S=<path>
cd $W || exit 9
git rev-parse HEAD > $S/judge/HEAD
j() { cargo test --test toyos-build -- --metal --metal-readback $1 $2 > $S/judge/$3.log 2>&1; echo "$3 EXIT=$?" | tee -a $S/judge/exits.txt; }
: > $S/judge/exits.txt
for arm in fixed reverted; do
  if [ $arm = reverted ]; then git apply --check -R $S/judge/judge-fix.patch || exit 9; git apply -R $S/judge/judge-fix.patch; fi
  j $S/rb/t14 "acpi_tables_loaded acpi_server_events battery_read" $arm-t14
  j $S/rb/amd acpi_tables_loaded $arm-amd
  for m in third path census; do j $S/rb/mut-$m/t14 acpi_tables_loaded $arm-mut-$m; done
  j $S/rb/mut-bst/t14 battery_read $arm-mut-bst
  if [ $arm = reverted ]; then git apply $S/judge/judge-fix.patch; fi
done
git diff --stat
