#!/bin/sh
S=/private/tmp/claude-502/-Users-jan-Dev-jan-toyos/80e90c3a-7449-46b8-84cc-b59e9dd31ae9/scratchpad/busywake
cd /Users/jan/Dev/jan/toyos-busywake-judge-head || exit 9
git rev-parse HEAD > $S/judge/head-head.txt
rm -rf $S/metal/t14-head; mkdir -p $S/metal/t14-head
cargo test --test toyos-build -- --metal --metal-readback $S/metal/t14-head scout_wake wake_onto_busy > $S/judge/head-stage.log 2>&1; echo "EXIT=$?" >> $S/judge/head-stage.log
echo done > $S/judge/restage-head.done
