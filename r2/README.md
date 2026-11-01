# PR #1137 r2: review r1's fixes, at firmware-window 990eb5633

Rebased onto main d057f2ada. The window syscall is 160, above main's 159, and the guard names it.

- `ci-host.log`: `cargo run -- --ci host` at 82a688be4, exit 0, 108 steps green. 990eb5633 differs from it only by `bar_map_again`'s new check, which the QEMU run below compiles and runs.
- `ci-host-red-clippy.log`: the run before, at b4acc3d15, exit 1. Two unnecessary `as u64` casts in `arch/x86_64/opregion.rs`, now gone.
- `qemu-bar_map_again.log`: `cargo test --test toyos-build -- bar_map_again`, exit 0, PASS. The test now keeps a BAR's handle past its claim's end and requires the map to be refused `Gone`.
- `mutation-no-revoke`: the claim's end no longer revokes. `bar_map_again` fails ("a BAR's handle mapped after its claim ended"), exit 1, and the patch is restored. This is the control for the kernel's revocation, which no host test reaches.
- `mutation-ram-allowed-r2`, `mutation-device-allowed-r2`: `toyos-userbound`'s one-pass window policy with RAM, then a device, no longer refused. `a_window_past_firmwares_own_memory_is_refused` fails, exit 101 each, restored.
- `metal-readback-r2.log`: `igd_opregion_window` restaged at 990eb5633, image sha256 f36b9e24b982fd8c…. Exit 2 is staged, not run.

Paths are masked.
