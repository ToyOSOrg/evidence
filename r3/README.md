# ToyOSOrg/ToyOS#973, round 3 (rebase onto #974; SYS_MESSAGE_SEND = 133)

Head `f8d512350eccebd550b8dcd7c60f7fe469f1e554` on `d5713917d` (#974). Masking as in r1.

| file | command | revision | exit |
|---|---|---|---|
| ci-host.log | `cargo run -- --ci host` | f8d512350 | 0 (88 steps) |
| build-only-x86_64.log, build-only-aarch64.log | `cargo run -- --build-only [--arch aarch64]` | f8d512350 | 0, 0 |
| guest-qemu.log | `cargo test --test toyos-build -- console_image_boots` | f8d512350 | 0 (1/1) |

`../r2/metal-run/` holds the T14 readbacks of round 2's images (`b705b266c`): fix 11/11 over 3 boots; the kernel control failed only `message_carries_its_handles`, "the reader went past a batch no frame announced". They carry over: round 3 changes only the syscall number and brings in #974's unrelated DMA code.
