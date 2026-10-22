# PR 1012, socket sharing S2, head bf87cd135

The checks ran at `dd8676a58`; `bf87cd135` is it with two message-only amends (same tree, `ceb0f8780`).

- `ci-host.log`: `cargo run -- --ci host`, exit 0, 95 steps green, every transport control reaching its verdict, the loom suite 28/28.
- `build-only.log`: `cargo run -- --build-only`, exit 0.
- `guest.log`: `cargo test --test toyos-build -- stream_holders stream_exported_to_a_child libc_children`, exit 0, three passed (QEMU, x86-64).
- `host-quick.log`: `cargo test -p toyos --lib`, `-p toyos-libc-copies`, `-p toyos-net-node`, `-p netstack`, clippy `-p toyos` both shapes, exit 0.
- Negative controls, each a patch applied locally, the run, then the tree restored:
  - `stream-holders-control.*`: `Server::departed` rings nobody. `stream_holders` red: "the send bell was never rung after the departure". Run at S2's tree before its squash; later edits touch no code on its path (wording, issue text, netstack's export answer `if`s, libc's errno mapping, the descriptor tag).
  - `stream-export-control.*`: `adopt_exported` drops the `ADOPT` frame. `stream_exported_to_a_child` red: the child's write fails, it ends 101. Run before the squash, as above.
  - `libc-copy-control.*`: libc's `connect` installs a plain handle object. `libc_children` red: "the stream's end outlived its descriptor's close and its last call". Run at the final tree but for the patch.
- `libc-children-ebadf.log`: the defect in `libc_recv_beside_close`'s old fill, with its errno report: `recv answered -1, errno 9`.
