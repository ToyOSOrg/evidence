# PR #1216: a reserved write's bytes go to the device at once

Host and guest evidence for https://github.com/ToyOSOrg/ToyOS/pull/1216. No bench has run this branch; the
metal round is requested, not done. Paths, the runner's identity and CPU model strings are masked.

## r1: branch `seqwrite` at 5a90355df (code) and b0b6dd840 (the same code plus an issue record)

Base: main ad5db5a65. Host: macOS arm64.

| check | command | exit | log |
|---|---|---|---|
| host model, main ad5db5a65 | `cargo test --release --manifest-path system/fileserver/Cargo.toml --test seqwrite_probe -- --nocapture` with `r1/host/seqwrite_probe.rs` placed in `system/fileserver/tests/` | 0 | `r1/host/probe-main.log` |
| host model, 5a90355df, and the file server's suite | `cargo test --release --manifest-path system/fileserver/Cargo.toml -- --nocapture` with the same probe | 0 | `r1/host/fileserver-1.log` |
| engine suite, 5a90355df before the two new tests | `cargo test --release --manifest-path lib/bcachefs/Cargo.toml` | 0 (199 passed) | `r1/host/bcachefs-1.log` |
| the new engine tests | `cargo test --release --manifest-path lib/bcachefs/Cargo.toml reserved_write` | 0 (4 passed) | `r1/host/bcachefs-2.log` |
| served disk | `cargo test --release --manifest-path system/diskserver/Cargo.toml` | 0 | `r1/host/diskserver-1.log` |
| all host checks, 5a90355df | `cargo run -- --ci host` | 1: 109 of 110 steps green | `r1/host/ci-host-1.log` |
| build system's tests with the issue record, b0b6dd840 | `cargo test --lib` | 101: 384 passed, the same one red | `r1/host/build-lib-2.log` |
| guest row `nvme_disk_boots`, 5a90355df, QEMU x86-64 | `gh workflow run guest-rows.yml --ref seqwrite -f filter='nvme_disk_boots'`, run 42986107985 | pass | `r1/guest/guest-rows-42986107985.log` |

The one red host step is `llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key` (and
the child it re-runs), red on every macOS host and recorded in
`issues/the-llvm-environment-test-breaks-git-on-macos.md`: the test sets `SDKROOT=/no/such.sdk` and macOS's
git wrapper fails under it. This branch touches nothing it reads.

An earlier dispatch, run 42985164594, named `data_roundtrip`, which is a metal row's job and no guest row; the
harness refused the filter before running anything. It is a mistake of the dispatch, not a result.

### What the host model counts (`r1/host/probe-main.log`, `r1/host/fileserver-1.log`)

`persist.seq_write_fsync`'s calls on the file server's DATA volume over a recording device: a round is an
open that truncates, 8 reserves of 1 MiB, the write-back in 2 MiB calls and the commit. Counts are exact;
the times printed beside them are the host's CPU and no bench's.

| per round | main | 5a90355df |
|---|---|---|
| file-data writes reaching the disk layer | 128 of 16 blocks | 4 of 512 blocks |
| of them following the one before on the device | 127 | 3 |
| the commit | 3 journal writes (16, 16, 15 blocks), 4 flushes | the same |

The served disk then cuts a write into requests of at most 32 blocks; on this branch a write's requests are
all in flight together (`a_write_past_one_request_asks_them_all_before_any_is_answered`).

### Negative controls (`r1/mutations/`)

Each applied to the working tree at the uncommitted change, run and restored in one script; each `.diff` is
against main, so it shows the change with the mutation in it.

| mutation | command | result |
|---|---|---|
| `pointers-before-bytes`: the pointer transactions run before the device writes | `cargo test --release --manifest-path lib/bcachefs/Cargo.toml reserved` | exit 101, 2 red |
| `a-write-per-extent`: no stretch is joined | the same | exit 101, 1 red |
| `requests-one-at-a-time`: a write's next request waits for the one before | `cargo test --release --manifest-path system/diskserver/Cargo.toml disk::` | exit 101, 2 red |
