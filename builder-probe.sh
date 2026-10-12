#!/bin/sh
# The three builder measurements PR 892's review names: a git-branch patch
# given with --config, --locked under it, and the profile cargo install uses.
# $1: a scratch directory this makes fresh. Writes everything to stdout.
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

say "The fork: a git repository whose branch toyos holds itoa 1.0.99, commit A"
mkdir -p "$S/itoa-fork/src"
cat > "$S/itoa-fork/Cargo.toml" <<'T'
[package]
name = "itoa"
version = "1.0.99"
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
run cat "$S/itoa-fork/Cargo.toml" "$S/itoa-fork/src/lib.rs"
echo "A=$A"

say "The app: crates.io itoa and ryu, its own Cargo.lock pinning itoa 1.0.11 and ryu 1.0.10 (commit C1)"
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
    println!("debug-assertions: {}", cfg!(debug_assertions));
    let wrapped = std::panic::catch_unwind(|| std::hint::black_box(255u8) + std::hint::black_box(1u8));
    println!("overflow-checks: {}", wrapped.is_err());
}
T
runin "$S/app" cargo generate-lockfile
runin "$S/app" cargo update -p itoa --precise 1.0.11
runin "$S/app" cargo update -p ryu --precise 1.0.10
(cd "$S/app" && $G init -q && $G add -A && $G commit -q -m C1)
C1=$(git -C "$S/app" rev-parse HEAD)
run cat "$S/app/Cargo.toml" "$S/app/src/main.rs" "$S/app/Cargo.lock"
echo "C1=$C1"

say "C2: C1 with the app's own [profile.release] debug-assertions = true"
printf '\n[profile.release]\ndebug-assertions = true\n' >> "$S/app/Cargo.toml"
(cd "$S/app" && $G commit -q -am C2)
C2=$(git -C "$S/app" rev-parse HEAD)
echo "C2=$C2"

say "C3: C2 with the app's own [profile.toyos] inherits release, debug-assertions = false"
printf '\n[profile.toyos]\ninherits = "release"\ndebug-assertions = false\n' >> "$S/app/Cargo.toml"
(cd "$S/app" && $G commit -q -am C3)
C3=$(git -C "$S/app" rev-parse HEAD)
run cat "$S/app/Cargo.toml"
echo "C3=$C3"

URL="file://$S/app"
FORK="file://$S/itoa-fork"

say "1. A git-branch patch through --config"
say "1a. install C1 with itoa patched to the fork's branch toyos (at A)"
run cargo install --git "$URL" --rev "$C1" --root "$S/r1" --config "patch.crates-io.itoa.git=\"$FORK\"" --config 'patch.crates-io.itoa.branch="toyos"'
run "$S/r1/bin/probeapp"

say "1b. the fork's branch toyos moves to commit B"
sed -i.bak 's/commit A/commit B/' "$S/itoa-fork/src/lib.rs" && rm "$S/itoa-fork/src/lib.rs.bak"
(cd "$S/itoa-fork" && $G commit -q -am B)
B=$(git -C "$S/itoa-fork" rev-parse HEAD)
echo "B=$B"

say "1c. the same install of C1, the same patch by branch"
run cargo install --force --git "$URL" --rev "$C1" --root "$S/r1" --config "patch.crates-io.itoa.git=\"$FORK\"" --config 'patch.crates-io.itoa.branch="toyos"'
run "$S/r1/bin/probeapp"

say "1d. the same install of C1, the patch by rev = A while the branch is at B"
run cargo install --force --git "$URL" --rev "$C1" --root "$S/r1" --config "patch.crates-io.itoa.git=\"$FORK\"" --config "patch.crates-io.itoa.rev=\"$A\""
run "$S/r1/bin/probeapp"

say "2. --locked, with and without a git patch"
say "2a. control: install C1 --locked, no patch"
run cargo install --git "$URL" --rev "$C1" --root "$S/r2a" --locked
run "$S/r2a/bin/probeapp"

say "2b. install C1 without --locked, no patch"
run cargo install --git "$URL" --rev "$C1" --root "$S/r2b"
run "$S/r2b/bin/probeapp"

say "2c. install C1 --locked, itoa patched to the fork at rev A"
run cargo install --git "$URL" --rev "$C1" --root "$S/r2c" --locked --config "patch.crates-io.itoa.git=\"$FORK\"" --config "patch.crates-io.itoa.rev=\"$A\""

say "2d. cargo build in a checkout of C1, itoa patched to rev A, without --locked: what it does to the app's Cargo.lock"
run git clone -q "$URL" "$S/checkout"
runin "$S/checkout" git checkout -q "$C1"
runin "$S/checkout" cargo build --locked --config "patch.crates-io.itoa.git=\"$FORK\"" --config "patch.crates-io.itoa.rev=\"$A\""
runin "$S/checkout" git status --porcelain
runin "$S/checkout" cargo build --config "patch.crates-io.itoa.git=\"$FORK\"" --config "patch.crates-io.itoa.rev=\"$A\""
runin "$S/checkout" git diff Cargo.lock
runin "$S/checkout" ./target/debug/probeapp

say "2e. the lock 2d wrote, under the same patch, with --locked"
runin "$S/checkout" cargo build --locked --config "patch.crates-io.itoa.git=\"$FORK\"" --config "patch.crates-io.itoa.rev=\"$A\""

say "2f. the lock 2d wrote, the patch moved to rev B, with --locked"
runin "$S/checkout" cargo build --locked --config "patch.crates-io.itoa.git=\"$FORK\"" --config "patch.crates-io.itoa.rev=\"$B\""

say "3. The profile"
say "3a. install C1, no profile named"
run cargo install --git "$URL" --rev "$C1" --root "$S/r3a" --locked
run "$S/r3a/bin/probeapp"

say "3b. install C2, whose own manifest sets [profile.release] debug-assertions = true"
run cargo install --git "$URL" --rev "$C2" --root "$S/r3b" --locked
run "$S/r3b/bin/probeapp"

say "3c. install C1 --profile toyos, the profile given whole by --config as ToyOS's [profile.toyos] states it"
run cargo install --git "$URL" --rev "$C1" --root "$S/r3c" --locked --profile toyos --config 'profile.toyos.inherits="dev"' --config 'profile.toyos.opt-level=2' --config 'profile.toyos.debug=true' --config 'profile.toyos.strip="debuginfo"' --config 'profile.toyos.debug-assertions=true' --config 'profile.toyos.overflow-checks=true'
run "$S/r3c/bin/probeapp"

say "3d. the same install of C3, whose own manifest has [profile.toyos] inherits release, debug-assertions = false"
run cargo install --git "$URL" --rev "$C3" --root "$S/r3d" --locked --profile toyos --config 'profile.toyos.inherits="dev"' --config 'profile.toyos.opt-level=2' --config 'profile.toyos.debug=true' --config 'profile.toyos.strip="debuginfo"' --config 'profile.toyos.debug-assertions=true' --config 'profile.toyos.overflow-checks=true'
run "$S/r3d/bin/probeapp"

say "3e. cargo build in a checkout of C1 --profile toyos, the same --config"
run git clone -q "$URL" "$S/checkout3"
runin "$S/checkout3" git checkout -q "$C1"
runin "$S/checkout3" cargo build --locked --profile toyos --config 'profile.toyos.inherits="dev"' --config 'profile.toyos.opt-level=2' --config 'profile.toyos.debug=true' --config 'profile.toyos.strip="debuginfo"' --config 'profile.toyos.debug-assertions=true' --config 'profile.toyos.overflow-checks=true'
runin "$S/checkout3" ./target/toyos/probeapp
