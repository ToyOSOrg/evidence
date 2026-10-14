#!/bin/bash
# boot.sh <image> <outdir>: q35 with the virtio NIC behind a pcie-root-port; waits for netstack's claim verdict.
set -u
IMG=$1; OUT=$2; mkdir -p $OUT; rm -f $OUT/serial.log
cp /opt/homebrew/share/qemu/edk2-i386-vars.fd $OUT/vars.fd
cp $IMG $OUT/stick.img; truncate -s 256M $OUT/nvme.img
qemu-system-x86_64 -nodefaults -cpu "qemu64,+rdrand,+smap,+fsgsbase,+x2apic,+smep,+ssse3,+sse4.1,+sse4.2,+xsave,+xsaveopt,+avx,+avx2" \
  -machine q35,kernel-irqchip=split -smp cores=4 -m 2G -display none \
  -drive if=pflash,format=raw,unit=0,file=/opt/homebrew/share/qemu/edk2-x86_64-code.fd,readonly=on \
  -drive if=pflash,format=raw,unit=1,file=$OUT/vars.fd \
  -device intel-iommu,intremap=on,caching-mode=on,aw-bits=48 \
  -device nec-usb-xhci,id=xhci -drive if=none,id=stick,format=raw,file=$OUT/stick.img -device usb-storage,bus=xhci.0,drive=stick,bootindex=0 \
  -drive if=none,id=nvme0,format=raw,file=$OUT/nvme.img -device nvme,serial=deadbeef,drive=nvme0,msix-exclusive-bar=on \
  -vga std -device pcie-root-port,id=rp,chassis=9 -netdev user,id=net0 -device virtio-net-pci-non-transitional,netdev=net0,bus=rp,iommu_platform=on \
  -serial file:$OUT/serial.log -no-reboot > $OUT/qemu.out 2>&1 &
PID=$!
for i in $(seq 1 300); do
  if grep -qE "1af4:1041.*(handed over|NOT HANDED)|PCI 01:00.0.*(handed over|NOT HANDED)|could not be handed over" $OUT/serial.log 2>/dev/null; then sleep 3; break; fi
  kill -0 $PID 2>/dev/null || break; sleep 2
done
kill $PID 2>/dev/null; wait $PID 2>/dev/null
grep -aE "forwards|PCI 01:00.0|netstack:.*pci|run\(s\) of" $OUT/serial.log | sed 's/\x1b\[[0-9;]*m//g' | cut -c1-300
