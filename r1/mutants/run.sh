#!/bin/bash
# Scratch: builds each mutant of mutants.py (every edit of one name, in
# order) and runs the GCM tests; a mutant must fail them. MODE=emu (default)
# runs `vaes512` on the emulation, MODE=real the crate as it is under Rosetta.
# Usage: [MODE=real] run.sh [name-filter]
set -uo pipefail
D=~/.claude/jobs/2280e09e/tmp/scratchpad/agents/aes-gcm
MODE=${MODE:-emu}
cd $D/mutants
python3 -c "
import mutants
seen=[]
for m in mutants.M:
    if m[0] not in seen: seen.append(m[0]); print(m[0])" | grep -- "${1:-}" | while read name; do
  out=$D/mutants/work
  $D/emu/make.sh $out > /dev/null
  if [ $MODE = real ]; then
    rsync -a --exclude target ~/Dev/jan/toyos-aes-gcm/lib/crypto/src/ $out/lib/crypto/src/
    rm -f $out/lib/crypto/src/arch/x86_64/emu.rs
  fi
  python3 - "$name" "$out/lib/crypto" <<'PY'
import sys, mutants
name, root = sys.argv[1], sys.argv[2]
for n, f, a, b in mutants.M:
    if n != name: continue
    p = root + '/' + f
    s = open(p).read()
    assert s.count(a) == 1, (n, s.count(a))
    open(p, 'w').write(s.replace(a, b))
PY
  [ $? -eq 0 ] || { echo "$name: PATCH FAILED"; continue; }
  log=$D/mutants/$name.$MODE.log
  ( cd $out/lib/crypto && diff -ru ~/Dev/jan/toyos-aes-gcm/lib/crypto/src src > $D/mutants/$name.$MODE.patch;
    cargo build --offline --tests --features std,sign,wpa2,rustls-provider --target x86_64-apple-darwin > $log 2>&1; echo "build exit=$?" >> $log
    cargo test --offline --features std,sign,wpa2,rustls-provider --target x86_64-apple-darwin --no-fail-fast --lib --test differential --test wycheproof -- gcm aead >> $log 2>&1; echo "test exit=$?" >> $log )
  echo "$name ($MODE): $(grep -E '^(build|test) exit=' $log | tr '\n' ' ') failures: $(grep -cE '^test .* FAILED$' $log)"
done
