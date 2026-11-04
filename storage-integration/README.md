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

## Round 2: the spawn cwd, DATA's exact check, swap, #934 and the geometry fix

| file | command | revision | target | exit |
|---|---|---|---|---|
| `neg-cwd.log`, `neg-cwd.patch` | `cargo test --lib cwd` in `kernel/`, with `spawnable`'s absolute check dropped and restored in one command | `38608485c` content | host | 101: the refusal test fails; restored |
| `neg-span.log`, `neg-span.patch` | `cargo test --lib a_volume_copied` in `system/fileserver`, with the probe's span refusal disabled and restored | `ebead3512` content | host | 101: the copied volume mounts; restored |
| `build-swap.log` | `cargo run -- --build-only` | `7987307ff` content, before its commit | x86-64 image | 0 |
| `ci-host-7987307ff.log`, `ci-image-7987307ff.log` | `--ci host`, `--ci image` | `7987307ff` | host; x86-64 and AArch64 | 0, 0 |
| `ci-host-e7f2a85b0.log` | `--ci host` | `e7f2a85b0` (#934 merged in) | host | 109 steps green; its exit line was lost when the shell that chained it ended, so this run's verdict is the step summary, and `ci-host-f14f79e50.log` is the exit-coded run on the same base |
| `ci-image-e7f2a85b0.log` | `--ci image` | `e7f2a85b0` | x86-64 and AArch64 | 0 |
| `guest-libc-children-e7f2a85b0.log` | `cargo test --test toyos-build -- libc_children` | `e7f2a85b0` | QEMU x86-64, `libccase.toml` | 0 |
| `bcachefs-lib-f14f79e50.log`, `bcachefs-clippy-f14f79e50.log` | `cargo test -p bcachefs --lib`; `cargo clippy -p bcachefs --lib --no-default-features -- -D warnings` | `f14f79e50` (geometry fix aaa71f0bb, 825b9ba7a) | host | 0, 176 passed; 0 |
| `ci-host-f14f79e50.log` | `--ci host` | `f14f79e50` | host | 0, 109 steps green |

## Round 3: R1 fix, the 16 KiB node floor, a mount judging the superblock it uses

| file | command | revision | target | exit |
|---|---|---|---|---|
| `bcachefs-lib-d5158bd3d.log` | `cargo test -p bcachefs --lib` | `d5158bd3d` (f38dd6ff8, 95c79b51d, 8abd51c20) | host | 0, 179 passed |
| `neg-turncoat.log`, `neg-turncoat.patch` | `cargo test --lib a_superblock_answered` in `lib/bcachefs`, with `Mount::from`'s judgment of the used superblock removed and restored | `c12721aa1` content | host | 101: the unlock mounts on 8 KiB nodes; restored |
| `bcachefs-lib-c12721aa1.log`, `bcachefs-clippy-c12721aa1.log` | `cargo test -p bcachefs --lib`; no-default-features clippy | `c12721aa1` | host | 0, 180 passed; 0 |
| `ci-host-c12721aa1.log` | `cargo run -- --ci host` | `c12721aa1` | host | 0, 109 steps green |
