#!/bin/bash
# scratch: type a line into the guest over QMP send-key (lowercase, digits, space, dot)
S=$SCRATCH
cmds=()
s="$1"
for ((i=0;i<${#s};i++)); do c="${s:$i:1}"
  case "$c" in " ") k=spc;; ".") k=dot;; *) k="$c";; esac
  cmds+=("{\"execute\":\"send-key\",\"arguments\":{\"keys\":[{\"type\":\"qcode\",\"data\":\"$k\"}]}}")
done
cmds+=('{"execute":"send-key","arguments":{"keys":[{"type":"qcode","data":"ret"}]}}')
$S/bin/qmp.sh "${cmds[@]}" > /dev/null
