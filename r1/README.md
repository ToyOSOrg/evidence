# PR #1125 r1: the T14's display engine as the GOP left it, and stage 1's checks

- `scout/`: the read-only display scout (branch `display-scout` 22e638ae7, row `display_scout`, T14, rc=0, verdict passed).
  - `display-lines.txt`: its kernel lines.
  - `judgement.md`: what they mean, with the Vol 2c field layouts.
  - `protocol.md`: what the scout reads and writes.
- `mutation-blocks.log`, `mutation-sagv.log`: the two negative controls on `toyos-tgl-display`. Each was a checked mutation; both exit 101.
- `qemu-claims.log`: `the_compositor_drives_the_virtio_gpu` and `amdvi_selftest` at 8211d776b, exit 0.
- `ci-host-tail.txt`: `cargo run -- --ci host` at cedde3c90, exit 0.

Paths under the home directory are masked.
