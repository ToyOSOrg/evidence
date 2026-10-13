#!/bin/sh
# Mirrors build/qemu.rs launch() for Profile::Virtio on x86_64, headless, own sockets.
exec qemu-system-x86_64 -nodefaults -cpu qemu64,+rdrand,+smap,+fsgsbase,+x2apic,+smep,+ssse3,+sse4.1,+sse4.2,+xsave,+xsaveopt,+avx,+avx2 \
 -display none -machine q35,kernel-irqchip=split -smp cores=4 -m 2G \
 -drive if=pflash,format=raw,unit=0,file=/opt/homebrew/share/qemu/edk2-x86_64-code.fd,readonly=on \
 -drive if=pflash,format=raw,unit=1,file=<scratch>/run/vars.fd,readonly=off \
 -device intel-iommu,intremap=on,caching-mode=on,aw-bits=48 \
 -device nec-usb-xhci,id=xhci -drive if=none,id=stick,format=raw,file=$1 \
 -device usb-storage,bus=xhci.0,drive=stick,bootindex=0 \
 -drive if=none,id=nvme0,format=raw,file=<scratch>/run/nvme.img -device nvme,serial=deadbeef,drive=nvme0,msix-exclusive-bar=on \
 -device usb-kbd,bus=xhci.0 -device usb-tablet,bus=xhci.0 \
 -vga none -device virtio-gpu-pci,xres=1280,yres=720,iommu_platform=on \
 -chardev qemu-vdagent,id=vdagent0,clipboard=on,mouse=off \
 -device virtio-serial-pci-non-transitional,id=vdagent-serial,max_ports=2,iommu_platform=on \
 -device virtserialport,bus=vdagent-serial.0,nr=1,chardev=vdagent0,name=com.redhat.spice.0 \
 -serial file:<scratch>/run/uart.log -chardev file,id=cs0,path=$2 \
 -device virtio-serial-pci-non-transitional,id=virtio-serial0,max_ports=1,iommu_platform=on -device virtconsole,chardev=cs0,id=console0 \
 -no-reboot -qmp unix:<scratch>/run/qmp.sock,server,nowait \
 -trace 'vdagent_*' -D $3
