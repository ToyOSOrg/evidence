# PR 1058, round 1: QEMU A/B of a /system program's spawn

Base 05873236d (origin/main) and head 53f73a63c, each with the scratch probe
applied (`probe.rs`, `probe-main.patch`: `osbench probe`, not committed) and booted with
`probecase.toml` (copied into tests/images for the build) on QEMU x86-64 TCG via `run-x86.sh`.
Image built with `cargo run -- --build-only --boot-config tests/images/probecase.toml`, exit 0 at both.
Each boot exited 0 and both jobs ended `exit=0` (see the serial logs).

| p50 | base | head |
|---|---|---|
| probe fs_read_exe (std::fs::read of osbench) | 34.2 ms | 35.3 ms |
| probe prepare_exe (Command::prepare) | 30.9 ms | 6.9 ms |
| probe spawn_prepared_exe | 1.4 ms | 1.9 ms |
| probe wait_prepared_exe | 16.5 ms | 22.5 ms |
| probe status_exe (Command::status) | 76.5 ms | 33.7 ms |
| proc.posix_spawn_wait.std | 70.0 ms | 20.1 ms |

TCG under host load: order of magnitude only. A plain file read is unchanged, as
expected: only a spawn's image takes SYSTEM's object.

Other checks at head 53f73a63c:
- `cargo run -- --ci host`: exit 0 ("Host: 103 step(s), all green"; tail in ci-host-tail-53f73a63c.log).
- `cargo test --test toyos-build -- libc_children`: exit 0 (libc_children-53f73a63c.log).
