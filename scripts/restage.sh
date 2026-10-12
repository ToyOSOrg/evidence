#!/bin/sh
S=/private/tmp/claude-502/-Users-jan-Dev-jan-toyos/80e90c3a-7449-46b8-84cc-b59e9dd31ae9/scratchpad/busywake
for which in head base; do
  cd /Users/jan/Dev/jan/toyos-busywake-judge-$which || exit 9
  git rev-parse HEAD > $S/judge/$which-head.txt
  rm -rf $S/metal/t14-$which; mkdir -p $S/metal/t14-$which
  cargo test --test toyos-build -- --metal --metal-readback $S/metal/t14-$which scout_wake wake_onto_busy > $S/judge/$which-stage.log 2>&1; echo "EXIT=$?" >> $S/judge/$which-stage.log
done
echo done > $S/judge/restage.done
