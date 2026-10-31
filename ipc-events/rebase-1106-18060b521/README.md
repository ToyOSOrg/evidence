# #1108 rebased onto main f45dc5e3b (#1106 landed), head 18060b521

Conflicts: netstack's module list (`bells` beside #1106's `link`) and
`tests/toyos.rs`'s two registries (both sides' rows kept). netstack's header
named the deleted `pipes` module; it names `bells`. The link's doorbell stays a
byte on its connection, as every connection's plain write does in this PR.

| log | what | tree | exit |
|---|---|---|---|
| r1106-build.log | `cargo run -- --build-only` | 7a4a921bc | 0 |
| r1106-qemu.log | `cargo test --test toyos-build -- a_link_ends_under_a_held_stream_and_comes_back netstack_holders_exported_to_children stream_holders a_client_killed_mid_connect_gives_its_place_back udp_receive_times_out kernel_objects_refused_alone` | 7a4a921bc | 1: 5 of 6 |
| r1106-qemu-2.log | `cargo test --test toyos-build -- netstack_holders_exported_to_children` | 18060b521 | 0 |
| r1106-ci.log | `cargo run -- --ci host` | 18060b521 | 0, 107/107 |

7a4a921bc was 18060b521 plus one commit moving #1106's I219 driver's timed
interrupt wait from a one-shot poller to `SYS_HANDLE_WAIT`. Its red
(`82574: netstack never said its lease landed`) is that commit: the driver
panicked on `NotSupported`, because `SYS_HANDLE_WAIT` refuses a claim by
design. The commit was dropped, and the red arm is green at 18060b521. The
other five tests run on virtio-net, which starts no I219 driver, so their
result at 7a4a921bc holds for 18060b521.
