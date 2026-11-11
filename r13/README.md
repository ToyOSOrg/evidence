# PR #1131 r13: the follow-up review's fixes

Head `5cdf3c9bc4bba77852a06f76823120048dd0a17d` (branch `nvme-apst`). The commit renames the two bench
tests after what they assert, deletes the stale track note from the bound test and rewords the
manual's line. No code changed. Run on a macOS arm64 host with the tree clean; paths are masked.
`$ADOPTED` is the `-W` list of the repository's adopted clippy lints.

| log | command | exit |
|---|---|---|
| `test-nvme-apst.log` | `cargo test -p nvme-apst` | 0: 12 passed, the renamed tests among them |
| `clippy-nvme-apst.log` | `cargo clippy -p nvme-apst --all-targets -- $ADOPTED -D warnings` | 0 |

The commit changes only test names, comments and the manual. r12's driver checks and mutations
therefore still apply.
