#!/bin/sh
# The second half of PR 892's --locked measurement: the fork carries the very
# version the app's Cargo.lock pins, as ToyOS's forks carry upstream's
# (winit 0.30.13 on branch toyos-0.30.13). $1: a scratch directory this makes fresh.
set -u
S="$1"
rm -rf "$S"
mkdir -p "$S"
export CARGO_HOME="$S/cargo-home"
G="git -c user.name=probe -c user.email=probe@example.invalid -c init.defaultBranch=main -c commit.gpgsign=false"

say() { printf '\n## %s\n' "$*"; }
run() {
  printf '$ %s\n' "$*"
  "$@" 2>&1
  printf 'EXIT=%s\n' "$?"
}
runin() {
  dir="$1"; shift
  printf '$ (in %s) %s\n' "$dir" "$*"
  (cd "$dir" && "$@") 2>&1
  printf 'EXIT=%s\n' "$?"
}

run cargo --version

say "The fork: branch toyos holds itoa 1.0.11, the version the app's lock pins, commit A"
mkdir -p "$S/itoa-fork/src"
cat > "$S/itoa-fork/Cargo.toml" <<'T'
[package]
name = "itoa"
version = "1.0.11"
edition = "2021"
T
cat > "$S/itoa-fork/src/lib.rs" <<'T'
pub struct Buffer;
impl Buffer {
    pub fn new() -> Self { Buffer }
    pub fn format<T>(&mut self, _: T) -> &'static str { "the fork's commit A" }
}
T
(cd "$S/itoa-fork" && $G init -q -b toyos && $G add -A && $G commit -q -m A)
A=$(git -C "$S/itoa-fork" rev-parse HEAD)
run cat "$S/itoa-fork/Cargo.toml"
echo "A=$A"

say "The app, as in the first probe: its Cargo.lock pins crates.io itoa 1.0.11 and ryu 1.0.10 (commit C1)"
mkdir -p "$S/app/src"
cat > "$S/app/Cargo.toml" <<'T'
[package]
name = "probeapp"
version = "0.1.0"
edition = "2021"

[dependencies]
itoa = "1"
ryu = "1"
T
cat > "$S/app/src/main.rs" <<'T'
fn main() {
    println!("itoa: {}", itoa::Buffer::new().format(7));
    println!("ryu: {}", ryu::Buffer::new().format(1.5f64));
}
T
runin "$S/app" cargo generate-lockfile
runin "$S/app" cargo update -p itoa --precise 1.0.11
runin "$S/app" cargo update -p ryu --precise 1.0.10
(cd "$S/app" && $G init -q && $G add -A && $G commit -q -m C1)
C1=$(git -C "$S/app" rev-parse HEAD)
echo "C1=$C1"
URL="file://$S/app"
FORK="file://$S/itoa-fork"

say "4a. cargo install C1 --locked, itoa patched to the fork at rev A"
run cargo install --git "$URL" --rev "$C1" --root "$S/r4a" --locked --config "patch.crates-io.itoa.git=\"$FORK\"" --config "patch.crates-io.itoa.rev=\"$A\""
run "$S/r4a/bin/probeapp"

say "4b. cargo build --locked in a checkout of C1, the same patch"
run git clone -q "$URL" "$S/checkout"
runin "$S/checkout" git checkout -q "$C1"
runin "$S/checkout" cargo build --locked --config "patch.crates-io.itoa.git=\"$FORK\"" --config "patch.crates-io.itoa.rev=\"$A\""

say "4c. cargo build without --locked, the same patch: what it does to the app's Cargo.lock"
runin "$S/checkout" cargo build --config "patch.crates-io.itoa.git=\"$FORK\"" --config "patch.crates-io.itoa.rev=\"$A\""
runin "$S/checkout" git diff Cargo.lock
runin "$S/checkout" ./target/debug/probeapp

say "4d. the lock 4c wrote, the same patch, --locked"
runin "$S/checkout" cargo build --locked --config "patch.crates-io.itoa.git=\"$FORK\"" --config "patch.crates-io.itoa.rev=\"$A\""
runin "$S/checkout" ./target/debug/probeapp
