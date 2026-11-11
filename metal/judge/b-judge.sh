#!/bin/bash
# Judge #1236's eight T14 readbacks offline with the osbench_disk row.
S=<path>
W=$S/wt-readdir; R=$S/metal/runs/t14; J=$S/metal/judge
mkdir -p $J; cd $W || exit 9
git rev-parse HEAD > $J/revision.txt
for b in B-1 H-1 H-2 B-2 H-3 B-3 B-4 H-4; do
  { echo "\$ cargo test --test toyos-build -- --metal --metal-readback $R/$b osbench_disk"; cargo test --test toyos-build -- --metal --metal-readback $R/$b osbench_disk 2>&1; echo "exit $?"; } > $J/$b.log
  echo "$b: $(tail -1 $J/$b.log)"
done
