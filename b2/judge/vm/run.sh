#!/bin/sh
# Boots the judge guest under HVF; ssh on localhost:2229.
V=$(dirname "$0")
exec qemu-system-aarch64 -machine virt,accel=hvf -cpu host -smp 6 -m 8192 \
  -drive if=pflash,format=raw,file=$V/code.fd,readonly=on -drive if=pflash,format=raw,file=$V/vars.fd \
  -drive if=virtio,format=qcow2,file=$V/disk.qcow2 -drive if=virtio,format=raw,file=$V/seed.iso,readonly=on \
  -netdev user,id=n0,hostfwd=tcp:127.0.0.1:2229-:22 -device virtio-net-pci,netdev=n0 \
  -nographic -serial file:$V/serial.log -monitor none
