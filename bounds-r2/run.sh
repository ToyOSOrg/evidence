#!/bin/bash
# Reruns the controls for the two bounds below 3, each mutation a checked patch reverted in the same run.
set -u
W=<worktrees>/toyos-ci-host-fast; R=$1; cd $W
git diff --quiet || { echo "tree dirty"; exit 2; }
echo "revision $(git rev-parse HEAD)" > $R/runs.txt
mk() { # file old new out
  cp "$1" "$R/tmp"; sed -i '' "s/$2/$3/" "$R/tmp"; cmp -s "$1" "$R/tmp" && { echo "no change for $4"; exit 3; }
  diff -u --label "a/$1" --label "b/$1" "$1" "$R/tmp" > "$R/$4.patch"; rm "$R/tmp"; }
mk kernel/src/inbox/polls.rs '^    ring.wake();$' '    \/\/ control: complete wakes nobody' aw-no-complete-wake
# bound patches: change the literal on the test's own line
L=$(grep -n "fn an_answer_wakes_the_submitter_its_look_hid_the_poll_from" kernel/loom/tests/loom_watch.rs | cut -d: -f1); L=$((L+1))
for b in 0 1 2; do cp kernel/loom/tests/loom_watch.rs $R/tmp; sed -i '' "${L}s/model_bounded(2,/model_bounded($b,/" $R/tmp; diff -u --label a/kernel/loom/tests/loom_watch.rs --label b/kernel/loom/tests/loom_watch.rs kernel/loom/tests/loom_watch.rs $R/tmp > $R/aw-bound-$b.patch; rm $R/tmp; done
L=$(grep -n "fn looks_without_the_gate_lose_no_wake" sdk/toyos/tests/transport_loom.rs | cut -d: -f1); L=$((L+1))
for b in 0 1; do cp sdk/toyos/tests/transport_loom.rs $R/tmp; sed -i '' "${L}s/bounded_by(1,/bounded_by($b,/" $R/tmp; diff -u --label a/sdk/toyos/tests/transport_loom.rs --label b/sdk/toyos/tests/transport_loom.rs sdk/toyos/tests/transport_loom.rs $R/tmp > $R/lwg-bound-$b.patch; rm $R/tmp; done
run() { # name, patches..., -- command; an empty patch is the test as committed
  name=$1; shift; ps=(); while [ "$1" != "--" ]; do ps+=("$1"); shift; done; shift
  done_=(); ok=1
  for p in "${ps[@]}"; do
    [ -s $R/$p.patch ] || continue
    if git apply --check $R/$p.patch && git apply $R/$p.patch; then done_+=("$p"); else ok=0; break; fi
  done
  if [ $ok = 1 ]; then "$@" > $R/$name.log 2>&1; e=$?; fi
  for ((i=${#done_[@]}-1; i>=0; i--)); do git apply -R $R/${done_[$i]}.patch; done
  git diff --quiet || { echo "$name: tree not restored" | tee -a $R/runs.txt; exit 4; }
  [ $ok = 1 ] && echo "$name exit=$e patches=[${done_[*]:-}] cmd: $*" | tee -a $R/runs.txt || echo "$name: a patch failed to apply" | tee -a $R/runs.txt
}
AW=(cargo test -p kernel-loom --test loom_watch -- --exact an_answer_wakes_the_submitter_its_look_hid_the_poll_from)
LW=(cargo test -p toyos --test transport_loom -- --exact looks_without_the_gate_lose_no_wake)
LWC=(cargo test -p toyos --test transport_loom --features transport-ungated-violation -- --exact looks_without_the_gate_lose_no_wake)
for b in 0 1 2; do run aw-control-b$b aw-no-complete-wake aw-bound-$b -- "${AW[@]}"; done
for b in 1 2; do run aw-unmutated-b$b aw-bound-$b -- "${AW[@]}"; done
for b in 0 1; do run lwg-control-b$b lwg-bound-$b -- "${LWC[@]}"; done
for b in 0 1; do run lwg-unmutated-b$b lwg-bound-$b -- "${LW[@]}"; done
git diff --quiet && echo "tree restored" | tee -a $R/runs.txt
