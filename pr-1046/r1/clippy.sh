#!/bin/bash
# Scratch: the crate's clippy over its three forms on two Mac targets and both UEFI targets.
cd ~/Dev/jan/toyos-crypto-25519
S=~/.claude/jobs/2280e09e/tmp/scratchpad/agents/crypto-25519
OUT=$S/logs/${1:-clippy}
mkdir -p $OUT
LINTS=(-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon -D warnings)
rc=0
for t in aarch64-apple-darwin x86_64-apple-darwin; do
  for f in dispatched portable default; do
    case $f in dispatched) F=(--features std,sign,wpa2,rustls-provider);; portable) F=(--all-features);; default) F=();; esac
    cargo clippy -p toyos-crypto --all-targets "${F[@]}" --target $t -- "${LINTS[@]}" > $OUT/clippy-$t-$f.log 2>&1; r=$?
    echo "$t $f exit=$r"; [ $r = 0 ] || rc=1
  done
done
for t in x86_64-unknown-uefi aarch64-unknown-uefi; do
  cargo clippy -p toyos-crypto --target $t -- "${LINTS[@]}" > $OUT/clippy-$t.log 2>&1; r=$?
  echo "$t exit=$r"; [ $r = 0 ] || rc=1
done
exit $rc
