# Round 2 of ToyOSOrg/ToyOS#969 (and #970 rebased on it)

Host: macOS on Apple silicon, 14 cores; x86_64 guests under QEMU TCG. Paths masked as in r1.

| file | command | revision | exit |
|---|---|---|---|
| mutations/run-btree.log | `mutations/run-btree.sh`: `btree-revert.patch` (routing over every child plus the old binary-search sibling placement, i.e. the whole fix undone) and `btree-early.patch` (siblings spliced at `idx`, one slot early), each applied, built, run against `keys_below…` and `the_tree_agrees…`, reverted | 4266bf883 (#969 head) | 101 for all four; unmutated crate 74 passed. The full messages are in `btree-*-*.log`, e.g. "756 of 1200 keys are not found" and "op 824: the tree has no Key …, which the map holds, to delete". |
| r2-ci-host.log | `cargo run -- --ci host` | 4266bf883 | 1: 86 of 87 steps green. The one red is the `/tmp` leftover check naming `/tmp/toyos-tmp-66751-0`, a guest harness's `TempDir::short("boot")` root. This run booted no guest; it is `issues/the-tmp-leftover-check-can-name-another-worktrees-killed-run.md`. |
| r2-build-only-x86_64.log, r2-build-only-aarch64.log | `cargo run -- --build-only [--arch aarch64]` | bf89b09d1 (4266bf883 differs only inside a `#[cfg(test)]` function) | 0, 0 |
| r2-guest.log | `cargo test --test toyos-build -- hosted_clang_hello` | 2fd0798e6 (#970 rebased on 4266bf883) | 1: boots a version-2 ROOT, formats a version-2 DATA, and `pkg install` writes 2025 entries with no file-server entry failure (exit 0); `clang -c` then fails on `stdio.h` (#970's libc blocker, independent of #969) |
| splitstat.txt | the model test with a temporary eprintln of every child split (idx, children, siblings), not committed | 92d762e42's tree (same routing and test as 4266bf883) | 674 splits: 223 of a first child, 445 of a middle child, 54 into more than one sibling |
