# ToyOSOrg/ToyOS#1227, round 8: the rebase review's text, and std's word for too big

Head c40194e84 is b2946a672 plus one commit:
- the full-table record owes metal only `testcases-watchdog`, and the TCP-half record owes `stream_state_is_one`'s run at main to the guest row `testcases_members_exit_0` (#1271);
- std answers `Failure::TooBig` `ArgumentListTooLong`, as libc answers `E2BIG`;
- three doc and record wordings (S2, S3, S4).

- `host/c40194e84/`: `cargo test -p toyos`, both toyos clippy shapes, `cargo test -p toyos-libc-copies` and its clippy, and `cargo test -p netstack` at this head: all exit 0.
- `build/build-testcases-c40194e84.log`: `cargo run -- --build-only --boot-config tests/images/testcases.toml`, exit 0. It compiled std with the new arm for both architectures.
- The guest run 43156966054 at b2946a672 holds for everything but std's `TooBig` arm, which the build compiles. Nothing else in this commit is code: the other two code hunks are doc comments.
