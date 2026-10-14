# #916 round 2 on metal: images built at `5dabb22b51ff01b93133df58218480233878ddb9`

Run by the orchestrator after review round 1, on `main` `5b48a3d17` merged. Every file is whole, masked with the orchestrator's `mask.sh` (paths, serials, IPs, MACs, vendor, model and BIOS strings), and the BIOS version suffix `mask.sh` leaves after `<bios>` in `boot.txt` masked by hand at the tip.

| machine | boots | rows | result | CPU width / unit width → rule |
|---|---|---|---|---|
| T14 | `testcases`, `testcases-xhci-leave` | `claim_reuses_its_remapping_entry`, `domain_ends_below_the_host_bridges`, `usbd_drives_the_type_c_controller` | 3 passed, 0 failed (`t14/judge-a2.log`) | 39 / 39 (`mgaw=39`) → declared rule, `addresses from 0x2000000000 to 0x4000000000` |
| AMD bench | `testcases` | `amdvi_translates_the_stick_controller` | 1 passed, 0 failed (`amd/judge-a2.log`) | 48 / 48 (mode-4 tables) → declared rule, `addresses from 0x400000000000 to 0x1000000000000` |

Manifests and runner logs: `t14/m916-r2-t14.{txt,log}`, `amd/m916-r2-amd.{txt,log}`. Requests: `request.txt` (both machines), `t14/request.txt`, `amd/request.txt`.

Images as booted (SHA-256; not published):

```
1b8696297d440f648a8b67ce1a67462ded490f4e79b5a484aec279c44cc1f996  t14/testcases/image.img
c98d263775c84b8a6f5b847bf368f41bae9cfa2e82729680fe2a8ce5097bd653  t14/testcases-xhci-leave/image.img
604a3cd1841b7a8228578c10becc9014a87f93be16eb70f1443c989aa23c2db9  amd/testcases/image.img
```

This supersedes `round2-metal/`, which is the same run masked by an earlier script; this commit re-masks it and every earlier file that carried a model or BIOS string.
