#!/bin/sh
S=<SCRATCH>/agents/usbd-boot/r3
cd <WORKTREE> || exit 9
git apply --check $S/mutation-trailing-path.patch || exit 8
git apply $S/mutation-trailing-path.patch
git diff --stat -- loader > $S/control-trailing-path.log
cargo test --test toyos-build -- nvme_disk_boots >> $S/control-trailing-path.log 2>&1
echo "exit $?" >> $S/control-trailing-path.log
git apply -R $S/mutation-trailing-path.patch
git diff --quiet -- loader/src/bootsource.rs && echo restored
