# pr-1137 r5: rebased onto main 8ca3a2e07

Head `7e5ee812c1a539e70cca9adce6595bd83c32b5ac`, three commits on main `8ca3a2e07`:
- the change;
- review r2's fixes;
- `#1137 r3`. #1062 took syscall 160, so the window is 161, with profile bins 163. The display track's PSR restart line links the durable brief.

The checks ran at this head, on the macOS host (aarch64), with an x86_64 guest:

| Check | Command | Exit | Log |
|---|---|---|---|
| host CI | `cargo run -- --ci host` | 0 (108 steps) | `ci-host.log` |
| QEMU | `cargo test --test toyos-build -- bar_map_again` | 0, PASS, all five lines | `qemu-bar_map_again.log` |

**Reused, and why it holds:** the T14 boot of `2831e6e52` (r4) and the move-revoke control (r3).
- The rebase brought no change to any file the window or revocation path reads, other than the syscall's number and the profile's size.
- Main's changes to `pcidev/mod.rs` and `object/device.rs` are a crate rename (`toyos_dma::Register` to `toyos_register::Register`) and the console object's release.
- tgl-display, its driver, metalcase and the kernel's window code are byte-identical to `2831e6e52` apart from the number.
