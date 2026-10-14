# #916 stage A on the T14

Two boots of the images `stage-a/request.txt` staged at `3f421a7a8dfc62d85a726882cee0f83c8edfe22e`, run by the orchestrator on the ThinkPad T14 (Intel, `aw=48 mgaw=39`). Runner `m916-t14.log`: both boots `rc=0`, the judge `EXIT=0`.

- `judge-a.log`: 3 passed, 0 failed, 2 boots — `claim_reuses_its_remapping_entry`, `domain_ends_below_the_host_bridges` (4 domains, none reaching a root-bridge window), `usbd_drives_the_type_c_controller`.
- `testcases/` and `testcases-xhci-leave/`: each boot's readback (`kernel.log`, `loader.log`, `boot.txt`, `verdict.txt` = `passed`). Both declare the seven windows of the recorded boot, and every domain is `aw=48 mgaw=39 addresses from 0x2000000000 to 0x4000000000`: the old rule, as the hybrid one keeps it on a unit no wider than the CPU.
- `images.sha256`: the two images and log partitions as booted (not published).

Masked: a USB stick's serial number (`<serial>`), GUIDs (`<uuid>`), paths.
