#!/bin/bash
# scratch: the owner's sequence on a headless virtio-gpu run at --scale 4 with a
# 3456x2170 display, logging the console layer's cursor calls. usage: session.sh <tag>
S=$SCRATCH; T=$1
mv() { $S/bin/qmp.sh "{\"execute\":\"input-send-event\",\"arguments\":{\"events\":[{\"type\":\"abs\",\"data\":{\"axis\":\"x\",\"value\":$1}},{\"type\":\"abs\",\"data\":{\"axis\":\"y\",\"value\":$2}}]}}" >/dev/null; }
mark() { echo "$(date +%s.%N | cut -c1-14) MARK $*" >> $S/marks-$T.log; }
cd $WORKTREE
: > $S/in.txt; : > $S/marks-$T.log; rm -f $S/trace.log $S/vnc.sock $S/qmp.sock $S/qmp2.sock
(tail -f $S/in.txt | PATH=$S/bin:$PATH cargo run -- --scale 4 > $S/run-$T.log 2>&1 &)
for i in $(seq 60); do [ -S $S/qmp2.sock ] && break; sleep 1; done
(python3 -I $S/dbuswatch.py $S/qmp2.sock 900 > $S/dbus-$T.log 2>&1 &)
for i in $(seq 120); do grep -q "first frame" $S/run-$T.log 2>/dev/null && break; sleep 2; done
sleep 2
(python3 -I $S/vncwatch.py $S/vnc.sock 900 3456 2170 > $S/vnc-$T.log 2>&1 &)
for i in $(seq 30); do grep -q "compositor: mode 3456x2170" $S/run-$T.log && break; sleep 1; done
mark "display 3456x2170"; mv 8000 8000; sleep 2; mark "moved at 4"
$S/bin/qmp.sh '{"execute":"send-key","arguments":{"keys":[{"type":"qcode","data":"ctrl"},{"type":"qcode","data":"n"}]}}' >/dev/null
for i in $(seq 30); do grep -q "terminal: ready" $S/run-$T.log && break; sleep 1; done; sleep 2
mark "screen scale 2"; $S/bin/type.sh "screen scale 2"
for i in $(seq 30); do grep -q "compositor: scale 2, kept 2" $S/run-$T.log && break; sleep 1; done; sleep 1
mark "moving at 2"; mv 12000 11000; sleep 1; mv 14000 12000; sleep 2
mark "screen scale auto"; $S/bin/type.sh "screen scale auto"
for i in $(seq 30); do grep -q "auto" $S/run-$T.log && break; sleep 1; done; sleep 1
mark "moving at auto"; mv 15000 12000; sleep 2
mark "screen scale 1"; $S/bin/type.sh "screen scale 1"
for i in $(seq 30); do grep -q "compositor: scale 1, kept 1" $S/run-$T.log && break; sleep 1; done; sleep 1
mark "moving at 1"; mv 16000 13000; sleep 1; mv 17000 13000; sleep 2
$S/bin/qmp.sh '{"execute":"screendump","arguments":{"filename":"'$S'/dump-'$T'.ppm"}}' > /dev/null
mark end
