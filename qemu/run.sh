#!/bin/sh
# $1 cpu model, $2 log name
S=<scratchpad>/agents/amd-ucode-scout
cp /opt/homebrew/share/qemu/edk2-i386-vars.fd $S/qemu/vars-$2.fd
exec qemu-system-x86_64 -nodefaults -machine q35 -cpu "$1" -smp sockets=1,cores=2,threads=2 -m 4G \
  -drive if=pflash,format=raw,unit=0,file=/opt/homebrew/share/qemu/edk2-x86_64-code.fd,readonly=on \
  -drive if=pflash,format=raw,unit=1,file=$S/qemu/vars-$2.fd \
  -drive if=none,id=stick,format=raw,file=<dev>/toyos-amd-ucode-scout/target/bootable.img,snapshot=on \
  -device qemu-xhci,id=xhci -device usb-storage,bus=xhci.0,drive=stick,bootindex=0 \
  -vga std -display none -no-reboot -serial file:$S/qemu/$2.serial
