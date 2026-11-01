#!/bin/sh
# $1: stick image, $2: serial log
exec /opt/homebrew/bin/qemu-system-x86_64 -nodefaults -machine q35,kernel-irqchip=split -cpu max -smp 4 -m 4G \
  -drive if=pflash,format=raw,readonly=on,file=/opt/homebrew/Cellar/qemu/11.1.1/share/qemu/edk2-x86_64-code.fd \
  -drive if=pflash,format=raw,file=vars.fd \
  -drive if=none,id=stick,format=raw,file="$1" \
  -drive if=none,id=scr,format=raw,file=scratch.img \
  -device intel-iommu,intremap=on,caching-mode=on,eim=on \
  -device qemu-xhci,id=xhci \
  -device usb-storage,bus=xhci.0,drive=stick,bootindex=0 \
  -device usb-storage,bus=xhci.0,drive=scr,serial=SCRATCH1 \
  -vga std -display none -no-reboot -serial file:"$2"
