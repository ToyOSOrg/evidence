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

## r2: the diagnostic metal round, and the second commit cc718f61f

### Diagnostic round (`r2/metal-diag/`)

Rules and hypotheses written before any boot: `r2/metal-diag/rules.txt`; the request: `r2/metal-diag/request.txt`.
Images D (main ad5db5a65 + the `osbench_disk` row + stage timers) and C (5a90355df + the same), two boots each a
bench, interleaved, with Linux's `osbench persist` after each pair. Every boot's judge passed and every Linux run
exited 0 (`*-chain.log`). The boot logs are the lines of each readback that the round reads, with the drive's model
masked. On the T14 the round also ran `bench_data_survives_reboot` at 5a90355df first: 256 KiB written, synced and
read back after a reboot, both boots passed (`t14-R-*.txt`).

`persist.seq_write_fsync`, MB/s p50 per boot; a T14 boot is slow when its `persist.write_4k_fsync` p50 is over 3 ms:

| bench | D (main + timers) | C (first commit + timers) | Linux |
|---|---|---|---|
| AMD | 265, 243 | 289, 299 | 513, 520 |
| T14 | 187, 138 (both slow) | 177, 171 (both slow) | 583 (fast), 532 (slow) |

The split of a round (osbench's `create_write_fsync_us`, rounds 2 to 4; the file server's and the driver's
`SEQDIAG` lines of the same boots):

- AMD, D: create 4.1, writes 4.5, fsync 22.8 ms; Linux 2.4, 5.5, 8.0. Of D's fsync, the engine's
  `device` 9.8 to 10.6 ms for 128 writes one at a time (the driver timed the drive's own answers at about 6 ms),
  `keys`, `encode`, `build` and lookups together about 3.2 ms, and the commit with five Flushes after.
- AMD, C: fsync 19.4 to 21.4 ms. The driver saw up to 15 commands held at once.
- T14, D and C, all slow: fsync 35 to 47 ms against 36 to 37; the Flush after a burst took what the round trips
  had. Linux's fsync there read 11.4 to 11.6 ms (fast) and 25 to 27 ms (slow rounds).
- C's file-server split is missing: those timers printed only for a write-back of 16 or more data requests,
  and C sends four. `refs/scratch/seqwrite-diag-C2` corrects the threshold and rides the A/B as a single boot.

### The second commit (cc718f61f)

Up to eight fresh extents of one bucket are pointed in one transaction, and a truncation removes up to eight in
one. On the host model a round is 32 transactions and one journal entry of 14 blocks between two Flushes, against
256 and three entries between five.

Negative control `r2/mutations/sixty-four-a-transaction.log`: with 64 extents a transaction the new bounds test
fails on the engine's own assertion, `a transaction of 746 u64s past its bound of 512` (exit 101). The mutation
raised the eight to 64 in the working tree for that run and was restored after it.

Guest row `nvme_disk_boots` at cc718f61f: pass, `r2/guest-rows-43018266273.log`.

Host checks: `cargo run -- --ci host` at cc718f61f, exit 1, 109 of 110 steps green; the red is the macOS-only
llvm environment test (`issues/the-llvm-environment-test-breaks-git-on-macos.md`), which the branch does not touch.
Engine suite at the commit: 202 passed.

### The A/B, staged and not run (`r2/ab/`)

Rules fixed before staging: `r2/ab/rules-ab.txt`; the request with the images' hashes: `r2/ab/request-ab.txt`.
M (main + the row) and P (cc718f61f + the row), four boots each a bench, interleaved, Linux after rounds 1 to 3;
C2 (P + corrected timers) one boot a bench last, no arm; R2 (cc718f61f, `bench_data_survives_reboot`) first on one
bench. The row and the timers are local scratch commits that never land.
