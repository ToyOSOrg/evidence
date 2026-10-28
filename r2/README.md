# Review round 1 at 59dd113ec (rebased onto main a5b330f39)

- ci-host.log: `cargo run -- --ci host` of the tree in ci-host.diff (the branch against origin/main), exit 0, 105 steps green; every `error: test failed` lies in a `control` section.
- red.patch: `Superblock::same_commit` made always false. red-bcachefs.log: `a_sync_with_nothing_uncommitted_writes_nothing` fails, exit 101; red-fileserver.log: `a_sync_with_nothing_new_asks_the_disk_for_nothing` fails, exit 101. Restored in the same run.
- T14: `persist.fsync_clean` 15,898 and 16,124 ns in two boots of 34409c9c2 (both `passed`), against 464,505-3,418,250 ns in four boots of #1097.
