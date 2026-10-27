# PR 1072 evidence at ToyOS 93914b3844516884cc2afffa95b5706db1220fa3

Host: macOS (aarch64) development host. No machine was touched.

| file | command | exit |
|---|---|---|
| `ci-host.log` | `cargo run -- --ci host` | 0 ("Host: 103 step(s), all green") |
| `negative-controls.log` | `sh run.sh` (each `m*.patch` checked, applied, built, the two new tests run, reverted) | 0 for the script. With each mutation the targeted test exits 101; unmutated, both tests exit 0 |
| `metal-stage.log` | `cargo test --test toyos-build -- --metal --metal-readback $SCRATCH/t14 ioapic_topology` | 2 (the harness's `Staged` verdict: an image is staged and nothing is judged) |

## Sources for the Linux-side facts (fetched 2026-10-27)

- systemd, "Locking Block Device Access", https://systemd.io/BLOCK_DEVICE_LOCKING/. udevd takes `LOCK_SH|LOCK_NB` on the whole disk while it processes the device and refrains when it cannot. It treats `IN_CLOSE_WRITE` as the trigger to re-process.
- udev(7), https://www.freedesktop.org/software/systemd/man/latest/udev.html, `OPTIONS+="watch"`: a close after writing synthesizes a change uevent.
- udevadm(8), https://www.freedesktop.org/software/systemd/man/latest/udevadm.html, `settle`: "exits if all current events are handled", default timeout 120 s.
- systemd-udevd.service(8), `--event-timeout` default 180 s.
- systemd NEWS, "CHANGES WITH 259": udevd used BLKRRPART, which removes and re-adds every partition, until it moved to BLKPG.
- systemd v255 source, read for the host tool's own behaviour:
  - `src/shared/blockdev-util.c` `blockdev_reread_partition_table`: `flock(fd, LOCK_EX|LOCK_NB)`, then `ioctl(fd, BLKRRPART)`.
  - `src/udev/udev-manager.c` `synthesize_change`: a failed re-read is logged at debug and ignored. The control socket runs at `SD_EVENT_PRIORITY_IDLE` "to make sure that the ping is send back after fully processing the pending uevents (including the synthetic ones we may create due to inotify events)".
  - `src/udev/udevadm-settle.c`: the ping is sent only `if (getuid() == 0)`.
  - `src/udev/udevadm-lock.c`: opens the device `O_RDONLY`. Considered, not used.
- util-linux v2.39.3:
  - `disk-utils/blockdev.c`: opens each device `O_RDONLY`, so its close is no `IN_CLOSE_WRITE`.
  - `misc-utils/wipefs.c`: `--all` loops `blkid_do_probe` until no signature remains, and re-reads the table itself after wiping one on a whole disk.

Masking: `$HOME`, `$WORKTREES` and `$SCRATCH` replace local paths.
