# r3: #1077 rebased onto main 190f3b164, head 342ecc142

Host: x86-64 guests under QEMU on an AArch64 macOS host (TCG). Paths masked.

| Log | Command | Revision | Exit |
|---|---|---|---|
| logs/host4.log | `cargo run -- --ci host` | 342ecc142 | 0, 110 steps green |
| logs/build.log | `cargo run -- --build-only` | 342ecc142 | 0 |
| logs/qemu3.log | `cargo test --test toyos-build -- netstack_holders_exported_to_children shm_commit_alone` | 342ecc142 | 0, 2 of 2 |
| logs/qemu2.log | `cargo test --test toyos-build -- shm_commit_alone netstack_holders_exported_to_children stream_holders` | d6e62d053 | 0, 3 of 3 |
| logs/qemu1.log | `cargo test --test toyos-build -- shm_commit_alone netstack_holders_exported_to_children stream_holders session_lifecycle libc_children kernel_objects_refused_alone memory_floor_holds_the_controls udp_receive_times_out` | 929e73d6c | 101: 5 passed (udp_receive_times_out, kernel_objects_refused_alone, memory_floor_holds_the_controls, session_lifecycle, libc_children); shm_commit's guest binary did not compile against main, stream_grows bound a loopback ToyOS lacks, and stream_holders's build waited on the sysroot lock until the run was stopped. All three fixed and passed in qemu2. Only test files changed between 929e73d6c and 342ecc142. |

Negative controls (patch applied, built, run, reverted in the same command):

| Patch | Test | Result |
|---|---|---|
| mutation-node-grow-uncommitted.patch (netstack grows the receive ring without committing) | `cargo test -p toyos-net-node --test streams a_download` | red: `a put of 1444 bytes at 69472 past what was committed` (logs/mutation-node-grow.log) |
| mutation-client-grow-uncommitted.patch (the client grows its send ring without committing) | `cargo test -p toyos-net-node --test streams an_upload` | red: `a write of Span { offset: 4263936, len: 65536 } past what was committed` (logs/mutation-client-grow.log) |
| mutation-client-commit.patch + mutation-netstack-commit.patch (neither end commits past the first ring) | `netstack_holders_exported_to_children` | red: stream_grows ended -1 mid-transfer, the harness reset after 43800 bytes (logs/mutation-both.log) |
| mutation-client-commit.patch alone | `netstack_holders_exported_to_children` | green (logs/mutation-client.log): netstack's commit covers the client's on the guest, so the host tests above carry each end's commit |
| mutation-netstack-commit.patch alone | `netstack_holders_exported_to_children` | green (logs/mutation-netstack.log): the client's commit covers netstack's, and QEMU's user network never made [tcp] want a larger receive buffer |
