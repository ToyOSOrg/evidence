# PR 1031 at e0629e85a (base d2b2b6949), macOS aarch64 host

| check | command | exit |
|---|---|---|
| lifecycle host tests | `cargo test -p toyos-supervisor` | 0 |
| host CI | `cargo run -- --ci host` | 0 (101 steps) |
| image | `cargo run -- --build-only` | 0 |
| QEMU x86-64 | `cargo test --test toyos-build -- a_host_disk_beside_the_stick_is_left_alone nvme_disk_boots the_log_lands_on_the_boot_stick iommu_virtio_platform` | 0 (4/4) |
| metal staging | `cargo test --test toyos-build -- --metal --metal-readback <dir> nvme_leaves_the_benchs_disk_alone` | 2 (Staged by design; no machine touched) |

Negative controls (each applied as the patch in `controls/`, built, run, reverted in the same command):

| control | test | exit | failure |
|---|---|---|---|
| c1 row back to `1b36:0010` | QEMU host-disk | 1 | no nvme driver brought its controller up |
| c2 fileserver formats undesignated DATA | QEMU host-disk | 1 | the foreign line never said |
| c3 BOOT granted by ESP type | lifecycle host test | 101 | each_role_is_the_booted_disks_and_none_is_the_hosts |
| c4 says foreign, formats anyway | QEMU host-disk | 1 | the disk was written: byte 34603008 (sector 67584, DATA's first) |

Home directory paths are masked as `~`.
