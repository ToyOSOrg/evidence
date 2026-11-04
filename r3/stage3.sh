#!/bin/bash
# stage.sh: ab3 images, staged with --metal-readback (no machine touched).
S=$SCRATCH/s0a2
A=$S/ab3
cd $HOME/Dev/$USER/toyos-s0a || exit 1
MEMBERS="messages_are_whole blocking_read_stress pipe_other_end_gone poll_wake_pipe std_io std_process std_fs std_fs_write ends_sent_over_each_other_both_end kill_ends_every_wait mio_waker_coalesces query_modules_size lseek_past_eof file_mtime"
stage() { # arm rev rows...
  arm=$1 rev=$2; shift 2
  git checkout -q --detach $rev || exit 1
  [ $arm = b1024 ] && { sed -i '' 's/^pub const BOUNCE: usize = 4096;$/pub const BOUNCE: usize = 1024;/' kernel/src/frame_bytes.rs; grep -q 'BOUNCE: usize = 1024' kernel/src/frame_bytes.rs || exit 2; }
  echo "== $arm $(git rev-parse --short HEAD)"
  cargo test --test toyos-build -- --metal --metal-readback $A/$arm "$@" > $A/$arm-prepare.log 2>&1
  echo "rc=$?"
  git checkout -q -- kernel/src/frame_bytes.rs
}
stage base a0e8f1333 osbench
stage b4096 5572386b8 osbench $MEMBERS
stage b1024 5572386b8 osbench
git checkout -q s0a-wide-own
git status --porcelain
echo done
