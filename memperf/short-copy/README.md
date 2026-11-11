# libc's short copy: negative controls

These ran in a scratch crate. It compiles the PR's `sdk/libc/src/arch/x86_64.rs` through `#[path]`, with `std-runtime` on, beside a copy of `toyos-libc-copies`' copy tests, including the PR's new short-copy test. It ran with `cargo test --target x86_64-apple-darwin`, x86-64 under Rosetta on an aarch64 macOS host. Rosetta declares no FSRM (leaf 7 EDX = 0), so `copy_forward` itself takes the short copy up to 256 bytes there.

Three mutations of the module were each run against the tests, and each failed (exit 101):

- `mutation-1`: the head stores come before the tail loads, so an overlapping copy reads bytes it already wrote. Caught by the new short-copy test and by `every_copy_agrees_with_copy_within`.
- `mutation-2`: the two-vector arm takes 65 bytes, one more than its four moves cover. Caught by all three copy tests.
- `mutation-3`: the threshold is 260, past what eight moves from each end cover. Caught by `copy_forward`'s tests.

The unmutated file was restored and passed (5 tests).

The PR's own checks of the committed crate are in the PR description.

## Host checks of the committed branch

`host-checks/` holds the three commands at 23d112929; `exits.txt` gives each exit code, all 0. They are the copies crate's tests for x86-64 under Rosetta and natively on aarch64, and its clippy run for x86-64 with the adopted lints and `-D warnings`.
