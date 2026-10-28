# PR #1074, round 1: pipes in 4 KiB frames

Head `1f828f331`. The paths are masked as `<scratch>`, `<dev>` and `<home>`.

| File | What it is | Command | Exit | Revision |
|---|---|---|---|---|
| `logs/ci-host-2.log` | the host suite, 104 steps | `cargo run -- --ci host` | 0 | `1f828f331` |
| `logs/guest-2.log` | 7 QEMU machine tests | `cargo test --test toyos-build -- kernel_objects_refused_alone memory_floor_holds_the_controls stream_holders netstack_holders_exported_to_children session_lifecycle libc_children udp_receive_times_out` | 0 | `d12c5dec9`'s tree before the lint/sourcegate amend |
| `logs/build-2-*.log` | image builds | `cargo run -- --build-only --arch {x86_64,aarch64}` | 0 | same tree as the guest run |
| `logs/mutation-*.log` | negative controls on the spare rule | `cargo test --lib pipe::` in `kernel/`, with `mutation-*.patch` applied, then reverted | tests red | — |
| `logs/churn-probe.txt` | host timing of a 16-frame take and give | throwaway probe, not committed | — | — |

The T14 readings follow in a later round.
