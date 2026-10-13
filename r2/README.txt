PR #895, design round 2. ToyOS head 40e17ce2d912f6392edf7ee7a9da42ae1462da39 (wt/toyos-hidpi merged with
origin/main ed1ec1512), QEMU 11.1.1 on an aarch64 macOS development host, guest x86-64 q35 under TCG,
Profile::HeadlessVirtioGpu (virtio-gpu-pci behind intel-iommu, iommu_platform=on).

1. The device's own answers (scratch probe, never lands):
   m895-probe.patch   adds, in the kernel's virtio-gpu bring-up, GET_DISPLAY_INFO; GET_EDID with
                      VIRTIO_GPU_FLAG_FENCE and fence_id 0x5eed0895; GET_EDID unfenced, its bytes printed;
                      MOVE_CURSOR on the cursor queue with a device-readable-only chain and with a 24-byte
                      device-writable response buffer, whose first word is preset to 0xdeadbeef. It routes
                      the machine test name iommu_virtio_platform to that probe and sets xres=1024,yres=768.
   m895-run.sh        applies the patch, runs `cargo test --test toyos-build -- iommu_virtio_platform`,
                      reverses the patch, prints git status (empty). TEST_EXIT=1 is the probe reporting
                      its lines as an Err by design; RESTORE_EXIT=0 (m895-script.out).
   m895-run.log       lines 265-281 are the readings.
   device-get-edid-1024x768-base.bin   the base block of that GET_EDID answer (bytes 0..127 of the
                      printed hex; the log line elided the rest). Checksum 0, extension count 1,
                      bytes 0x15/0x16 = 26x19 cm, first descriptor a detailed timing 1024x768, 260x195 mm.
   Readings: GET_DISPLAY_INFO type 0x1101, scanout 0 enabled 1024x768+0+0. Fenced GET_EDID answered
   flags 0x1 and fence_id 0x5eed0895; unfenced answered flags 0. GET_EDID's size field reads 1024
   (the buffer, not the EDID). Cursor queue: used len 0 for both chain shapes and the response word
   left at 0xdeadbeef: QEMU writes no cursor-queue response.

2. The decline control as it stands on main, unmodified: decline-run.log.
   `cargo test --test toyos-build -- iommu_virtio_platform`, EXIT=0. The kernel-driven virtio-gpu,
   with VIRTIO_F_ACCESS_PLATFORM withheld, "refused the feature set 0x100000002 ... DEVICE_STATUS=0x3
   without FEATURES_OK".

3. The auto-scale rule round 2 proposes: scale-rule-r2.awk over scale-rule-r2.rows and
   scale-rule-r2-ms.rows (scale-rule-r2.log). The Microsoft rows are a labelled comparison, not an oracle.

Documents read (fetched with User-Agent toyos-build):
   W3C CSS Values and Units Level 3, CRD 22 March 2024, https://www.w3.org/TR/css-values-3/,
     sha256 dcce1f2ff24d66a05373696e07dda59727303a421ee4593eb433092029df0094, section 5.2
     (reference pixel: 1/96 in at a nominal arm's length of 28 in, about 0.0213 degrees).
   VESA E-EDID Release A Rev. 2 (EDID 1.4), sha256 0c44136eab19c23302f8db7d7354b7ce3b7150d3ef2eb8fb172c520c1a2efc4e:
     section 3.6.2 and Table 3.12 (0x15/0x16: both nonzero = cm; one zero = aspect ratio; both zero = unknown;
     "The host ... is expected to use this data to get a rough idea of the image size to generate properly
     scaled text and icons"), Table 3.21 notes 11, 12 and 17 (detailed timing image size in mm, 0 = undefined).
   Intel ARK, Core i5-1135G7 (Tiger Lake GT2, 8086:9A49): Max Resolution DP 7680x4320@60Hz,
     eDP 4096x2304@60Hz, HDMI 4096x2304@60Hz.
   Microsoft Learn, "DPI-related APIs and registry settings", page sha256
     f8eea0b74085ce278425b150d268c31dd5961bd6120740d28e3d4dc19ff74814: Table 1 and Table 5.
   virtio 1.2 cs01 (sha256 in ../sources.txt): 5.7.6.5, 5.7.6.6, 5.7.6.7 fence_id, 5.7.6.10.
