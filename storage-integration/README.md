# #1152 integration: reclaim, process-depth test, records

Paths, user and machine identifiers are masked (`<worktree>`, `<home>`,
`<tmp>`, `<machine>`). Each log ends with the command's exit code.

| file | command | revision | target | exit |
|---|---|---|---|---|
| `bcachefs-lib-4e829b244.log` | `cargo test -p bcachefs --lib` | `4e829b244` | host | 0, 169 passed |
| `bcachefs-clippy-4e829b244.log` | `cargo clippy -p bcachefs --lib --no-default-features -- -D warnings` | `4e829b244` | host | 0 |
| `guest-libc-children.log` | `cargo test --test toyos-build -- libc_children` | `25f19a076` plus `spawn_served_stdout.c` and `libccase.toml` as committed in `48316fc0e` | QEMU x86-64, `tests/images/libccase.toml` | 0 |
| `neg-served-stdout.log`, `neg-served-stdout.patch` | the same, with the patch applied and reverted in one command | as above | as above | 1: only `spawn_served_stdout`, at `system`, errno 95 |
| `t14-process-tree-0507cbe36/` | the T14's `proctreecase` boot at `0507cbe36`, run before this integration: the judge and the boot's process-tree lines | `0507cbe36` | T14 | judge 1: `process_tree`'s chain stopped at link 32, refused by the file server's share bound, before the kernel's depth-65 refusal |
| `ci-host-f32a98839.log` | `cargo run -- --ci host` | `f32a98839` | host (macOS, aarch64) | 0, 109 steps green; the loom failures in it are the models step's negative controls |
| `ci-image-f32a98839.log` | `cargo run -- --ci image` | `f32a98839` | x86-64 and AArch64 images | 0, 3 steps green |
| `guest-bins-build.log` | `cargo build --profile toyos --target x86_64-unknown-toyos --bin process_tree --bin lseek_past_eof --bin fs_truncate_persist --bin spawn_from_tmp --bin abuse_elf_loader` in `tests/guest/rust-tests`, with the harness's toolchain and C environment | `f32a98839` | x86_64-unknown-toyos | 0, no warnings: a compile check of the changed metal-only guest binaries, which no run above boots |
| `ci-host-db6cab94a.log` | `cargo run -- --ci host` | `db6cab94a` (main e3a421563 merged in) | host (macOS, aarch64) | 0, 109 steps green |
| `ci-image-db6cab94a.log` | `cargo run -- --ci image` | `db6cab94a` | x86-64 and AArch64 images | 0, 3 steps green |

The QEMU `libc_children` run and its control predate the merge of main at
`db6cab94a`; main's changes there (toyos-crypto, the timing-control syscall,
ssh, `virtsmpcase`) reach none of the served-file spawn, file server or libc
paths they exercise.
