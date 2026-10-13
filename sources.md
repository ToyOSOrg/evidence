# What ToyOSOrg/ToyOS#896 read of each hypervisor

Read on the audit's day from each project's default branch, at the commit
`git ls-remote <repository> HEAD` answered then; nothing here was booted.

| Project | Commit |
|---|---|
| Cloud Hypervisor, https://github.com/cloud-hypervisor/cloud-hypervisor | 47ea5d92008108bce1a04ad91c621b9c1841417d |
| crosvm, https://github.com/google/crosvm | 098250cd6134182fc58a2f3e8f2a8bf70226e077 |
| VirtualBox, https://github.com/VirtualBox/virtualbox | 32f5f1de3fe17a3df177d6b3259112bcbf79856e |
| FreeBSD (bhyve), https://github.com/freebsd/freebsd-src | 39d6e2226484ca434c7d980eda4aa19ed0d62c9e |
| QEMU, https://gitlab.com/qemu-project/qemu | 615ece3c406b262996e569f29ea6eed0d81c4d8d |

## Files

Cloud Hypervisor: `docs/device_model.md`, `docs/iommu.md`, `docs/uefi.md`,
`docs/api.md`, `vmm/src/acpi.rs` (`create_facp_table`, `create_iort_table`,
the `VIOT`), `devices/src/acpi.rs` (the GED and `\_SB_.PWRB`),
`arch/src/x86_64/mod.rs` (CPUID `0x4000_0010`),
`virtio-devices/src/transport/pci_device.rs` (MSI-X table and PBA in the
virtio BAR; device id `0x1040` + type).

crosvm: the book's device list, https://crosvm.dev/book/devices/index.html;
`devices/src/` (its listing: no HPET), `devices/src/acpi.rs`,
`x86_64/src/acpi.rs` (FADT: PM timer "not supported", no `HW_REDUCED`;
MADT x2APIC; MCFG), `x86_64/src/cpuid.rs` (leaf 15H when a calibrated leaf is
required or forced), `x86_64/src/lib.rs` (`--bios`, pflash),
`devices/src/virtio/virtio_pci_device.rs` (MSI-X table and PBA in the
settings BAR; device id `0x1040` + type).

VirtualBox: the user manual, https://www.virtualbox.org/manual/UserManual.html
(`VBoxManage modifyvm`: `--x86-hpet` off by default, `--iommu` none by default
and ICH9 only, `--chipset` PIIX3 by default, `--arm-gic-its` off by default,
`--nic-type`, `--mouse`, `--keyboard`, `--audio-controller`, `--firmware`);
`src/VBox/Devices/Storage/DevNVMe.cpp` (`80ee:4e56`, class `01:08:02`, MSI-X
in BAR 5); `src/VBox/Devices/Network/DevVirtioNet.cpp`
(`PCI_DEVICE_ID_VIRTIONET_HOST` `0x1000`); `src/VBox/Devices/VirtIO/VirtioCore.h`
(`VIRTIO_F_ACCESS_PLATFORM`, "VirtIO 1.1 NYI"); `src/VBox/Devices/PC/DevACPI.cpp`
(`HpetEnabled` default false; MCFG, DMAR, IVRS gated); `src/VBox/Devices/Audio/DevHda.cpp`
(MSI); `src/VBox/Devices/Bus/DevIommuIntel.cpp` (interrupt remapping);
`src/VBox/Devices/Input/UsbMouse.cpp` (the USB tablet's interface: subclass 0,
protocol 0).

bhyve: `bhyve(8)`, https://man.freebsd.org/cgi/man.cgi?query=bhyve&sektion=8;
`usr.sbin/bhyve/virtio.c` and `virtio.h` (legacy I/O BAR, `QUEUE_PFN`, ids
`0x1000`..), `pci_nvme.c` (`fb5d:0a0a`, MSI-X in BAR 4), `pci_e82545.c`
(`8086:100f`), `pci_hda.c` (INTx alone), `acpi.c` (HPET, MCFG, FADT with
SMI_CMD, PM1 and PM timer), `amd64/` (atkbdc, ps2kbd, ps2mouse),
`usb_mouse.c` (the xHCI tablet's interface: boot subclass, mouse protocol).

QEMU: `hw/virtio/virtio-pci.c` (`disable-legacy=auto`; a transitional device
refuses `iommu_platform`), `hw/nvme/ctrl.c` (`use-intel-id`,
`msix-exclusive-bar`), `hw/i386/pc.c` (the `hpet` machine property).

OASIS, *Virtual I/O Device (VIRTIO) Version 1.2*, Committee Specification 01,
https://docs.oasis-open.org/virtio/virtio/v1.2/cs01/virtio-v1.2-cs01.html:
§4.1.2.2, §4.1.4, §5.13, §5.13.6.8.1, §6, §6.1.

## Read for review round 1 (ToyOSOrg/ToyOS#896, issuecomment-6131184845)

At the same commits as above unless named.

Cloud Hypervisor: `docs/iommu.md` ("Usage": a device sits behind the
virtio-iommu only when tagged `iommu=virtio`, "the default value will always be
`off`"); `docs/device_model.md` ("I/O APIC": disabled without the serial port);
`docs/api.md` (`/vm.power-button`); `vmm/src/cpu.rs` (`create_madt` lists an
I/O APIC unconditionally); `vmm/src/device_manager.rs` and `vmm/src/vm.rs`
(the I/O APIC is created unconditionally); `vmm/src/acpi.rs`
(`create_facp_table`: `X_PM_TMR_BLK` at 208 under flags
`HW_REDUCED_ACPI|RESET_REG_SUP|TMR_VAL_EXT`; PM1a only under
`legacy_acpi_pm1a`; `create_viot_table`).

crosvm: `src/crosvm/cmdline.rs` (`--vfio PATH,iommu=viommu|coiommu|pkvm-iommu|off`,
`--vfio-isolate-hotplug`); `src/crosvm/sys/linux.rs` (the virtio-iommu is made
only where `iommu_attached_endpoints` is non-empty or hotplug isolation has a
bus range); `src/crosvm/sys/linux/device_helpers.rs`
(`setup_virtio_access_platform` attaches a device only where
`supports_iommu()`); `devices/src/pci/pci_device.rs` (`supports_iommu`
defaults to false); `devices/src/virtio/virtio_pci_device.rs` (no override).

OASIS virtio 1.2 CS01 (URL above): §4.1.5.1.1.1 ("Non-transitional drivers
MUST look for the Virtio PCI Capabilities ... and fail gracefully"); §5.13.2
(`requestq`, `eventq`).

Intel, *Intel 64 and IA-32 Architectures Software Developer's Manual*, Volume 1,
253665-093US, https://cdrdv2.intel.com/v1/dl/getContent/671436: Table 21-9,
`ECX[31]` "Not Used: Intel processors always return 0. Allocated for use by
software emulation."; Table 21-53, leaf 15H. AMD's APM Volume 3 (24594) timed
out from amd.com twice and is unread.

ACPI: uefi.org answers 403 (a JavaScript challenge) for ACPI 6.5's HTML and
PDF, and the Internet Archive was offline, so 6.5 is unread. The sections cited
are read in a third-party text copy of ACPI 6.6,
https://github.com/matotubol/svmvisor at b93b6525c7a53ffc0bacbfbf9df3bb8b443f01a9,
`docs/ACPI_Spec_6.6/`: page_123.txt (§4.1, "the ACPI Fixed Hardware interface
is not implemented"; §4.1.1.1, the GED's `_EVT`), page_154.txt (§4.8.3.3,
3.579545 MHz), page_157.txt (§4.8.3.7), page_182.txt (§5.2.9's note: OSPM
ignores offsets 46 through 108 and 148 through 232 under `HW_REDUCED_ACPI`),
page_189.txt (`X_PM_TMR_BLK` at offset 208).
