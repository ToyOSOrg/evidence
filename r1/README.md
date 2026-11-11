# ToyOSOrg/ToyOS#1227, round 1

Branch `sdk-one-error-table`. Logs are masked (local paths, temp paths, the runner's machine name).

Revisions: 55a94c866 was the error-table commit on 34cb4c918; fc819b207 the same commit on b56693152; 668f1277b the same on 67713cbc1 (main with #1219), and 22440c6b6 adds `_SC_ARG_MAX`. Main's commits between 34cb4c918 and 67713cbc1 change no file under `sdk/` and nothing in netstack, so the SDK, libc, std and netstack sources these checks built are the branch's.

## Guest rows (guest runner, `.github/workflows/guest-rows.yml`)

- `guest/green-55a94c866-run43036792480.log`: run 43036792480 at 55a94c866, exit 0, 10 of 10: `libc_children netstack_holders_exported_to_children udp_receive_times_out a_link_ends_under_a_held_stream_and_comes_back a_client_killed_mid_connect_gives_its_place_back traffic_leaves_by_the_second_link_while_the_first_is_down a_user_copy_faults_in_mid_copy_or_ends_as_bad_address session_lifecycle virt_user_copy_faults virt_user_mode` (x86_64 and aarch64).

## Host (on the development Mac, targeted per the testing policy)

Clippy runs with the workspace's adopted lints and `-D warnings`.

- `host/fc819b207/`: `cargo test -p toyos`, `cargo clippy -p toyos --all-targets`, `cargo clippy -p toyos --lib --features fd-table`, `cargo test -p toyos-libc-copies`, `cargo clippy -p toyos-libc-copies --all-targets`, `cargo test -p netstack`: all exit 0.
- `host/argmax-2efaafdd7/`: the three `toyos` checks again with `_SC_ARG_MAX`'s change (tree a04fef5b, whose `sdk/` and corpus files are 22440c6b6's): all exit 0, `spawn::tests::max_args_of_a_caller_s_own_fit_beside_the_longest_directory` among them.
- `controls/max-args-{under,over}.{patch,log}`: `MAX_ARGS` one byte under and one byte over, each applied as the patch, built, and failing that test (exit 101) at "one byte past MAX_ARGS" and at "a caller's MAX_ARGS bytes" respectively; the tree restored after each.

## Metal staging (no machine touched)

- `metal/stage-22440c6b6.log`: `cargo test --test toyos-build -- --metal --metal-readback <dir> boot:testcases`, exit 2 (Staged), images `testcases` and `testcases-watchdog`; `metal/request-22440c6b6.txt` lists them. The `testcases` image's corpus expects `sysconf _SC_ARG_MAX: 2088939`.
