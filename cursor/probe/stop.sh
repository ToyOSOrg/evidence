#!/bin/bash
# scratch: stop the processes this agent started for a traced run
S=$SCRATCH
pkill -f "$S/dbuswatch.py"; pkill -f "$S/vncwatch.py"
Q=$(pgrep -f "agents/cursor/vnc.sock"); [ -n "$Q" ] && kill $Q
sleep 2; pkill -f "tail -f $S/in.txt"; sleep 1
pgrep -fl "agents/cursor" | grep -v stop.sh || echo gone
