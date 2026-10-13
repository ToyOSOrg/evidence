# PCIe hot-plug on QEMU q35 against ToyOS at ef684e4fc

Image: `cargo run -- --build-only` in the `toyos-lifecycle` worktree at
`ef684e4fc` (exit 0). QEMU 11.1.1, TCG on an arm64 host, OVMF
`edk2-x86_64-code.fd` as Homebrew ships it. `run.sh <arm>` is the launch
(the `cargo run` q35 cut down to the stick, xHCI, std VGA and the IOMMU, plus
one empty `pcie-root-port` `rp1`); `qmp.sh <arm> <command>...` speaks QMP.

Arms:
- `native`: `-global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off`.
- `acpi`: q35's default, ACPI hot-plug on root ports.

What each file shows:
- `uart-native.log:108-109`, `uart-acpi.log:108-109`: the kernel reads `rp1`
  (00:03.0) forwarding 0x81000000..0x81200000 (2 MiB) and
  0xc000000000..0xc020000000 (512 MiB prefetchable).
- `query-pci-before.json`: `rp1` secondary 1, subordinate 1 (one bus), the
  same two windows, its I/O window closed.
- `query-pci-after.json` (native, after `device_add virtio-rng-pci,bus=rp1`):
  `hp1`'s BAR 1 and BAR 4 at address -1, unassigned. The kernel logged nothing.
- `device-del.json`, `query-pci-after-del.json` (native): `DEVICE_DELETED` at
  once, `hp1` gone.
- `uart-acpi.log`, last four lines (acpi arm, after the same `device_add`):
  acpiserver takes GPE 1 and its method issues
  `Notify(\_SB_.PCI0.S18_.S00_, 0x1)`, "served by nothing".
  `acpi-after.json`: `hp1`'s BARs unassigned. `acpi-del.json`: no
  `DEVICE_DELETED` in the 6 s after `device_del` (the device was still listed).

Exit codes: each QEMU was ended by SIGTERM from the measuring shell after its
reading (`qemu-*.err`); the QMP commands each answered `{"return": {}}`.
