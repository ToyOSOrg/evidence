# ToyOSOrg/ToyOS#1227, round 2: review r1's fixes

Head 279552072 is ea69cd0a2 rebased onto main e558cc153. The only conflict was the region of `sdk/toyos/src/spawn.rs` where #1238's `path_label` and this round's `starting_block` both sit; both are kept.

- `spawn::Refused::Invalid` is split: an image that does not lay out is `NotExecutable` (`ENOEXEC`), a spawn or launch past what it carries is `TooBig` (`E2BIG`), and the rest stay `Invalid` (`EINVAL`). `Failure::ALL` and the four tests that restated exhaustive matches are gone. `starting_block` is the one composition that `Helper::spawn` and the `MAX_ARGS` test share. The comments say the count is ToyOS's.
- `host/ea69cd0a2/`: `cargo test -p toyos`, both toyos clippy shapes, `cargo test -p toyos-libc-copies` and its clippy: all exit 0.
- `host/279552072/`: the same five checks and `cargo test -p netstack` after the rebase: all exit 0. Clippy runs with the adopted lints and `-D warnings`.
- `controls/max-args-{under,over}.{patch,log}`: the reworked test (it calls `starting_block` and expects `TooBig`) against `MAX_ARGS` one byte under and one over. Each patch built and failed the test (exit 101), at "one byte past MAX_ARGS" and at "a caller's MAX_ARGS bytes" respectively. The tree was restored after each.
- `metal/stage-279552072.log`: `cargo test --test toyos-build -- --metal --metal-readback <dir> boot:testcases`, exit 2 (Staged); `metal/request-279552072.txt` lists `testcases` and `testcases-watchdog`. The image's corpus expects `sysconf _SC_ARG_MAX: 2088939`, and `212_full_table.expect` is unchanged ("kernel handles ran out first with ENOMEM: yes").
