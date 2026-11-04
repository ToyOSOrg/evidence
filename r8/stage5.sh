#!/bin/bash
# stage5.sh: ab5's images, staged with --metal-readback (no machine touched).
S=$SCRATCH/s0a2
A=$S/ab5
cd $HOME/Dev/$USER/toyos-s0a || exit 1
MEMBERS="messages_are_whole blocking_read_stress pipe_other_end_gone poll_wake_pipe std_io std_process ends_sent_over_each_other_both_end kill_ends_every_wait mio_waker_coalesces query_modules_size user_copy_faults"
stage() { # arm rev rows...
  arm=$1 rev=$2; shift 2
  git checkout -q --detach $rev || exit 1
  echo "== $arm $(git rev-parse --short HEAD)"
  cargo test --test toyos-build -- --metal --metal-readback $A/$arm "$@" > $A/$arm-prepare.log 2>&1
  echo "rc=$?"
}
stage base s0a-ab5-base osbench
stage head s0a-ab5-head osbench
stage testcases e23d11219 $MEMBERS
git checkout -q s0a-wide-own
git status --porcelain
echo done
