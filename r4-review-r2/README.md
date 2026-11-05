# PR #1185 r3 (`e41116092`, `258e9197d`)

| log | command | exit |
|---|---|---|
| `r3-ci-host.log` | `cargo run -- --ci host` at `e41116092` | 0, 109 steps |
| `r3-build-x86.log` | `cargo run -- --build-only` at `e41116092` | 0 |
| `r3-fat32-a.log` | `cargo test -p toyos-fat32` | 0 |
| `r3-fs-full.log` | `cargo test` in `system/fileserver` | 0 (121 + 3) |
| `r3-clippy.log` | `cargo clippy -p toyos-fat32 --all-targets -- -D warnings` | 0 |

`r3-order-controls.log` holds three mutations, each the old ordering. Each removes one
new flush from `lib/fat32/src/fs.rs` and runs `cargo test --lib fat::` in `system/fileserver`:
- without the erase's flush, `an_unlink_stopped_anywhere_is_recovered` fails: recovery is
  refused at epoch 4, writes 0b10;
- without the rename's flush, `a_rename_stopped_anywhere_is_recovered` fails: the file is
  under neither name at epoch 3, writes 0b1;
- without the shrink's flush, `a_shrink_stopped_anywhere_is_recovered` fails: recovery is
  refused at epoch 3, writes 0b10.

Each exits 101, and each was restored afterwards.

`guest-42023343796-summary.log` is the guest run at `33291dbf0`, with two reds:
- `nvme_disk_boots` missed LOG's `serving` line, because the row read only the boot log
  before READY and recovery finished about 20 ms after it. `258e9197d` makes the row wait
  for each role.
- `libc_children` reds in `tty_interrupt` ("stalled at the nested line held"), while
  `spawn_system`, which holds this PR's shell claim, passed. The same step stalls in
  run 42018194698 on `kernel-no-tls`, which contains main `15c26bfbc` and does not touch
  `system/shell`. It is a sighting independent of this branch.
