#!/bin/zsh
# arm: acpi | native
arm=$1; S=${0:A:h}; W=<worktree>
cp $W/target/bootable.img $S/stick-$arm.img
cp /opt/homebrew/share/qemu/edk2-i386-vars.fd $S/vars-$arm.fd
extra=()
[[ $arm == native ]] && extra=(-global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off)
rm -f $S/qmp-$arm.sock
qemu-system-x86_64 -nodefaults -cpu qemu64,+rdrand,+smap,+fsgsbase,+x2apic,+smep,+ssse3,+sse4.1,+sse4.2,+xsave,+xsaveopt,+avx,+avx2 -display none \
  -machine q35,kernel-irqchip=split -smp cores=2 -m 2G \
  -drive if=pflash,format=raw,readonly=on,file=/opt/homebrew/share/qemu/edk2-x86_64-code.fd \
  -drive if=pflash,format=raw,file=$S/vars-$arm.fd \
  -device intel-iommu,intremap=on,caching-mode=on,aw-bits=48 \
  -device nec-usb-xhci,id=xhci -drive if=none,id=stick,format=raw,file=$S/stick-$arm.img \
  -device usb-storage,bus=xhci.0,drive=stick,bootindex=0 \
  -vga std \
  -device pcie-root-port,id=rp1,chassis=1,slot=1 \
  $extra \
  -serial file:$S/uart-$arm.log -no-reboot \
  -qmp unix:$S/qmp-$arm.sock,server,nowait 2>$S/qemu-$arm.err &
echo $! > $S/qemu-$arm.pid
