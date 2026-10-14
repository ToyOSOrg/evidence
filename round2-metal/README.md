# #916 review round 1 on metal: images built at `5dabb22b51ff01b93133df58218480233878ddb9`

Run by the orchestrator. The judge logs are whole, masked only for paths, GUIDs (`<uuid>`) and a USB stick's serial number (`<serial>`).

| machine | rows | result | rule `bounds` took |
|---|---|---|---|
| T14 (Intel, 2 boots) | `claim_reuses_its_remapping_entry`, `domain_ends_below_the_host_bridges`, `usbd_drives_the_type_c_controller` | 3 passed, 0 failed (`t14/judge-a2.log`, runner `t14/m916-r2-t14.log`) | `iommu: the CPUs issue 39-bit physical addresses`, unit `aw=48 mgaw=39`: declared rule, `addresses from 0x2000000000 to 0x4000000000` as before |
| AMD bench (1 boot) | `amdvi_translates_the_stick_controller` | 1 passed, 0 failed (`amd/judge-a2.log`, runner `amd/m916-r2-amd.log`) | `iommu: the CPUs issue 48-bit physical addresses`, mode-4 (48-bit) domains: declared rule, `addresses from 0x400000000000 to 0x1000000000000` as before |

Readbacks: `t14/testcases/`, `t14/testcases-xhci-leave/`, `amd/testcases/` (`kernel.log`, `loader.log`, `boot.txt`, `verdict.txt`). The images and log partitions are not published; `images.sha256` holds their hashes.
