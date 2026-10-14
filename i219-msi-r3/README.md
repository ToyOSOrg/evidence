# PR 917, round 3: the review's fixes

The review fixes are commit `dce59d1b117718a6cdfb509d16cb9ad7361bd96d`. Commit `3ab96ea7b16acb74b8b7cdaeb60a344a8e39932b` follows it and adds only the guest crate's lockfile line for `toyos-pci`. The host checks do not build the guest crate, so that commit cannot change them. Home paths are masked as `$HOME` and `$TMPDIR`.

| check | command | revision | exit | file |
|---|---|---|---|---|
| host checks | `cargo run -- --ci host` | `dce59d1b1` | 0, 77 steps green | `host-ci.log` |
| negative controls | `python3 -I mutations2.py <tree> <dir>` | `dce59d1b1` | m1, m2 and m7 each 101 at the intended assertion | `negative-controls/` |
| `i219_msi` for AArch64 | `cargo run --release` of `aarch64-i219_msi-driver.rs`, which calls `toyos_build::build::build_toyos_bin(root, Arch::Aarch64, tests/guest/rust-tests, "i219_msi")` | `dce59d1b1` (the log's first line) | 0, 691592 bytes | `aarch64-i219_msi.log` |
| T14 staging, both rows in one boot | `cargo test --test toyos-build -- --metal --metal-readback <dir> claim_reuses_its_remapping_entry i219_messages_on_its_msi_vector` | `3ab96ea7b` | 2, the harness's "staged, nothing judged". The log reads `2 registration(s) ... over 1 boot(s)` and `testcases: 7 job(s)` | `metal-readback-stage.log`, `request.txt` |

What m7 shows: with `reuses_its_entry` reading every record on the boot instead of only its own job's, the recorded check fails with `handed over 3 time(s) and released 2`. A third claim made after the reclaim job's exit is the nightly failure the review found. Scoped to its job, the same log passes.
