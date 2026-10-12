set -u
S=/private/tmp/claude-502/-Users-jan-Dev-jan-toyos/80e90c3a-7449-46b8-84cc-b59e9dd31ae9/scratchpad/netring-s1/r3
cd /Users/jan/Dev/jan/toyos-netring-s1
HEAD=$(git rev-parse HEAD)
BASE=$(git merge-base HEAD origin/main)
echo "== head $HEAD, base $BASE"
[ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "tree not clean"; exit 89; }

qemu_arm() { # name patch
  if [ -n "$2" ]; then git apply --check "$2" || exit 90; git apply "$2"; fi
  cargo test --test toyos-build -- lent_device_memory_refused > $S/$1.qemu.log 2>&1; echo "$1 QEMU lent_device_memory_refused EXIT=$?"
  if [ -n "$2" ]; then git apply -R "$2"; fi
}
host_arm() { # name patch
  git apply --check "$2" || exit 91; git apply "$2"
  cargo test -p toyos --lib shm:: > $S/$1.host.log 2>&1; echo "$1 HOST cargo test -p toyos --lib shm:: EXIT=$?"
  git apply -R "$2"
}

echo "== QEMU tier"
qemu_arm green ""
qemu_arm negative-control $S/negative-control.patch
for m in m1-sdk-takes-device-memory m4-kernel-says-every-region-is-ram; do
  qemu_arm $m $S/$m.patch
done
echo "== host tier"
for m in m1-sdk-takes-device-memory m2-sdk-takes-a-longer-region; do host_arm $m $S/$m.patch; done
[ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "tree not clean after QEMU and host arms"; exit 92; }

echo "== metal tier, staged only"
metal_arm() { # name patch words...
  name=$1; patch=$2; shift 2
  if [ -n "$patch" ]; then
    git apply --check "$patch" || exit 93; git apply "$patch"
    printf 'Stage: %s, applied for a metal readback and reset away\n' "$name" > $S/tmp-commit.txt
    git commit -q -a -F $S/tmp-commit.txt || exit 94
  fi
  rm -rf $S/metal/$name; mkdir -p $S/metal/$name
  cargo test --test toyos-build -- --metal --metal-readback $S/metal/$name "$@" > $S/$name.metal-stage.log 2>&1
  echo "$name METAL STAGE ($*) EXIT=$? at $(git rev-parse HEAD)"
  if [ -n "$patch" ]; then git reset -q --hard $HEAD; fi
}
metal_arm green "" boot:testcases boot:shared-debug
metal_arm negative-control $S/negative-control.patch lent_window_refused
metal_arm map-before-judge $S/map-before-judge.patch lent_window_refused
rm -f $S/tmp-commit.txt
echo "head after restore: $(git rev-parse HEAD)"
echo "porcelain after restore:"; git status --porcelain --ignore-submodules=none; echo "(end)"
