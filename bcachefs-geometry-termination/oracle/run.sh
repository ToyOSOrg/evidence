#!/bin/bash
# Usage: run.sh <image-dir> <out-dir>. Boots the verified Arch kernel with its own initramfs plus
# one archive holding the bcachefs-tools bundle and the images; serial log to <out-dir>/serial.log.
set -euo pipefail
images=$1; out=$2
here=$(cd "$(dirname "$0")" && pwd)
up=$CONSOLIDATION/upstream
mkdir -p "$out"
stage=$(mktemp -d "$out/stage.XXXX")
mkdir -p "$stage/images" "$stage/proc" "$stage/sys" "$stage/dev"
tar -xzf "$up/bcachefs-tools-runtime.tar.gz" -C "$stage"
(cd "$stage/tools-bundle" && shasum -a 256 -c SHA256SUMS >/dev/null)
cp "$here/fsck-init" "$stage/fsck-init"; chmod 755 "$stage/fsck-init"
cp "$images"/*.img "$stage/images/" 2>/dev/null || true
cp "$images"/*.pass "$stage/images/" 2>/dev/null || true
cp "$images"/cmds.sh "$stage/images/" 2>/dev/null || true
cp "$images"/*.raw "$stage/images/" 2>/dev/null || true
(cd "$stage" && find . -mindepth 1 | sed 's|^\./||' | cpio -o -H newc 2>/dev/null) > "$out/extra.cpio"
cat "$up/arch/boot/x86_64/initramfs-linux.img" "$out/extra.cpio" > "$out/initrd.img"
rm -rf "$stage" "$out/extra.cpio"
qemu-system-x86_64 -machine q35 -accel tcg,thread=multi -cpu max -smp 4 -m 6G -display none -no-reboot \
  -kernel "$up/arch/boot/x86_64/vmlinuz-linux" -initrd "$out/initrd.img" \
  -append "console=ttyS0 rdinit=/fsck-init panic=-1 quiet" -serial "file:$out/serial.log" -monitor none
rm -f "$out/initrd.img"
grep -E "^===(EXIT|VERSION|DONE)" -A1 "$out/serial.log" | grep -E "^===EXIT|^===DONE|^bcachefs|^[0-9]" || true
