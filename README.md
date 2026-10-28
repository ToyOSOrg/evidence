# PR #1099: a volume's cache keeps an eighth of physical memory clean

- repro/repro-on-main.diff applied to origin/main 370d7d9f6 (no fix): a host test written as `fs.disk.seq_read.4096` reads (a 64 MiB file written in 4 KiB calls and synced, then opened, read whole and closed in rounds) on the old fixed 16,384-block clean limit. repro/repro-on-main.log: exit 101, every round after the first read 16,385 blocks off the disk ([16385, 16385, 16385]). This is the cause, shown before any change, and the control for the committed test: the committed test `a_file_the_cache_holds_is_read_again_from_the_cache` is the same rounds on a cache made to hold twice the file, and reads none.
- host/ci-host.log: `cargo run -- --ci host` at 9d00924ae, exit 0 (last line). Every `error: test failed` lies inside a `=== [ci] control` section, the CI's own negative controls. The branch head f436c156a differs from 9d00924ae only by deleting one issue file that duplicated #1097's record, and in the commit message.

Paths under the agent's home and scratch are masked.
