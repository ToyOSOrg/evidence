# PR #1185 r2: the response to review r1

All of these ran at `33291dbf0` content, the head after r2's two commits, except
`r2-controls.log`, which ran on the working tree before those commits.

| log | command | exit |
|---|---|---|
| `r2-ci-host.log` | `cargo run -- --ci host` | 0, 109 steps |
| `r2-build-x86.log` | `cargo run -- --build-only` | 0 |
| `r2-build-aarch64.log` | `cargo run -- --build-only --arch aarch64` | 0 |
| `r2-fat32-b.log` | `cargo test -p toyos-fat32 --test refused_writes` | 0, 26 passed |
| `r2-fs-fat.log` | `cargo test --lib fat::` in `system/fileserver` | 0, 11 passed |
| `r2-clippy.log` | `cargo clippy -p toyos-fat32 --all-targets -- -D warnings` | 0 |

`r2-controls.log` holds nine mutations of `lib/fat32/src/recover.rs`. Each was applied, run
against `refused_writes`, and restored:
- three of them remove a refusal: the broken directory, the cross-link, and the copy that
  does not read whole;
- six of them skip a repair.

Every one exits 101 and names the test it fails. The suite restored is the
`r2-fat32-b.log` run.

`r2-fs-control.log`: serving a refused volume writable fails
`a_volume_recovery_refuses_is_served_read_only_and_untouched`, exit 101.
