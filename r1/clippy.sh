#!/bin/bash
# Scratch: toyos-crypto's three clippy shapes (build/clippy.rs) on x86_64 and aarch64 macOS targets.
S=<home>/.claude/jobs/2280e09e/tmp/scratchpad/agents/p256
cd <home>/Dev/jan/toyos-p256
A=(-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon -D warnings)
status=0
for t in x86_64-apple-darwin aarch64-apple-darwin; do
  for form in dispatched portable default; do
    case $form in
      dispatched) F=(--features std,sign,wpa2,rustls-provider);;
      portable) F=(--all-features);;
      default) F=();;
    esac
    cargo clippy -p toyos-crypto --all-targets "${F[@]}" --target $t --target-dir $S/clippy-target -- "${A[@]}" > $S/logs/clippy-$t-$form.log 2>&1
    e=$?; echo "$t $form exit=$e"; [ $e = 0 ] || { status=1; grep -E "^(warning|error)" -A9 $S/logs/clippy-$t-$form.log | head -40; }
  done
done
exit $status
