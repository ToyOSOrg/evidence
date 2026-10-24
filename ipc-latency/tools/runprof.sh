#!/bin/sh
# usage: runprof.sh <image> <out> <smp> [extra qemu args]
img=$1; out=$2; smp=$3; shift 3
S=~/.claude/jobs/2280e09e/tmp/scratchpad/agents/ipc-latency
cp /opt/homebrew/share/qemu/edk2-i386-vars.fd $S/vars-$$.fd
cp "$img" $S/img-$$.img
exec qemu-system-x86_64 -nodefaults -cpu qemu64,+rdrand,+smap,+fsgsbase,+x2apic,+smep,+ssse3,+sse4.1,+sse4.2,+xsave,+xsaveopt,+avx,+avx2,+pcid,+invpcid \
  -display none -machine q35,kernel-irqchip=split -smp cores=$smp -m 2G \
  -drive if=pflash,format=raw,readonly=on,file=/opt/homebrew/share/qemu/edk2-x86_64-code.fd \
  -drive if=pflash,format=raw,file=$S/vars-$$.fd \
  -device intel-iommu,intremap=on,caching-mode=on,aw-bits=48 \
  -device nec-usb-xhci,id=xhci -drive if=none,id=stick,format=raw,file=$S/img-$$.img \
  -device usb-storage,bus=xhci.0,drive=stick,bootindex=0 \
  -vga std -serial stdio -no-reboot -action shutdown=poweroff \
  -plugin $S/tools/plugin/insncount.dylib,out=$out,stacks=$out.stacks "$@"
