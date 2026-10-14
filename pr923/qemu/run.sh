#!/bin/sh
# usage: run.sh <name> <cpu>
S=<scratch>/qemu
Q=$(dirname $(dirname $(which qemu-system-x86_64)))/share/qemu
cp $Q/edk2-i386-vars.fd $S/$1-vars.fd
cp $S/bootable.img $S/$1.img
qemu-system-x86_64 -nodefaults -cpu "$2" -display none -machine q35 -smp cores=2 -m 2G \
  -drive if=pflash,format=raw,unit=0,readonly=on,file=$Q/edk2-x86_64-code.fd \
  -drive if=pflash,format=raw,unit=1,file=$S/$1-vars.fd \
  -device nec-usb-xhci,id=xhci -drive if=none,id=stick,format=raw,file=$S/$1.img \
  -device usb-storage,bus=xhci.0,drive=stick,bootindex=0 -vga std \
  -serial file:$S/$1-serial.log -debugcon file:$S/$1-debugcon.log -global isa-debugcon.iobase=0x402 &
echo $! > $S/$1.pid
