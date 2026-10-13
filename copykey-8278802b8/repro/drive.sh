#!/bin/sh
# usage: drive.sh SOCK LOG  -- select text by drag, then Cmd+C, then Ctrl+C, counting guest copies at each step.
S=$(dirname $0)/..; Q="python3 -I $S/tools/qmp.py $1"
abs() { echo "{\"execute\":\"input-send-event\",\"arguments\":{\"events\":[{\"type\":\"abs\",\"data\":{\"axis\":\"x\",\"value\":$(( $1 * 32767 / 1280 ))}},{\"type\":\"abs\",\"data\":{\"axis\":\"y\",\"value\":$(( $2 * 32767 / 720 ))}}]}}"; }
btn() { echo "{\"execute\":\"input-send-event\",\"arguments\":{\"events\":[{\"type\":\"btn\",\"data\":{\"down\":$1,\"button\":\"left\"}}]}}"; }
copies() { grep -c "vdagent: a guest copy" $2; }
$Q "$(abs 43 77)" sleep:0.3 "$(btn true)" sleep:0.3 "$(abs 80 77)" sleep:0.3 "$(abs 110 77)" sleep:0.3 "$(btn false)" sleep:3 >/dev/null
echo "after selection: $(copies x $2)"
$Q '{"execute":"send-key","arguments":{"keys":[{"type":"qcode","data":"meta_l"},{"type":"qcode","data":"c"}]}}' sleep:3 >/dev/null
echo "after Cmd+C (meta_l-c): $(copies x $2)"
$Q '{"execute":"send-key","arguments":{"keys":[{"type":"qcode","data":"ctrl"},{"type":"qcode","data":"c"}]}}' sleep:3 >/dev/null
echo "after Ctrl+C: $(copies x $2)"
