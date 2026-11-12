# PR #1269, round 10: rebased onto main 3c5c55584 (#1271)

All on macOS arm64.

## The rebase

**The conflict.** #1271 removed the `tmp_holds_empty_files_by_what_each_costs` row next to this PR's `a_mapped_file_follows_its_pager`, and runs the shared boots as guest rows. The one conflict was in `tests/toyos.rs`. It is resolved in the probe commit, keeping main's removal and this PR's row.

**The resolution's comments** say why the mapped-file row keeps its own boot. `testcases_members_exit_0` judges each member by its exit alone. The row also asserts the kernel's report on serial that a mapper's fault waited past its pager's report time and then no longer did. The job cannot see that report.

**Messages.**
- The rebase's conflict template was left in the probe commit's message. The branch was rebuilt from that commit with its original message. The trees are unchanged.
- Two later messages had a line beginning with `#`, which a message cleanup strips. Each line is reflowed so it begins with a word. The meaning is unchanged.

**`range-diff-4a4d3fe23-41f0e1195.txt`** compares `d1cefbaf9..4a4d3fe23` with `3c5c55584..41f0e1195`:
- 28 commits are `=`.
- The probe commit is `!` for the `tests/toyos.rs` resolution.
- The two reworded commits are `!` for their messages alone.

## Checks at 41f0e1195, from an empty build directory, exit 0 each

The rebase brings in main's harness (`tests/toyos.rs`, `tests/common/`, `tests/checks.rs`), `readdir_bound` and records. It changes nothing under `kernel/` or `sdk/`. So the kernel tests and models at 25a203053 (`r9/checks`) still stand, and these are the checks it can change:

- `01.log`: `cargo test --test toyos-checks`, 55 passed, `suite_split` among them.
- `02.log`: `cargo run -- --ci host lint`, 5 of 5 steps green.
- `03.log`: `cargo run -- --build-only --boot-config tests/images/testcases.toml`. This compiles `mapprobe` and adds `bin/mapprobe`.
- `04.log`: `cargo run -- --build-only --boot-config tests/images/benchcase.toml`.
- `05.log`: `cargo run -- --build-only --arch aarch64 --boot-config tests/images/virtjobcase.toml`. This compiles `mapprobe` for AArch64.
- `06.log`: `cargo run -- --build-only --arch x86_64`.
- `07.log`: `cargo run -- --build-only --arch aarch64`.
