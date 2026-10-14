# #928 on metal: images built at `24ed5a756`, head `5321afa0c`

Run by the orchestrator (`5321afa0c` adds only an issue edit to `24ed5a756`). Masked with `mask.sh`, the BIOS version suffix too. `images.sha256` matches the manifests (`*/m928-*.txt`).

| machine | boot | row | result |
|---|---|---|---|
| T14 | `testcases-xhci-leave` | `usbd_drives_the_type_c_controller` | 1 passed, 0 failed (`t14/judge-bw.log`) |
| AMD bench | `testcases` | `amdvi_translates_the_stick_controller` | 1 passed, 0 failed (`amd/judge-bwa.log`) |

Both rows exercise the root-bus path: the T14's Type-C xHCI is on bus 0, and the AMD row claims nothing behind a bridge.
