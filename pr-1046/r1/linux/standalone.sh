#!/bin/bash
# Scratch: exports lib/crypto at a commit into its own workspace with the
# shipped profile's settings and ring-free dev-dependencies, so it builds for
# x86_64-unknown-linux-musl. $1 = commit, $2 = destination, $3 = "probe" to add the probe.
set -e
REPO=~/Dev/jan/toyos-crypto-25519
S=~/.claude/jobs/2280e09e/tmp/scratchpad/agents/crypto-25519
rm -rf "$2"; mkdir -p "$2"
git -C $REPO archive "$1" lib/crypto | tar -x -C "$2"
cd "$2/lib/crypto"
python3 - <<'PY'
s = open('Cargo.toml').read()
for line in ['ring = "0.17.14"\n',
             'rustls = { version = "0.23.45", default-features = false, features = ["ring", "std", "tls12"] }\n',
             'rcgen = { version = "0.13.2", default-features = false, features = ["crypto", "ring"] }\n']:
    assert line in s, line
    s = s.replace(line, '')
s += '''
[workspace]

[profile.toyos]
inherits = "dev"
opt-level = 2
debug = true
strip = "debuginfo"
debug-assertions = true
overflow-checks = true
'''
open('Cargo.toml', 'w').write(s)
PY
mkdir -p .cargo
printf '[target.x86_64-unknown-linux-musl]\nlinker = "rust-lld"\nrustflags = ["-Dwarnings", "-Cforce-frame-pointers=yes"]\n' > .cargo/config.toml
if [ "$3" = probe ]; then
  cp $S/probe2/probe25519.rs src/probe25519.rs
  printf '\n#[cfg(test)]\n#[path = "probe25519.rs"]\nmod probe;\n' >> src/ed25519.rs
fi
