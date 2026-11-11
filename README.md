# PR #1216: a reserved write's bytes go to the device at once

Host, guest and metal evidence for https://github.com/ToyOSOrg/ToyOS/pull/1216: r1 the host and guest checks,
r2 the diagnostic metal round, r3 the A/B judged. Paths, the runner's identity, machine and drive model strings
and the boots' network lines are masked or left out.

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

## r3: the A/B, judged (`r3/`)

The rules were fixed before the A/B's first boot and before its images were staged: `r2/ab/rules-ab.txt`; the
request with the images' hashes: `r2/ab/request-ab.txt`. M is main ad5db5a65 with the `osbench_disk` row only
(822ac54b8), P the PR head cc718f61f with the same row only (d1ea387ef); C2 is P with stage timers and no arm.
Four boots an arm a bench, interleaved M P, Linux's `osbench persist` after rounds 1 to 3; on the T14 the
reboot round trip at the head (R2) first. Each boot's log here is the lines the A/B reads (osbench's, the test
markers, the file server's DATA lines and C2's `SEQDIAG` lines), masked: the rest of a log names the
machine's network. `r3/chain/` has each bench's chain log: every try and its verdict or exit.

The tables are `r3/ab.md`, written by `r3/ab.py` (`python3 -I ab.py <runs>`) from the boots' and Linux's
lines; A2's log checks are `r3/a2.txt`, written by `r3/a2.sh`.

### A1, no regression: holds on both benches

No `fs.disk.*`, `nvme.*` or `persist.*` row is more than 5% worse in P than in M and resolved (every P boot
beyond every M boot), on either bench, over all boots, and on the T14 in its slow mode alone (three boots an
arm). The `nvme.*` rows report unsupported on both benches: the NVMe holds another system. The T14's fast
mode has one boot an arm (r4-M, r1-P), so it is not established.

Rows P reads more than 5% worse at the median, none resolved:

- AMD: `fs.disk.fstat`, `stat`, `open_close`, `reopen_read_4k` and the `direct.*` rows, 7 to 12%. Each is
  a request to the file server, and each boot's figure follows where the client and the server ran: about
  9 µs for `fstat` on two cores of one LLC, about 11 µs across LLCs or on what the numbering suggests are
  two threads of one core (`ran=` on each line). M has one such boot, P two. The `fs.mem.*` rows, served
  by the memory file system this change does not reach, split the same way in both arms.
- T14: `fs.disk.seek` (244 to 254 ns, and 375 and 387 in r3-P and r4-P) and `fs.disk.read_4k` (730 to 837 ns
  in both arms). Each answers in under a microsecond, where a request to the file server costs 9 µs or more
  (`fs.disk.fstat`), so neither reaches the server, and P changes no client code: M and P differ in
  `lib/bcachefs`, `system/diskserver` and the issue record only.

### A2, correct: holds

Every boot's verdict is `passed`; every boot mounted DATA once and formatted nothing, found its
directories (`DATA mkdir: Exists`), printed no other DATA error and none of the storage path's refusal lines
(a failed or refused request, a reconnect, `Lost`, a request asked again, a stopped or failed mount, a
controller reset, a panic); every test exited 0 (`r3/a2.txt`). R2 (the PR head, 256 KiB written and synced,
then read back after a reboot) passed both boots on the T14.

The row judges passed every boot, run offline over the readbacks (`r3/judge/`): `osbench_disk` for each M, P
and C2 boot and `bench_data_survives_reboot` for R2's two, each `cargo test --test toyos-build -- --metal
--metal-readback <dir> <row>` at d1ea387ef (the harness is the same at M and P: they differ in no file under
`tests/` or `build/`), exit 0 and `1 passed, 0 failed` each (`r3/judge/run.log`, `r3/judge.sh`). These readbacks
predate `back_unix_secs`, and this base's judge does not read it, so no patch was needed for it. One uncommitted
local patch, `r3/judge-local.diff` as #1211's, points the judge at a fresh copy of the benches' records for each
run, so judging added nothing to the shared records; each run judged 0 numbers past their record, and the two it
measured (the boot's `complete_ms` and `back_secs` under this new boot label) were new to the record and so
recorded in the copy, not judged.

DATA's free count at each mount (`r3/free.txt`) is the same at every boot of a bench but one: C2 on the T14
mounted with one 512 KiB bucket fewer free than r4-P did, so r4-P left one bucket more in use than it found.
The three P boots before it and every boot on the AMD left the count unchanged, and r4-P's log refuses
nothing. On the host the grouped path leaves no bucket behind where it is tested: the engine's test that writes
5 MiB in grouped transactions, truncates it and unmounts runs fsck, which derives every bucket's allocation
from the keys, and finds nothing (r2's engine suite). The bench's one bucket is not explained; the T14 boots
requested next read the count again across each boot.

On the AMD, r3-P's first two tries came back without a verdict (network drops, a hung reboot); the third
passed 87 minutes after r3-M. Each try's readback was cleared before the next. Whether another boot ran on
the AMD in that gap is not recorded here; r3-P's mount read the same free count as r3-M's.

### A3, the gain

`persist.seq_write_fsync` and `fs.disk.seq_write.1048576`, MB/s, each boot (T14 mode: `persist.write_4k_fsync`
p50 over 3 ms is slow):

| bench | M | P | P against M, medians | resolved |
|---|---|---|---|---|
| AMD | 242, 241, 262, 239; 452, 454, 460, 455 | 375, 404, 409, 403; 668, 672, 676, 681 | +67%; +48% | both |
| T14 slow | 156, 169, 182; 455, 485, 466 | 228, 217, 202; 563, 573, 569 | +28%; +22% | both |
| T14 fast | 245; 368 | 349; 498 | one boot an arm | not established |

### A4, against Linux: does not hold

| bench | P | Linux (L1, L2, L3) |
|---|---|---|
| AMD | 375 to 409; 668 to 681 | 491, 495, 468; 806, 805, 800 |
| T14 fast | 349; 498 (one boot) | 579, 603, 609; 347, 349, 344 |
| T14 slow | 202 to 228; 563 to 573 | no Linux run of this session was slow |

On the T14 P's 1 MiB row without a sync is above Linux's; the durable row is not, in either bench.

The split of P's round (C2, one boot a bench; `create_write_fsync_us` and the `SEQDIAG` lines of the same boot):

- AMD, ms a round: create 1.6 to 3.1, writes 4.6 to 6.7, fsync 14.1 to 18.5 (14.1 and 14.2 in rounds 3 and 4);
  Linux this session 1.8 to 3.2, 5.4 to 6.3, 8.7 to 10.3 (16.6 in one first round). Of P's fsync: the write-back 9.7 ms, of which the
  device's call 5.3 ms (up to 15 commands held; 1.2 ms of it copies the blocks for the session) and the
  extents' lookups, building and checksums before it and pointer transactions after it 4.0 ms, none of it
  beside the device's time; the commit 2.2 to 2.6 ms (6.6 in round 2), two Flushes; reading the pages out
  0.8 ms; about 1.3 ms not split.
- T14, slow: fsync 29.0 to 30.8 ms: the write-back 16.9 to 18.7 ms, of which the device 11.1 to 13.4 ms for
  the 8 MiB; the commit 9.2 to 11.7 ms, two Flushes of 8.5 to 11.4 ms in sum. Expected before the boots was
  22 to 26 ms; the drive's slow mode writes slower than that.

### The T14's fast mode: more boots requested

`r3/request-t14-fast.txt`: up to two more M P pairs on the T14 from the same images, as the A/B's request
provided for.

### The record's update (e64953f85)

The branch's last commit changes only the issue record's text, adding this A/B's figures. The one host check that
reads a record's body is the identifier gate: `cargo test --lib sourcegate` at e64953f85, exit 0, 10 passed
(`r3/sourcegate-e64953f85.log`).

## r4: review r2's fixes, d3d67f8b5 (`r4/`)

Review r2 found `POINTED`'s derivation false (each piece of a group changed its bucket, and so its LRU entry, on its
own) and the crash-model test not grouping. The branch's head is now d3d67f8b5: da1c40c45 (a group of fresh extents
changes its bucket once; the tests) and d3d67f8b5 (the record).

### Footprint, measured on the host

`r4/logs/verify-measure.log`: each variant built fresh, its `data.rs` hash printed beside its figures, the fix, then
the code before it (`r4/controls/per-piece-bucket-change.diff`: each piece of a group changes its bucket on its own),
then the fix again. Largest transaction, journal u64s and nodes changed:

| case | the fix | a bucket change a piece |
|---|---|---|
| streaming 5 MiB over 2 MiB buckets, plain | 212, 7 | 247, 7 |
| the same, encrypted | 228, 7 | 263, 7 |
| its truncation | 202, 8 | 202, 8 |
| a full group, bucket entry 1/16 to 9/16 full, 1 MiB buckets of 16 KiB nodes, LRU in one leaf | 203, 6 | 238, 6 |
| the same, LRU spread over many leaves by 1500 buckets left at every fill | 203, 8 | 238, 11 |

The margins the tests hold are a quarter of the 512 u64 bound and half the 28-node footprint; both variants are
within them, so the code before the fix is no red, and its figures are above it. `r4/logs/repeat-measure.log` repeats the
streaming case three times (212 and 228 each time). `r4/logs/diag-*.log` hold a one-off print of the largest
transactions' keys by tree (`r4/controls/diag-txn-prints.diff`).

`r4/controls/controls-r3.log` and the two logs it names first (`measure-fix.log`, `control-per-piece-bucket-change.log`)
are superseded: their figures came out swapped against three later builds that print their source's hash, for a
reason not found (a stale build is suspected). Nothing is concluded from them.

### Negative controls (`r4/controls/controls2-r3.log`, each applied, built with its hash printed, run, reverted)

| control | result |
|---|---|
| `grouping-off.diff`: no piece is fresh, so no group | exit 101: the crash test sees 2 of 3 extents pointed at request 16; the bounds tests count 80 pointer transactions for 80 extents and 8 for the group |
| `refill-keeps-sectors.diff`: a bucket drained one sector short | exit 101: the reuse-cycle test's fsck after round 2 finds alloc keys that differ from what the extents derive |

### Host checks on the touched crates (`r4/logs/r3-checks.log`), at da1c40c45's code

| check | command | exit |
|---|---|---|
| engine suite | `cargo test --release --manifest-path lib/bcachefs/Cargo.toml` | 0, 204 passed |
| file server suite | `cargo test --release --manifest-path system/fileserver/Cargo.toml` | 0 |
| served disk suite | `cargo test --release --manifest-path system/diskserver/Cargo.toml` | 0 |
| clippy, the touched packages | `cargo clippy -p bcachefs -p diskserver --all-targets -- <the adopted lints> -D warnings` | 0 |
| identifier gate, d3d67f8b5 | `cargo test --lib sourcegate` | 0, 10 passed |

A comment in `write_reserved` was reworded after these ran; nothing else changed.

### The second A/B, staged (`r4/metal/`)

Rules fixed before P' was staged: `r4/metal/rules-ab2.txt`; the request: `r4/metal/request-ab2.txt`. P' is the head
plus the `osbench_disk` row (ec98464cd, `r4/logs/stage-P2.log`, exit 2: staged); M is the first A/B's image. ABBA on
each bench, 8 boots, every mount's free figure recorded.

Correction to r4: the review it answers is the PR's first (r1, on e64953f85); r4 and `r4/metal/rules-ab2.txt` call it
"review r2". Nothing else in them changes.

## r5: the second A/B's rules amended before its boots (`r5/rules-ab2.txt`)

The PR's second review (r2, on d3d67f8b5) left three notes on `r4/metal/rules-ab2.txt`. They are settled by an
amendment dated 2026-11-11T18:02Z, appended before any boot of the second A/B: r4-M counts toward the T14's
fast-mode M arm only if this A/B's M boots pass the 5% agreement check, and the gate stays on this A/B's boots; if the
fast mode is not established no more boots are asked for and the description and the record say so; a drop in the
free figure after an M boot is reported and not attributed to P', and a drop after any P' boot sends the PR back
even if a later mount recovers it. `r5/rules-ab2.txt` is the whole file with the amendment; the text above it is
r4's unchanged.
