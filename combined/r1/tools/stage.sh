#!/bin/bash
# Scratch: stage the metal images (no machine touched). $1 = head|base, $2 = run index.
# head: crypto_instrument (+ crypto_secret_timing_curves for run 1); base: crypto_instrument.
CT=<home>/.claude/jobs/2280e09e/tmp/scratchpad/agents/crypto-timing
cd <dev>/toyos-p256 || exit 9
rows=(crypto_instrument)
[ "$1" = head ] && [ "$2" = 1 ] && rows+=(crypto_secret_timing_curves)
for bench in t14 amd; do
  d=$CT/metal/$bench-$1-$2
  rm -rf $d; mkdir -p $d
  host=(); [ $bench = amd ] && host=(--metal-host toyos@bench-amd)
  cargo test --test toyos-build -- --metal --metal-readback $d "${host[@]}" "${rows[@]}" > $CT/logs/stage-$bench-$1-$2.log 2>&1
  echo "$bench $1 $2 rev=$(git rev-parse HEAD) exit=$?"
done
