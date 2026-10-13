#!/bin/zsh
# qmp.sh <arm> <json command>...
S=${0:A:h}; arm=$1; shift
{ echo '{"execute":"qmp_capabilities"}'; for c in "$@"; do echo "$c"; sleep 0.5; done; sleep 1; } | nc -U $S/qmp-$arm.sock
