# #1181 round 1 (ToyOS 2d86471a9)

- `ci-host.log`: `cargo run -- --ci host` at 2d86471a9, exit 0, 108 steps green.
- `controls/`: three negative controls at 2d86471a9. Each patch was checked, applied, run with `cargo test --lib` and reverted in one run.
  - `global-tree.patch`: the resolver ignores the grant's root. 6 escape tests red, exit 101.
  - `prefix-start.patch`: a start is checked by string prefix. 1 red, exit 101.
  - `unheld-is-directory.patch`: routing answers an unheld path as a directory. 2 red, exit 101.
- `guest-41977385238.log`: a guest-rows dispatch whose filter named shared-boot members, which are not QEMU rows. Nothing booted ("No test matches filter").
- `guest-41981594527.log`: guest-rows at 2d86471a9, `a_launch_gives_each_unsent_stdio_slot_a_null` and `the_data_partition_beside_the_stick_is_designated`, both PASS.
- `metal-prep.log`, `metal-request.txt`: metal staged with `--metal-readback`, exit 2 (Staged). Not run.

Paths, the host name and the CPU model are masked.
