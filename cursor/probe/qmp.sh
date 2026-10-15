#!/bin/bash
# scratch: send QMP commands (one JSON per arg) to the traced run
S=$SCRATCH
{ echo '{"execute":"qmp_capabilities"}'; for c in "$@"; do echo "$c"; sleep 0.3; done; sleep 0.5; } | nc -U $S/qmp.sock
