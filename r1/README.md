# ToyOS PR #1095, round 1

ToyOS head 7ccd44caf94618a5a79e0daefb88b953458b9054 unless a log says otherwise
(its first line, `head <sha>`, where it has one). Paths, hosts and addresses
are masked.

- `host/ci-host-2.log` — `cargo run -- --ci host`, EXIT=0, 105 steps green,
  on the tree of the final commit but for `tests/guest/rust-tests`.
- `host/ci-host-1-red-clippy.log` — the run before it: one redundant clone in
  a new test, EXIT=1.
- `host/build-only-1.log` — `cargo run -- --build-only`, EXIT=0, after the
  loader change.
- `host/metal-crate.log`, `host/checks.log` — `cargo test -p toyos-metal`
  (76 passed) and `cargo test --test toyos-checks` (42 passed), EXIT=0.
- `qemu/qemu-1.log` — `nvme_disk_boots` and
  `a_host_disk_beside_the_stick_is_left_alone`, EXIT=0;
  `qemu/qemu-2-nocapture.log` the first again with its serial.
- `controls/` — `judge-admits-any-esp.patch` applied to the head: the disk
  judge check reds, EXIT=101 (`judge-admits-any-esp.log`); restored it
  passes, EXIT=0 (`judge-restored.log`).
- `metal-staging/` — the `--metal-readback` staging of both benches' requests
  (EXIT=2 is "staged, nothing judged") and the two `request.txt` files. No
  machine was touched.
