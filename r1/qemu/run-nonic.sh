#!/bin/sh
# usage: run.sh <image> <serial-log>
exec qemu-system-x86_64 -nodefaults -cpu qemu64,+rdrand,+smap,+fsgsbase,+x2apic,+smep,+ssse3,+sse4.1,+sse4.2,+xsave,+xsaveopt,+avx,+avx2 \
  -display none -machine q35,kernel-irqchip=split -smp cores=4 -m 4G -device intel-iommu,intremap=on,caching-mode=on,aw-bits=48 \
  -drive if=pflash,format=raw,unit=0,file=/opt/homebrew/share/qemu/edk2-x86_64-code.fd,readonly=on \
  -drive if=pflash,format=raw,unit=1,file=$(dirname $1)/vars.fd,readonly=off \
  -device nec-usb-xhci,id=xhci -drive if=none,id=stick,format=raw,file=$1 \
  -device usb-storage,bus=xhci.0,drive=stick,bootindex=0 \
  \
  -vga std -serial file:$2 -no-reboot -action shutdown=poweroff
