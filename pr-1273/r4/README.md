# pr-1273, round 4: rebased onto main 75bdec3cd (#1259)

At `12aa41f8c`. The rebase conflicted only in `tests/toyos.rs`, where #1259's
`virt_vm_map_shares` row and this branch's `virt_tmp_holds_empty_files_by_what_each_costs`
were added at the same place; both are kept.

How it composes with #1259:

- #1259 changes no paged-object code: of the object files it touches only `kernel/src/object/shm.rs`, which names no pager, and `dispatch.rs`'s `SYS_VM_MAP`.
- `SYS_PAGER_CREATE` merges as `sys_pager_create(a1, a2, a3)`.
- No `mapprobe` is on main; it is #1269's.
- Every `Pager::create` caller on the rebased tree passes three arguments.

`summary.txt` lists each command with its exit; every one is 0:

- `cargo test -p kernel --lib`: 486 passed.
- The file server's tests.
- The build's config gates (`cargo test --lib -- build::tests`).
- `cargo test --test toyos-checks`.
- The harness's `--list`, which names `tmp_empty_files`, both `/tmp` rows, and #1259's `virt_vm_map_shares`.
- `cargo run -- --clippy`: 26 invocations clean.
- `cargo run -- --build-only`.
