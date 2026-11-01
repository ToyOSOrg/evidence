#!/bin/bash
# Negative controls: each mutation applied, shown, tested, restored.
cd <src>/toyos-wifi-w4 || exit 1
OUT=<scratch>/controls
control() {
  name=$1 file=$2; shift 2
  python3 -I -c "
import sys
p=sys.argv[1]; s=open(p).read(); pairs=sys.argv[2:]
for f,t in zip(pairs[::2],pairs[1::2]):
    assert s.count(f)==1,(p,f); s=s.replace(f,t)
open(p,'w').write(s)" "$file" "$@" || { echo "$name: patch did not apply"; return; }
  git diff -- "$file" > "$OUT/$name.patch"
  cargo test -p toyos-wlan-station > "$OUT/$name.log" 2>&1; rc=$?
  git checkout -- "$file"
  echo "$name: exit $rc; failed: $(grep -E '^test .* FAILED$' "$OUT/$name.log" | sed 's/^test //; s/ ... FAILED//' | tr '\n' ' ')"
}
control wrong-credential system/wlan/station/src/lib.rs 'n => (Refusal::NoAnswerToMessage2,' 'n => (Refusal::NoMessage1,'
control band-ignored system/wlan/station/src/choice.rs 'if strong { Some(x.channel.band()) } else { None }' 'None::<toyos_radio::Band>'
control seen-outside-scan system/wlan/station/src/lib.rs 'return self.violation(broke("reported a BSS outside a scan"));' ''
control verified-not-left system/wlan/station/src/lib.rs 'Err(why) if why.verified() =>' 'Err(why) if false && why.verified() =>'
control positive-signal lib/radio/src/lib.rs 'if dbm > 0 {' 'if dbm > 100 {'
control no-rejoin system/wlan/station/src/lib.rs '                self.join = Some(Join { phase: Phase::Scanning, ..join });
                self.scan(now);' '                drop((join, now));'
control mic-counted-verified system/wlan/handshake/src/lib.rs '            | Self::Mic
' '' '=> false,
            Self::Plaintext' '=> false,
            Self::Mic
            | Self::Plaintext'
git status --porcelain
