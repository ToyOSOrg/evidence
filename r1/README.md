# PR 1033, round 1: main's five shared-boot reds

The branch has three commits on main c184a8451. The head is aff4fd105. Paths are masked.

| file | command | revision | exit |
|---|---|---|---|
| base-ship.log.gz, base-act.log.gz | the scratch QEMU sweep (`scratch-sweep.patch`): vector_state, 209, 210; handle_lifetime and spawn_child_ends_first on the actuator kernel | c184a8451 (the whole change reverted) | 1, 1: all five red |
| fix1-ship.log.gz | the same, before 210's mount line was dropped | the work tree, uncommitted | 1: only "d_ino is a mount's st_ino" NO |
| head-ship.log.gz, head-act.log.gz | the same sweeps | aff4fd105 | 0, 0 |
| head-neighbours.log.gz | mmap_prot, process_lifecycle, abuse_inbox, empty_dir_stat, endowment_denied, hierarchy_paths, 211, and more in one boot | aff4fd105 | 1. The changed tests pass. app_view and readdir_bound are RUST_SKIP rows that need their own image or boot. Their reds, and the OOM cascade after readdir_bound filled /tmp, come from how the sweep was put together. |
| head-readdir.log.gz, head-appview.log.gz, head-neighbours2.log.gz | readdir_bound alone; app_view on proctreecase; then stat_identity, std_fs and 207 | aff4fd105 | 0, 0, 0 |
| host2.log.gz | `cargo run -- --ci host`, 101 steps | aff4fd105 | 0 |
| build-only.log.gz | `cargo run -- --build-only` | aff4fd105 | 0 |
| controls/fat-list-offset.* | FAT listing identity off by one: the new host test turns red, and the mutation is restored | the work tree | 101 |
| metal-prep.log.gz, metal-request.txt | `--metal-readback`, staged, not run | aff4fd105 | 2 |
