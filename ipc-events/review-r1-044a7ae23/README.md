# #1108 review round 1, head 044a7ae23

| log | what | tree | exit |
|---|---|---|---|
| ci-host-6.log | `cargo run -- --ci host` | 044a7ae23 | 0, 105/105 |
| ci-host-5.log | same, before the test was listed in RUST_SKIP | 20e0c546c + fixes | red on `suite_split` only (fixed) |
| qemu-4.log | new test + stream_holders, netstack_holders_exported_to_children, kernel_objects_refused_alone | 20e0c546c + fixes | 1: the three passed; the new test's child connected before netstack's lease (test fixed to wait for it) |
| qemu-5.log | a_client_killed_mid_connect_gives_its_place_back, one child | + lease wait | 0 |
| qemu-6.log | same, two children (killed and survivor) | as committed but a header comment | 0 |
| control-c4.log | controls/c4: the rung watched while a connect is unanswered; netstack rebuilt (mtime in log); restored | as qemu-6 | 1: the killed child's place did not come back before the connects ended on their own |

A first one-child control passed: the connect ends by itself within seconds,
so the place came back either way. The test then took a surviving second
child, which tells the kill from the connect's end; the control above is
against that version.
