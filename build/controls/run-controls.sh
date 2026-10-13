#!/bin/sh
# Each mutation: checked, applied, its test run, its exit recorded, restored.
W=<home>/<dev>/toyos-amddesk
D=<scratch>/controls
cd "$W" || exit 2
echo "head $(git rev-parse HEAD)"
run() { # name, cargo args...
  name=$1; shift
  git apply --check "$D/$name.patch" || { echo "$name: patch does not apply"; exit 2; }
  git apply "$D/$name.patch"
  cargo test "$@" > "$D/$name.log" 2>&1; code=$?
  git apply -R "$D/$name.patch"
  echo "$name: EXIT=$code"
}
run a-todays-parameters -p toyos-resample
run b-round-1-unscaled -p toyos-resample
run c-linear-interpolation -p toyos-resample
run d-no-cutoff-scaling -p toyos-resample
run e-a3-range-test -p toyos-ps2
run f-a6b-volume-arms -p toyos-desktop
run g-a6b-overlay-never-hides -p toyos-desktop
run h-a4-choose-takes-the-first -p toyos-hda
run i-a6a-step-of-one -p toyos-hda
run j-a5-rate-order -p toyos-hda
cargo test -p toyos-resample -p toyos-ps2 -p toyos-desktop -p toyos-hda > "$D/green.log" 2>&1; echo "green: EXIT=$?"
git status --porcelain --ignore-submodules=none
