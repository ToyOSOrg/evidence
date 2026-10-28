# PR #1077, round 1: the stream region sized to use

Paths are masked as `<scratch>`, `<dev>` and `<home>`.

| File | What it is | Command | Exit | Revision |
|---|---|---|---|---|
| `logs/region-ci-3.log` | the host suite, 106 steps | `cargo run -- --ci host` | 0 | `dc0ecda05` |
| `logs/region-guest-1.log` | 7 QEMU machine tests | `cargo test --test toyos-build -- kernel_objects_refused_alone memory_floor_holds_the_controls stream_holders netstack_holders_exported_to_children session_lifecycle libc_children udp_receive_times_out` | 1 | `0b9f96a9c` plus the issue rename |

`region-guest-1.log` has 3 passes. Two guest binaries did not compile there (`stream_handles`, `libc_recv_beside_close`), and the four tests that use the guest crate failed with them.

| File | What it is | Command | Exit | Revision |
|---|---|---|---|---|
| `logs/region-guest-2.log` | the four tests rerun after the compile fix | `cargo test --test toyos-build -- stream_holders libc_children session_lifecycle netstack_holders_exported_to_children` | 0, 4/4 | `0583bd46c` |
| `logs/region-build-4.log` | the image build | `cargo run -- --build-only` | 0 | `0b9f96a9c` |

The T14 readings follow in a later round.
