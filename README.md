# PR 1236: a DATA listing reads its inodes in a pass, not one from the root each

Host checks on a macOS arm64 host. Paths are masked; each log ends with its command's exit code.

- `host-targeted/`: at 7d00a1f6c (`revision.txt`), by `b-targeted.sh`:
  - `cargo test -p bcachefs -p fileserver` (`test.log`, exit 0).
  - `cargo clippy -p bcachefs -p fileserver --all-targets` with the gate's adopted lints and `-D warnings`
    (`clippy.log`, exit 101): four findings, all in file-server files the PR does not touch (`listing.rs`,
    `pages/tests.rs`, `writeback.rs`). The file server is a program, which the gate's clippy shapes do not lint.
  - `cargo clippy -p bcachefs --all-targets`, the same lints (`clippy-bcachefs.log`, exit 0): the package the
    gate lints.
- `controls/`: `NEAR` set to 0, so every inode is found from the root, run with
  `cargo test -p bcachefs --lib ops::`: `a_listing_reads_its_inodes_in_a_pass_over_each_run_of_them` red,
  1 003 walks against 4, exit 101. The patch's index names `read.rs` 4f9582c97, which differs from the committed
  990539567 only in the doc comment of `Source::listing`.

The metal A/B of `osbench_disk` is appended here when it is back.
- `host-r1/`: review r1's commit (`revision.txt`), two comments changed: `cargo clippy -p bcachefs --all-targets`
  with the same lints (`clippy-bcachefs.log`, exit 0).
