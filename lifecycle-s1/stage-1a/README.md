# Stage 1a of #910: a process's end follows its own releases

Head `75be4bcc7` (branch `toyos-lifecycle`, on `ed1ec1512`). QEMU 11.1.1,
TCG, arm64 host.

| check | command | revision | exit | log |
|---|---|---|---|---|
| guest arms | `cargo test --test toyos-build -- --nocapture usbd_drives_the_spare acpi_mediated_access` | 75be4bcc7 | 0 | `head-guest.log` (`end_returns_claims: 100 rounds, every claim granted…` at line 1644) |
| negative control: the kernel change reverted onto the base, the new job kept | `git apply -R control-kernel-revert.patch`, then the `usbd_drives_the_spare` run | b4784eacb minus its `kernel/` diff, i.e. ed1ec1512's kernel | 1 | `control-kernel-reverted.log`: round 1 refused `AlreadyExists` |
| mutation: no object enters the scope | `mutation-scope-bypassed.patch`, `usbd_drives_the_spare` | b4784eacb + patch | 1 | `mutation-scope-bypassed.log`: round 0 refused `AlreadyExists` |
| mutation: publish before the releases run | `mutation-publish-first.patch`, `cargo run -- --build-only` | b4784eacb + patch | 101 | `mutation-publish-first-build.log`: `Released` is private, so an `Exit` cannot be built without the run |
| host | `cargo run -- --ci host` | b4784eacb | 1 | `host-ci.log`: 76 of 77 steps green; red only on kernel clippy, `core::mem::forget` in `Releases::run` |
| clippy after the fix | `cargo run -- --clippy` | 75be4bcc7 | 0 | `clippy.log`: 20 invocations clean, 13 of them the kernel's |

b4784eacb → 75be4bcc7 changes only `Releases::run` and `Releases`'s `Drop` in
`kernel/src/object/mod.rs` (the `forget`, which also leaked the
`TaskHandle`'s `Arc`, replaced by a drop that asserts the scope closed). The
76 host steps that were green build no kernel binary with that code path
differently, and the guest arms and clippy were rerun on 75be4bcc7.

The control and the bypass mutation ran at b4784eacb; the amend does not
touch what they judge (whether a claim is free when its holder's end is
read).

`t14-request.txt`: the `usbd_drives_the_type_c_controller`,
`isa_ports_are_the_binders_alone` and `isa_lines_reach_their_holder` rows,
staged from 75be4bcc7 (exit 2, staged, no machine touched).
