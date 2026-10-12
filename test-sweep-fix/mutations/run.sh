#!/bin/zsh
# Each mutation: green on the tree, patch applied, shown to build, the same test run, patch reverted, tree shown clean.
S=<home>/.claude/jobs/2280e09e/tmp/scratchpad/agents/893-r2/mut
W=<checkout>
cd $W
: > $S/summary.txt
while IFS='|' read -r name cmd; do
  [ -n "$1" ] && [[ "$name" != $~1 ]] && continue
  log=$S/logs/$name
  eval "$cmd" > $log.green.log 2>&1; g=$?
  git apply $S/patches/$name.patch || { echo "$name: patch did not apply" >> $S/summary.txt; continue; }
  built=no
  if [[ "$cmd" == *toyos-build* ]]; then
    cargo run -- --build-only > $log.build.log 2>&1 && built=yes
  else
    eval "${cmd%% -- *} --no-run" > $log.build.log 2>&1 && built=yes
  fi
  eval "$cmd" > $log.mutated.log 2>&1; m=$?
  git apply -R $S/patches/$name.patch
  clean=$([ -z "$(git status --porcelain --ignore-submodules=none)" ] && echo yes || echo no)
  echo "$name: green EXIT=$g; mutated EXIT=$m (built=$built); restored clean=$clean; command: $cmd" >> $S/summary.txt
done < $S/cases.txt
echo DONE >> $S/summary.txt
