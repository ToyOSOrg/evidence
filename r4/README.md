# r4: #1077 review r2, head 10c835a42

| Log | Command | Exit |
|---|---|---|
| logs/host.log | `cargo run -- --ci host` | 0, 110 steps green |
| logs/qemu.log | `cargo test --test toyos-build -- stream_holders netstack_holders_exported_to_children` | 0, 2 of 2 |

Negative controls (patch applied to the working tree, run, restored):

| Patch | Test | Result |
|---|---|---|
| mutation-netstack-send-commit.patch (B1: netstack's commit of a client-grown send ring removed) | `cargo test -p toyos-net-node --test streams a_send_ring` | both red: `a take of 1460 bytes at 4262640 past what was committed` |
| mutation-joined-writer-no-commit.patch (S1: a joined writer copies by a resumed size uncommitted) | `cargo test -p toyos --lib a_joined_writer` | red: `(Ok(1), 1)` where `Violation::Size` and nothing copied was owed |
| mutation-reader-no-commit.patch (S2: the client reads by a size it did not commit) | `cargo test -p toyos-net-node --test streams a_receive_ring` | red: `a read of Span { offset: 4096, len: 100000 } past what was committed` |
