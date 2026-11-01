#!/bin/bash
# Scratch: each negative-control patch applied to the worktree, virt_el1_smp run, the patch reverted.
CT=<home>/.claude/jobs/2280e09e/tmp/scratchpad/agents/crypto-timing
cd <dev>/toyos-p256 || exit 9
echo "head $(git rev-parse HEAD)"
for m in mutation-irq-drops-dit mutation-generate-unprotected; do
  git apply --check $CT/patches/$m.patch || { echo "$m does not apply"; exit 9; }
  git apply $CT/patches/$m.patch
  cargo test --test toyos-build -- virt_el1_smp > $CT/logs/control-$m.log 2>&1
  echo "$m exit=$?"
  git apply -R $CT/patches/$m.patch
  [ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "tree not clean after $m"; exit 9; }
done
