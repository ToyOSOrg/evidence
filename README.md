# PR #1098: a sync with nothing uncommitted writes no superblock

Revision checked: the tree in host/ci-host.diff applied to origin/main 370d7d9f6, committed unchanged as 55970f7d4.

- host/ci-host.log: `cargo run -- --ci host`, exit 0 (last line). Every `error: test failed` in it lies inside a `=== [ci] control` section, the CI's own negative controls.
- host/ci-host.try1.log: the first run, exit 1 on a clippy lint in the new test helper (`Default::default()` in a struct literal), fixed before the second.
- host/bcachefs-test.log, host/fileserver-test.log: `cargo test --features std` in lib/bcachefs and `cargo test` in system/fileserver, both exit 0.
- red/red.patch: the skip disabled (`false &&`). red/red-bcachefs.log: `a_sync_with_nothing_uncommitted_writes_nothing` fails, (9, 4) against (7, 3); red/red-fileserver.log: `a_sync_with_nothing_new_asks_the_disk_for_nothing` fails, (14, 5) against (12, 4). Both exit 101. Restored in the same run.
- red/red2.patch: the superblock recorded as landed before it is written. red/red2-bcachefs.log: `a_sync_after_a_refused_one_commits_again` fails, exit 101. Restored in the same run.

Paths under the agent's home and scratch are masked.
