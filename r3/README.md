# #1045, round 3: the stack on main `69727e365` (#1042)

Paths are masked.

| file | command | revision | exit |
|---|---|---|---|
| r5-ci-host.log.gz | `cargo run -- --ci host`: 103 steps green | `fb0f3166b` | 0 |
| r6-fs.log.gz | one q35 boot: `std_fs`, and the corpus cases `206_libc_refusals` and `214_at_calls`, each against its `.expect` | `fb0f3166b` | 0 |
| r6-kor.log.gz | `kernel_objects_refused_alone`, with the pread and pwrite cases | `b3f98b4d0`'s tree | 2: the host was suspended for 2,339 s during the run, so the harness invalidated it. Every case reported PASS |
| r6-kor-2.log.gz | the same, rerun | `b3f98b4d0`'s tree | 0 |
| controls/exhausted-as-io | a page that cannot be kept answers `Io` | the same | 1: "a /tmp file's page", `Err(Io)` |
