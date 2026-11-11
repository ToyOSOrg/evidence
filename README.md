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

## Metal A/B on the T14 (metal/)

H = 7d00a1f6c (this change), B = 422915e2c (its parent), row `osbench_disk`, four boots a side in the counterbalanced order
B-1, H-1, H-2, B-2, H-3, B-3, B-4, H-4 set before any boot (`rules.txt`, `request.txt`), run by the orchestrator, all eight
ending "passed" (`rows/<boot>.verdict.txt`).

- `judge/`: each readback judged offline with `cargo test --test toyos-build -- --metal --metal-readback <boot> osbench_disk`
  (`b-judge.sh`, at 506f6f8f8, the branch head, comments only past 7d00a1f6c): every boot exit 0, `PASS osbench_disk`.
  That judge holds `data_on_the_nvme` (DATA a volume of ours on the bench's NVMe, mounted, not formatted by the boot) and
  that every group ran. No boot's log says DATA was formatted. Machine and firmware strings are masked.
- `rows/`: every `fs.disk.*` line of each boot's kernel.log; `readdir.1000` is reported on all eight.
- `analysis/ab.py` and `ab.txt`: each row's p50 per boot, the medians, H/B, and the verdict. With four a side only
  complete separation resolves (exact two-sided Mann-Whitney, p = 2/70):
  - `fs.disk.readdir.1000`: B 2.869 to 2.914 ms, H 2.384 to 2.400 ms, every H below every B: resolves, H/B 0.826.
  - `fs.disk.open_close`: B 21.73 to 21.89 us, H 22.05 to 22.29 us: resolves against H, H/B 1.018.
  - `fs.disk.stat`: B 12.21 to 12.36 us, H 12.50, 14.84, 14.13, 12.52 us: resolves against H, H/B 1.081, the median
    carried by two boots (H-2, H-3); H-1 and H-4 sit 1.1 and 1.3 % above B's slowest.
  - Every other row is unresolved; each row's H/B is in `ab.txt`.
- `codecheck/`: what the two rows against H execute. H's fileserver was built with `cargo run -- --build-only` at 7d00a1f6c
  (`b-build-h.sh`); B's is the one staged for the B image. `analysis/fncmp.py` compares every function's disassembly with
  addresses removed (`fncmp.txt`): 3 589 functions are the same code in both, every one of them at another address in H;
  `DataVolume::lstat`, `stat` and `open` are among them. `Mount::inode`'s future differs: in B the inode's decode is
  inlined into it, in H it calls `decode_inode`, which inlines the four `time` calls B made out of line. The same
  `InodeValue` calls either way, one more call and return per inode read in H, against hundreds of nanoseconds on the rows.
