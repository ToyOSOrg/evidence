# PR 1072 review r1 evidence at ToyOS 66a93650693038626f01786eb5fcec65ec26f2a8

Host: macOS (aarch64) development host. No machine was touched.

| file | command | exit |
|---|---|---|
| `ci-host.log` | `cargo run -- --ci host` | 0 ("Host: 103 step(s), all green") |
| `negative-control.log` | `m5-no-fstype-check.patch`: `git apply --check`, apply, `cargo test --lib -- an_adopted_disk_reads_back_as_scratch_with_no_filesystem`, `git apply -R`, rerun | mutated 101, restored 0 |

The sources for the Linux-side facts are unchanged; see `../93914b384/README.md`. The block-layer model and its controls in that directory were removed in review r1. They describe the earlier revision only.
