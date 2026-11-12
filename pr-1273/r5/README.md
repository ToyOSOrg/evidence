# pr-1273, round 5: rebased onto main ce202b249 (#1262)

`12aa41f8c` became `3eaf8171a`. The rebase conflicted only in `tests/toyos.rs`, where #1262's `a_ring3_gs_load_leaves_the_kernel_its_gs` and `ring3_debug_traps_end_their_process` are added at the same place as this branch's row function. Main's two functions are kept whole, and this branch's function follows them.

- **`range-diff.txt`** (`git range-diff 75bdec3cd..12aa41f8c ce202b249..HEAD`): every commit is unchanged except for the anchor of one `tests/toyos.rs` hunk, which is now the function before it on main.
- **`diff-of-diffs.txt`**: empty. It is the branch's whole diff against its base, before and after, compared with `index` and `@@` lines dropped.
- **`summary.txt`** at `3eaf8171a`:
  - `cargo test --test toyos-checks`: exit 0.
  - `cargo test --test toyos-build -- --list`: exit 0, naming #1262's two rows beside this branch's two `/tmp` rows.

Guest run 43123313540 at `12aa41f8c` was green on both architectures: x86-64 made 5,068 empty files, AArch64 3,030. It stands for `3eaf8171a`, whose change from it is #1262's rows alone.
