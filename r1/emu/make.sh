#!/bin/bash
# Scratch: copies the worktree's lib/crypto (or a git rev's, $2) to $1 with
# `vaes512` on emu.rs and admitted wherever AES-NI and PCLMULQDQ are.
set -euo pipefail
E=~/.claude/jobs/2280e09e/tmp/scratchpad/agents/aes-gcm/emu
W=~/Dev/jan/toyos-aes-gcm
OUT=$1 PATCH=${2:-}
rm -rf "$OUT"; mkdir -p "$OUT"
mkdir -p "$OUT/lib"; rsync -a --exclude target "$W/lib/crypto/" "$OUT/lib/crypto/"
mkdir -p "$OUT/tests"; rsync -a "$W/tests/acvp" "$W/tests/cavp" "$OUT/tests/" 2>/dev/null || true
cp "$W/Cargo.lock" "$OUT/lib/crypto/Cargo.lock"
cd "$OUT/lib/crypto"
if [ -n "$PATCH" ]; then patch -s -p1 < "$PATCH"; fi
printf '\n[workspace]\n' >> Cargo.toml
cp "$E/emu.rs" src/arch/x86_64/emu.rs
python3 - <<'PY'
import re
p='src/arch/x86_64/vaes512.rs'
s=open(p).read()
s=s.replace('use core::arch::x86_64::*;','use super::emu::*;',1)
s=re.sub(r'#\[target_feature\(enable = "[^"]*"\)\]','#[target_feature(enable = "aes,pclmulqdq,sse2,ssse3")]',s)
open(p,'w').write(s)
p='src/arch/x86_64.rs'
s=open(p).read()
s=s.replace('#[cfg(not(target_os = "uefi"))]\nmod vaes512;','#[cfg(not(target_os = "uefi"))]\nmod vaes512;\n#[cfg(not(target_os = "uefi"))]\nmod emu;',1)
i=s.index('    pub(super) fn vaes512(self) -> bool {')
j=s.index('\n    }\n',i)
s=s[:i]+'    pub(super) fn vaes512(self) -> bool {\n        self.aes_clmul()'+s[j:]
open(p,'w').write(s)
PY
grep -q "mod emu" src/arch/x86_64.rs
grep -q "use super::emu::\*" src/arch/x86_64/vaes512.rs
! grep -q "avx512" src/arch/x86_64/vaes512.rs
echo "emu crate at $OUT/lib/crypto"
