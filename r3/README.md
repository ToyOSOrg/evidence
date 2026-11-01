# PR #1125 r3: review r1's checks, at display-stage1 450d6e8c4

- `ci-host-tail.txt`: `cargo run -- --ci host`, exit 0, 107 steps green.
- `mutation-rmrr-alone.log`: the negative control on `kernel::rmrr::verdict`. A checked mutation drops the "named alone" test; `a_display_controller_that_shares_its_region_is_refused` fails, exit 101. The mutation is restored.
- `qemu-claims-r1.log`: `the_compositor_drives_the_virtio_gpu` and `amdvi_selftest`, exit 0, both PASS. Both claim through the changed path under QEMU's `intel-iommu`, which publishes no RMRR.

The T14 B arm at r1 is staged from `display-stage1-ab` d0dc7c34a, image sha256 a8f0d1ec8e2f8b66ae2e92a7af451a984ad054ed0bc5312a4863f583b196df0c. It has not run yet.

Paths are masked.
