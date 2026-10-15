#!/bin/bash
# scratch: GOP control — software cursor after a scale change, read off screendumps
S=$SCRATCH
mv() { $S/bin/qmp.sh "{\"execute\":\"input-send-event\",\"arguments\":{\"events\":[{\"type\":\"abs\",\"data\":{\"axis\":\"x\",\"value\":$1}},{\"type\":\"abs\",\"data\":{\"axis\":\"y\",\"value\":$2}}]}}" >/dev/null; }
dump() { $S/bin/qmp.sh '{"execute":"screendump","arguments":{"filename":"'$S'/gop-'$1'.ppm"}}' > /dev/null; }
cd $WORKTREE
: > $S/in.txt; rm -f $S/trace.log $S/vnc.sock $S/qmp.sock $S/qmp2.sock
(tail -f $S/in.txt | PATH=$S/bin:$PATH cargo run -- --gop --scale 4 > $S/run-gop.log 2>&1 &)
for i in $(seq 120); do grep -q "first frame" $S/run-gop.log 2>/dev/null && break; sleep 2; done; sleep 2
mv 16000 16000; sleep 2; dump a
$S/bin/qmp.sh '{"execute":"send-key","arguments":{"keys":[{"type":"qcode","data":"ctrl"},{"type":"qcode","data":"n"}]}}' >/dev/null
for i in $(seq 30); do grep -q "terminal: ready" $S/run-gop.log && break; sleep 1; done; sleep 2
$S/bin/type.sh "screen scale 1.5"
for i in $(seq 30); do grep -q "compositor: scale 1.5, kept 1.5" $S/run-gop.log && break; sleep 1; done; sleep 1
mv 8000 8000; sleep 2; dump b
