# PR 1012, rebased on #1004's 72a5452e5, head 49570cdb6

- `ci-host.log`: `cargo run -- --ci host`, exit 0, 95 steps green; `transport_loom` 28/28 in 103 s, the step running it 2 min.
- The rebase changes only `sdk/toyos/tests/transport_loom.rs` under S2 (#1004's loom bounds and model server). S2 adds no loom model. The guest tests and controls of head-3dcbd18ef and head-bf87cd135 stand: no code they run changed.
