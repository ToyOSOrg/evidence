# PR 1025, review round 1 fixes: head f863887 (rebased onto 777c8c524)

- `ci-host-f863887.log`: `cargo run -- --ci host`, exit 0, 101 of 101 steps green.
- `build-only-f863887.log`: `cargo run -- --build-only`, exit 0.
- `qemu-x86_64-f863887.log`: `cargo test --test toyos-build -- the_log_lands_on_the_boot_stick nvme_disk_boots`, exit 0, 2 of 2 pass.
- `clippy-fileserver.log`, `clippy-diskserver.log`: `cargo clippy -p <program> --all-targets -- -W warnings`. These are the findings that `issues/the-storage-programs-are-never-linted.md` cites (14 and 1); every finding is on a line older than this PR.

## Controls

Each control was applied as the patch beside it, with its log, and the file was then restored byte for byte.

| patch | change | result |
|---|---|---|
| `mut-flush-concurrent` | cache: a flush does not wait for one already running | `cargo test -p fileserver --lib cache::`, exit 101; only `a_flush_asked_during_another_waits_and_then_writes_the_newer_copy` red |
| `mut-no-fetch-wait` | cache: a flush writes a block under its fetch | exit 101; only `a_flush_waits_for_a_fetch_of_its_block_and_the_write_is_kept` red |
| `mut-version` | cache: a block's version ignored at flush | exit 101; `a_block_written_while_a_flush_carries_its_older_copy_stays_dirty` and the two-flush test red |
| `mut-read-held` | update `Cached`: round 0's read (the whole range from the partition) | `cargo test -p update-copies`, exit 101; only `a_held_block_is_never_read_from_the_partition` red, "5644 of 5654 partition reads were of held blocks". The fixed path makes 10 reads |
| `mut-held-flush-no-partition-flush` | update `Cached::flush` does not flush the partition | exit 101; only `the_mark_moves_only_once_the_slot_is_durable` red |
