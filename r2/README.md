# ToyOSOrg/ToyOS#1002, round 2: evidence at the commit itself

Head `9a35a2f16` on `main` `d7f269dbc`. The round-1 review's two blockers were the stale records (fixed in the amended commit) and evidence not tied to the commit; these runs are at the head.

| file | command | revision | exit |
|---|---|---|---|
| s1h-kbuild.log | kernel build, x86_64 and aarch64, toyos profile | `9a35a2f16` | 0 |
| s1h-frames.log | `cargo test -p kernel --lib frames::` | `9a35a2f16` | 0 (16) |
| s1h-guest.log | the 13 QEMU rows of round 1, `--nocapture`, with the boots' `pmm:` lines | `9a35a2f16` | 1: 12 pass; `libc_children` red |
| main-libc.log | `libc_children` on `main` `18a38738b` | main | 1, the same red |

`libc_children` is red on `main` as here: #994's `spawn_children_cap` holds 255 children, and with 2 MiB user pages they do not fit (posix_spawn `ENOMEM`). This commit leaves user memory in 2 MiB pages; #1003 makes it 4 KiB and the row passes from there (`pr-1003` r2, `s2h-guest.log`).

The boots' `pmm:` lines vary with what the image and the firmware withhold: on q35, of 4,288,393,216 usable bytes, `managed` from 4,241,670,144 to 4,254,642,176 across ten boots; on virt, of 2,138,558,464, from 2,108,456,960 to 2,112,770,048. `unaligned=0` in every boot: no fragment is lost to alignment. The PR body's single figure came from a pre-commit tree and is replaced by these.
