#!/bin/bash
# Negative controls for the in-flight core: each deletes one of the protocol's wakes, runs the loom models, and
# restores the file. Each must red as a deadlock.
D=<scratch>; cd $D/wt-tags || exit 2
L=$D/logs/$1; mkdir -p $L
F=sdk/toyos/src/fs/flight.rs
cp $F $L/flight.rs.orig
control() {
  local name=$1 from=$2 to=$3
  FROM="$from" TO="$to" python3 - <<'PY'
import os
p='sdk/toyos/src/fs/flight.rs'; s=open(p).read(); a=os.environ['FROM']; b=os.environ['TO']
assert s.count(a)==1, a
open(p,'w').write(s.replace(a,b))
PY
  diff -u $L/flight.rs.orig $F > $L/$name.patch
  : > $L/$name.log
  for model in each_caller_is_answered_its_own_reply_whoever_receives a_slot_used_again_is_answered_its_own_reply \
      a_connection_that_ends_fails_every_request_on_it a_connection_that_ends_fails_no_request_on_a_fresh_one \
      a_reply_naming_no_request_fails_the_connection every_slot_is_held_by_one_caller_alone; do
    echo "== $model" >> $L/$name.log
    cargo test -q --manifest-path kernel/loom/Cargo.toml --test fs_flight -- --exact $model >> $L/$name.log 2>&1
    rc=$?; echo "rc=$rc" >> $L/$name.log
    echo "$name $model rc=$rc" >> $L/summary.txt
  done
  cp $L/flight.rs.orig $F && cmp -s $L/flight.rs.orig $F && echo restored >> $L/$name.log
}
control no-filing-wake '            self.wake(woken & !(1 << mine));
' ''
control no-hand-on-wake '                self.wake(next.flatten().map_or(0, |i| 1 << i));
' ''
control no-give-wake '        self.wake(next.map_or(0, |i| 1 << i));
    }' '    }'
