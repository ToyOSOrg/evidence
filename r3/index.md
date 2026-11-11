# pr-1237 r3: 61007d23a against main 3b93f3770

61007d23a (the head) is 142 commits behind main 3b93f3770, and merges with it cleanly. The merge's tree,
`git merge-tree --write-tree 3b93f3770 61007d23a` = e3ff49644ab7, is the tree of b27fcea81, 61007d23a rebased
onto 3b93f3770 (not pushed: the queued guest run 43093182539 checks out 61007d23a). So the checks below are the
merge group's.

| File | Command | Revision | Exit |
|---|---|---|---|
| `host/checks-on-main.log` | `cargo test -p toyos --lib dl`; `cargo test --test toyos-checks`; `cargo clippy -p toyos --all-targets` and `cargo clippy -p toyos-build --all-targets`, adopted lints and `-D warnings` | b27fcea81 (tree e3ff49644ab7) | 0 each: 21 passed; 50 passed |
| `host/range-diff.txt` | `git range-diff 422915e2c..61007d23a 3b93f3770..b27fcea81` | | all three commits `=`; `git diff -U0` adds and removes the same 239 lines in the same 8 files |

Host paths, user and host names are masked.
