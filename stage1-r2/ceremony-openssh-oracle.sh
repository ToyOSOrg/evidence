#!/bin/sh
# The ceremony end to end with throwaway keys, every key under a scratch $HOME
# and scratch sticks, then OpenSSH as the independent oracle: ssh-keygen -l
# fingerprints both public lines, and ssh-keygen -Y verify checks root 1's
# signature in the toyos-root namespace against the root key's public line.
# $1: the ToyOS worktree; $2: an empty scratch directory.
set -u
W=$1; D=$2
mkdir -p "$D/home" "$D/A" "$D/B" "$D/C"
cd "$W" || exit 1
echo "== HOME=<scratch>/home cargo run -q -- --repo-signing-key-new > <C>/signing.pub"
RUSTUP_HOME=${RUSTUP_HOME:-$HOME/.rustup} CARGO_HOME=${CARGO_HOME:-$HOME/.cargo} HOME="$D/home" cargo run -q -- --repo-signing-key-new > "$D/C/signing.pub"; echo "EXIT=$?"
echo "-- signing.pub:"; cat "$D/C/signing.pub"
ls -l "$D/home/.config/toyos/repo-signing-key" | cut -c1-10
echo "== again, which must refuse"
RUSTUP_HOME=${RUSTUP_HOME:-$HOME/.rustup} CARGO_HOME=${CARGO_HOME:-$HOME/.cargo} HOME="$D/home" cargo run -q -- --repo-signing-key-new > /dev/null; echo "EXIT=$?"
echo "== step 1.2: cargo build --release -p toyos-root --target aarch64-apple-darwin"
cargo build -q --release -p toyos-root --target aarch64-apple-darwin; echo "EXIT=$?"
R="$W/target/aarch64-apple-darwin/release/toyos-root"
file "$R"
echo "== toyos-root new <A>/root-key"
"$R" new "$D/A/root-key" > "$D/new.txt"; echo "EXIT=$?"; cat "$D/new.txt"
echo "-- the root key's mode, under umask $(umask):"
ls -l "$D/A/root-key" | cut -c1-10
echo "== toyos-root new over it again, which must refuse"
"$R" new "$D/A/root-key"; echo "EXIT=$?"
cp "$D/A/root-key" "$D/B/root-key" && cmp "$D/A/root-key" "$D/B/root-key"; echo "cmp EXIT=$?"
echo "== toyos-root sign --key <A>/root-key --signing <C>/signing.pub --out <C>/root.1.txt"
"$R" sign --key "$D/A/root-key" --signing "$D/C/signing.pub" --out "$D/C/root.1.txt"; echo "EXIT=$?"
ls -l "$D/C/root.1.txt" | cut -c1-10
echo "== oracle: ssh-keygen -l over each public line"
sed -n 2p "$D/new.txt" > "$D/root.pub"
ssh-keygen -l -f "$D/root.pub"; echo "EXIT=$?"
ssh-keygen -l -f "$D/C/signing.pub"; echo "EXIT=$?"
echo "== oracle: ssh-keygen -Y verify -n toyos-root over root 1's signed bytes"
grep -v '^sig ' "$D/C/root.1.txt" > "$D/body"
{ echo "-----BEGIN SSH SIGNATURE-----"; grep '^sig ' "$D/C/root.1.txt" | cut -d' ' -f3 | fold -w 70; echo "-----END SSH SIGNATURE-----"; } > "$D/body.sig"
echo "root $(cat "$D/root.pub")" > "$D/allowed"
ssh-keygen -Y verify -f "$D/allowed" -I root -n toyos-root -s "$D/body.sig" < "$D/body"; echo "EXIT=$?"
echo "== control: the same signature under the signing key's line, which must fail"
echo "root $(cat "$D/C/signing.pub")" > "$D/allowed-wrong"
ssh-keygen -Y verify -f "$D/allowed-wrong" -I root -n toyos-root -s "$D/body.sig" < "$D/body"; echo "EXIT=$?"
echo "== control: one byte of the body bent, which must fail"
sed 's/role targets 1/role targets 2/' "$D/body" > "$D/body-bent"
ssh-keygen -Y verify -f "$D/allowed" -I root -n toyos-root -s "$D/body.sig" < "$D/body-bent"; echo "EXIT=$?"
echo "== the publisher under root 1: HOME=<scratch>/home cargo run -q -- --publish <scratch>/pub/packages.toml"
mkdir -p "$D/pub/roots"
cp "$D/C/root.1.txt" "$D/pub/roots/root.1.txt"
printf 'demo archive bytes\n' > "$D/pub/demo.tar.gz"
printf '[[package]]\nname = "demo"\ntarget = "x86_64-unknown-toyos"\nsequence = 1\nversion = "1.0"\narchive = "demo.tar.gz"\n' > "$D/pub/packages.toml"
RUSTUP_HOME=${RUSTUP_HOME:-$HOME/.rustup} CARGO_HOME=${CARGO_HOME:-$HOME/.cargo} HOME="$D/home" cargo run -q -- --publish "$D/pub/packages.toml"; echo "EXIT=$?"
ls "$D/home/.config/toyos/pkg-repository"
echo "== again: the root is not rewritten, the versions move on"
RUSTUP_HOME=${RUSTUP_HOME:-$HOME/.rustup} CARGO_HOME=${CARGO_HOME:-$HOME/.cargo} HOME="$D/home" cargo run -q -- --publish "$D/pub/packages.toml"; echo "EXIT=$?"
echo "== control: a root.3.txt past the gap at root 2, which must refuse"
cp "$D/C/root.1.txt" "$D/pub/roots/root.3.txt"
RUSTUP_HOME=${RUSTUP_HOME:-$HOME/.rustup} CARGO_HOME=${CARGO_HOME:-$HOME/.cargo} HOME="$D/home" cargo run -q -- --publish "$D/pub/packages.toml"; echo "EXIT=$?"
