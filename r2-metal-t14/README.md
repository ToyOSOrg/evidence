# PR #1185: T14 metal at `668160b1e`

The coordinator ran the boots: usbload, then testcases, each `--fat32-check`.
Both runner rc=0, and both verdicts `passed`.

- `judge.log`: `cargo test --test toyos-build -- --metal --metal-readback <scratch>/metal
  nvme_leaves_the_benchs_disk_alone the_disk_survives_a_reset_under_load`, judging the
  readbacks in place (no build). Exit 0, `2 passed, 0 failed, 2 boot(s)`. 7273 KiB of
  the load's lines reached the stick before the reset.
- `nvme-up.txt`: the T14 drive passed the new geometry checks (512-byte sectors, 4 I/O queues).
- `stick-*-recover.log`: `stickcheck` (source `stickcheck-main.rs`) run on each readback's
  log partition. It runs `toyos-fat32-check`, then `Fat32::recover` on a copy, then the
  checker again.
  - Both sticks were already clean: the reset under load left no stop state.
  - On both, recovery changed nothing, and a second recovery changed nothing.
  - These boots therefore show recovery harmless on a real clean stick, not a repair on
    metal.
  - Each metal boot reflashes the stick's LOG partition, so no boot here mounts a volume
    an earlier boot left. Repair of stop states is held by the host tests over every
    stop the crate's calls can leave.
