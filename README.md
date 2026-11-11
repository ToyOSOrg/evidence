# PR 1221: a full DATA volume takes a write after an unlink with no commit

A scratch host test, not committed to ToyOS, behind the record
`issues/no-test-holds-that-a-full-data-volume-takes-a-write-after-an-unlink-with-no-commit.md`.

- Revision: ToyOS `422915e2c597ce264f474186b7d08d42d59fa29a` with
  `full-volume-unlink-then-write.patch` applied.
- Target: the development host (aarch64 macOS), the `bcachefs` crate's unit tests.
- Command: `cargo test -p bcachefs --lib scratch_full_volume -- --nocapture`
- Exit code: 0.
- `full-volume-unlink-then-write.log`: the test's own lines and cargo's verdict.
  The compile lines, which name host paths, are left out.

The test fills a 64 MiB volume with one file until a write is refused
`NoSpace`, commits, shows that a 1 MiB write to a second file is refused,
unlinks and releases the first file, and writes the megabyte again with no
commit between: it is accepted.
