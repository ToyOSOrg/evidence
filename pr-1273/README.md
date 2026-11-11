# pr-1273: a pager's objects charged as they are made, and `/tmp` holding files by that

Head `17884f557ec351507a1e8c3f063e45ae016996e9`, rebased onto main `818809583`. The same change at `087d3ed14`, on main `e10b6fd49`. The host is macOS arm64. Paths are masked (`<worktree>`, `<home>`, `<tmp>`, `<uid>`).

## host/

| file | command | revision | exit |
|---|---|---|---|
| `ci-host-087d3ed14.log` | `cargo run -- --ci host` | 087d3ed14 | 1 |
| `ci-host-17884f557.log` | `cargo run -- --ci host` | 17884f557 | 1 |
| `build-only-17884f557.log` | `cargo run -- --build-only` | 17884f557 | 0 |
| `toyos-checks-17884f557.log` | `cargo test --test toyos-checks` | 17884f557 | 0 |
| `kernel-slots-test-087d3ed14.log` | `cargo test -p kernel --lib slots` | 087d3ed14's tree | 0 |

Both `--ci host` runs are 113 of 114 steps green, with clippy (warnings denied) among the green ones. The red step is `the build system`. Its one failure is `llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key`, which is red on every macOS host because of the xcrun `git` wrapper (`issues/the-llvm-environment-test-breaks-git-on-macos.md`). The branch changes nothing under `build/`.

## sizes/

`sizes.rs` replicates the layouts of the kernel's `Entry`, `Object` and page `Slot`, and of the file server's `Inode` and `File`, with the same field types. It also does the file server's 4 GiB sizing arithmetic. Built with `rustc -O --edition 2024 sizes.rs` on the host; its output is in `sizes.txt`:

- an object slot was 56 + 4 = 60 bytes, preallocated;
- a 4 GiB guest's 953,443 frames give a capacity of 55,494 pages and 3,468 objects;
- that is one object per 1,126,096 bytes of RAM, and a 208,080-byte table.

The replica is a check by construction, not the kernel's own build. The kernel const-asserts what the branch relies on.

## Guest

Guest-runner run 43110990766, x86-64, with three rows:

- `tmp_holds_empty_files_by_what_each_costs`
- `a_spawn_from_an_image_frees_it_when_the_child_ends`
- `a_row_reaches_its_own_state_and_no_other`

It was queued when this was written. For the base's refusal on the same 4 GiB guest, see [pr-1271/tmp-cap](https://github.com/ToyOSOrg/evidence/tree/133bf3ff204ad9c45549c19e7cc7b1bc773fb8e8/pr-1271/tmp-cap).
