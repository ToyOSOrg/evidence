# PR #1134 r1: stage 3's checks, at display-stage3 4fb5d22f0

- `ci-host.log`: `cargo run -- --ci host`, exit 0, 107 steps green. It includes `toyos-display-output`'s 6 tests and `toyos-tgl-display`'s 34.
- Negative controls. Each `mutation-<name>.patch` is applied, its package's tests run, and the patch is reverted in the same run. Each compiles, and its run exits 101:
  - `mutation-one-outstanding`: `Presenting` sends while a present is outstanding. `one_present_is_outstanding_and_the_damage_meanwhile_is_the_next` fails.
  - `mutation-arm-uncleared`: `interrupt::arm` no longer clears pipe A's identity first. `an_armed_vblank_is_the_next_one_and_raises_once` fails.

  Both ran on the tree that became 4fb5d22f0, before the commit. Its last edit, to tgl-display's `main.rs`, touches neither package.
- `build-only.log`: `cargo run -- --build-only`, exit 0.
- `qemu-the_compositor_drives_the_virtio_gpu.log`: `cargo test --test toyos-build -- the_compositor_drives_the_virtio_gpu`, exit 0, PASS. It ran on the working tree before the commit, with the compositor's code and image rows as committed. The later edits changed tgl-display's `main.rs`, `metalcase.toml`, a metal row and docs, none of which this test reaches.
- `metal-readback.log`: the `display_output_presents` image staged, exit 2, which is the harness's staged-not-run status. The machine was not touched.

Paths are masked.
