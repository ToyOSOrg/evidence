# PR #1185, round 1

Host: the development machine (macOS, aarch64). Paths masked: `<worktree>`,
`<scratch>`, `<home>`, `<tmp>`.

| log | command | revision | exit |
|---|---|---|---|
| `ci-host-r2.log` | `cargo run -- --ci host` | `668160b1e` | 0 (109 steps, all green) |
| `fat32-r3.log` | `cargo test -p toyos-fat32` | `668160b1e` content before commit | 0 |
| `fat32-recover-r3.log` | `cargo test -p toyos-fat32 --test refused_writes a_recovery` | `668160b1e` content before commit | 0 |
| `fs-full-r2.log` | `cargo test` in `system/fileserver` | `668160b1e` content before commit | 0 (117 + 3) |
| `fs-fat-r2.log` | `cargo test --lib fat::` in `system/fileserver` | as above | 0 |
| `nvme-r2.log` | `cargo test` in `system/nvme` | `ea571baad` content | 0 |

The fileserver and fat32 logs ran against working-tree content that was then
committed unchanged as `668160b1e`. The only edits after them were
`recover.rs`'s free count folded into the lost-cluster pass and the clippy
fix, and `fat32-r3.log` is from after both.

Negative controls. Each was applied as a patch, built and run, then
restored, and the restored tree was run again:

- `fat32-control.log`: the old `shrink_chain` (the reverse of
  `9b5461763`'s `fs.rs` hunk) against the stricter
  `a_stop_at_any_write_leaves_only_the_named_windows`. Exit 101, at `truncate:
  stopped at write 2, Refused: /dated.log: DIR_FileSize is 2560 bytes, which
  needs 5 clusters, and the chain holds 2`.
- `fat32-recover-controls.log`: four mutations of `recover.rs` (no lost
  free, no mirror copy, no long-name free, no chain end), each exit 101 in
  `a_recovery_after_a_stop_at_any_write_leaves_a_consistent_volume`, with
  the checker's complaint. Restored: `fat32-recover-r3.log`, exit 0.
- `fs-control.log`: `Cache::write_data` answering Ok without writing,
  exit 101 in `a_file_in_a_deleted_files_blocks_holds_its_own_bytes_on_the_device`
  (the read is refused `Io`, the checksum not matching). Restored:
  `fs-restored.log`, exit 0.
