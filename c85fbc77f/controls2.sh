set -u
S=/private/tmp/claude-502/-Users-jan-Dev-jan-toyos/80e90c3a-7449-46b8-84cc-b59e9dd31ae9/scratchpad/netring-s1/r3
cd /Users/jan/Dev/jan/toyos-netring-s1
HEAD=$(git rev-parse HEAD)
echo "== head $HEAD, base $(git merge-base HEAD origin/main)"
[ "$HEAD" = c85fbc77fe812b2b30c0218c0ef3e649e7c04d2d ] || { echo "not the pushed head"; exit 88; }
[ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "tree not clean"; exit 89; }

echo "== the image, at the committed head"
cargo run -- --build-only > $S/build-only.log 2>&1; echo "cargo run -- --build-only EXIT=$?"

echo "== QEMU tier: m4 again, its first run invalidated by a host suspend"
m=m4-kernel-says-every-region-is-ram
git apply --check $S/$m.patch || exit 90; git apply $S/$m.patch
cargo test --test toyos-build -- lent_device_memory_refused > $S/$m.qemu.log 2>&1; echo "$m QEMU lent_device_memory_refused EXIT=$?"
git apply -R $S/$m.patch
[ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "tree not clean after m4"; exit 92; }

echo "== metal tier, staged only: the control that replaces m3, its first staging stopped by a full disk"
name=map-before-judge
git apply --check $S/$name.patch || exit 93; git apply $S/$name.patch
printf 'Stage: %s, applied for a metal readback and reset away\n' "$name" > $S/tmp-commit.txt
git commit -q -a -F $S/tmp-commit.txt || exit 94
rm -rf $S/metal/$name; mkdir -p $S/metal/$name
cargo test --test toyos-build -- --metal --metal-readback $S/metal/$name lent_window_refused > $S/$name.metal-stage.log 2>&1
echo "$name METAL STAGE (lent_window_refused) EXIT=$? at $(git rev-parse HEAD)"
git reset -q --hard $HEAD || exit 95
rm -f $S/tmp-commit.txt
echo "head after restore: $(git rev-parse HEAD)"
echo "porcelain after restore:"; git status --porcelain --ignore-submodules=none; echo "(end)"
echo DONE
