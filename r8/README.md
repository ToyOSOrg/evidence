# PR #1074, round 8: the landing tree's testcases on the T14

- **Run:** head 094323f29 (main 370d7d9f6 + #1074), testcases and testcases-watchdog, one NVMe boot each. Both guests' own verdicts read `passed`.
- **Judge:** main's harness from a check tree at 094323f29 (`judge-landing.log`, masked) gives 255 passed, 7 failed.

| Row | Why it is red |
|---|---|
| `i219_messages_on_its_msi_vector` | No frame on the wire, as `issues/i219-msi-passes-only-when-the-network-sends-it-a-frame.md` records. |
| `idle_entered`, `amdvi_translates_the_boot_controller`, `amdvi_remaps_the_boot_controller`, `amdvi_usbd_drives_its_own_entry` | AMD-bench rows judged against a T14 readback: "this row runs on the AMD bench", and the T14's spare xHCI 8086:9a13 has MSI but no MSI-X. |
| `klogd_hosted` | Its `must_be_clean` forbids `iommu: DMA FAULT owner=process` anywhere in the testcases boot. `test_rs_usbd_spare_fault` in that same boot stages exactly that fault: it aims the command ring at 0x50200000, 1 GiB past its grant at 0x10200000. The fault arm now runs on the T14 because #1095's NVMe boot leaves its xHCI spare. This is main's harness, independent of pipes. |
| `hda_tone` | One underrun in the first stream (`underruns=1 starve_max=1`, `hda-tone-window.txt`). The samples cross a shared-memory ring, and a pipe carries only the signal bell. Eight earlier head boots on this PR read 0, including the 9d818b3ed-based head whose pipe code is identical. Unexplained; main 370d7d9f6's own testcases is staged as the control. |
