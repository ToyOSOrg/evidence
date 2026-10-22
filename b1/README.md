# PR 1025: toyos-blockdev, with fat32, Served and every consumer async over it

Base 18a38738b. The PR's commit is fe3ecb5 (squashed). The intermediate revisions named below have the same code as fe3ecb5 except where stated.

## Host

- `host/ci-host-c8ef90a.log`: `cargo run -- --ci host`, exit 1. 92 of 93 steps green; the red step is `build::tests::every_model_control_is_run`, which counted the new `model` feature as a control.
- `host/build-lib-11cc513.log`: `cargo test -p toyos-build --lib` after the `NOT_A_CONTROL` entry, exit 0, 367 passed.
- `host/ci-host-fe3ecb5.log`: `cargo run -- --ci host` on the final commit, exit 0, all 93 steps green.

## Build

- `build/build-only-first-attempt.log`: `cargo run -- --build-only`, exit 101. A temporary stdin lock in `system/update/src/main.rs` outlived its statement.
- `build/build-only-8a8e15c.log`: `cargo run -- --build-only` after the fix, exit 0. The 8a8e15c tree equals fe3ecb5's.

## Guest

- `guest/qemu-x86_64-8a8e15c.log`: `cargo test --test toyos-build -- the_log_lands_on_the_boot_stick nvme_disk_boots`, exit 0, 2 of 2 pass.
- `guest/metal-request.txt`: the T14 request for `usbd_serves_the_boot_stick`, prepared with `--metal-readback`. No machine was touched.

## Negative controls

Each control was applied as the patch beside it, its run's log is here, and the file was then restored byte for byte.

| patch | target | result |
|---|---|---|
| `mut-version.patch` | fileserver cache: a slot's version ignored at flush | `cargo test -p fileserver --lib cache::`, exit 101; only `a_block_written_while_a_flush_carries_its_older_copy_stays_dirty` red |
| `mut-overtaken.patch` | fileserver cache: an overtaken fetch kept | exit 101; only `a_fetch_a_write_overtook_is_not_kept` red |
| `mut-refcell.patch` | fileserver cache: a `RefCell` borrow held across `disk.flush().await` | `cargo clippy -p fileserver --lib -- -D warnings -A clippy::manual_is_multiple_of`, exit 101, `await_holding_refcell_ref`. The other errors in this log are on `main` already: programs are outside the gate's clippy |
| `mut-no-reask.patch` | diskserver `Served`: a refused request not asked again | `cargo test -p diskserver --lib`, exit 101; 3 re-ask/gone tests red |
| `mut-reconnect-not-final.patch` | diskserver `Served`: a failed reconnect not final | exit 101; only `a_refused_reconnect_makes_the_disk_gone_for_every_request` red |

Masked throughout: home directory paths and scratch paths.
