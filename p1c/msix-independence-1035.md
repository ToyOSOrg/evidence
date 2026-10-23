msix_table_read_in_place red at #1035 (r2, r4): cause is main's #1031, not #1035.

- Failure (r4 testcases/kernel.log:42053): `msix_in_place: the claim on the T14's NVMe was refused: AlreadyExists`.
- Holder: `spawn: /system/bin/nvme pid=4` at boot (kernel.log:239), `nvme 04:00.0: up` (:247) — the nvme `drives` row now claims the T14's NVMe (1c5c:1327 at 04:00.0).
- Row in the derived image manifests:
  - p1b/r1 (pass): `[programs.nvme] drives = ["pci:01:08:02/1b36:0010"]` (QEMU's NVMe only)
  - p1b/r4 (fail): `[programs.nvme] drives = ["pci:01:08:02"]` (every NVMe by class)
- That change is e0629e85a "nvme: every image drives NVMe by its class", landed on main as f5cfb2feb (#1031), between #1035 r1's base and its r2 rebase. #1035's diff touches no nvme row, claim or PCI code.
- Across 12 readbacks: every boot that spawned nvme (p1b r2, p1b r4, nvme-metal/r3) is post-#1031; every msix_in_place pass (p1b r1, p1/r1, p1/r2 and base, backing r3/r4) spawned no nvme. main-reds (03:08) predates #1031 in its image.
- Fix belongs to main (#1031's owner): msix_in_place's "the T14's NVMe" entry assumes an unclaimed disk the image now drives. Drop that entry (the AX210 still covers the T14) or have it read the entry the nvme driver armed.
