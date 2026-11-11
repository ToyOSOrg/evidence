# PR #1233: a withdraw names again every waiting read it takes a page from

Host and guest evidence for https://github.com/ToyOSOrg/ToyOS/pull/1233. Paths are masked.

## r1: branch `paged-rereport` at ab4ba05ab

Base: main b56693152. Host: macOS arm64. The commit was made as 5c487409f on main 34cb4c918 and rebased;
`git diff 5c487409f ab4ba05ab -- . ':!issues'` is empty, so the host test and control run on 5c487409f's tree
hold for ab4ba05ab.

| check | command | revision | exit | log |
|---|---|---|---|---|
| the kernel's paged tests | `cargo test -p kernel --lib paged::` | 5c487409f | 0 (20 passed) | `r1/host/host-paged-2.log` |
| negative control: `Want::withdrawn` never news | `r1/host/mut-withdrawn.patch` applied, `cargo test -p kernel --lib a_want_is_named_once`, patch reversed and the file compared | 5c487409f | 101 (the claim's test red), restored identical | `r1/host/mut-withdrawn.log` |
| clippy, the kernel's host library and tests | `cargo clippy -p kernel --lib --tests --features sched-check -- <adopted lints> -D warnings` | ab4ba05ab | 0 | `r1/host/clippy.log` |
| clippy, the x86-64 kernel, default and `boot-actuators,test-actuators` | `cargo clippy -p kernel --target x86_64-unknown-none [--features ...] -- <adopted lints> -D warnings` | ab4ba05ab | 0, 0 | `r1/host/clippy.log` |
| clippy, the AArch64 kernel | `cargo clippy -p kernel --target aarch64-unknown-none-softfloat -- <adopted lints> -D warnings` | ab4ba05ab | 0 | `r1/host/clippy.log` |

`<adopted lints>` is `build/clippy.rs`'s `ADOPTED` list, spelled out in the log.

The control's red line: `a withdraw of the range's last page goes unheard`.

## Guest

Dispatched at ab4ba05ab: run 43048940831, naming
`a_pager_s_end_answers_its_waiting_holders_gone a_served_file_reads_through_its_paged_object`. The harness refused
the filter before running anything (`No test matches filter`): both are shared binaries of the metal boots, not
QEMU rows. A mistake of the dispatch, not a result. No QEMU row reaches a holder's waiting read.

## Metal

At ab4ba05ab, the T14's `testcases` boot with exactly those two jobs:
`cargo test --test toyos-build -- --metal --metal-readback <dir> a_pager_s_end_answers_its_waiting_holders_gone a_served_file_reads_through_its_paged_object`,
exit 2 (staged; the machine untouched), log `r1/metal/stage-t14.log`. The orchestrator ran it: verdict `passed`,
both jobs `exit=0`, no "has a read overdue" line (`r1/metal/t14-ab4ba05ab-readback.txt`: the verdict and the two jobs'
lines). Review r1's fix changes the wait those jobs exercise, so this boot does not cover the head below.

## r2: branch `paged-rereport` at 43fa98206 (review r1's fix)

A holder's wait also ends where the object's version moved (`Pages::wait_over`); the withdraw marks its waiters in
the pure `Pages::withdraw` (`Waiters`), in the hold that removes the pages. Host: macOS arm64.

| check | command | revision | exit | log |
|---|---|---|---|---|
| the kernel's paged tests, the wait model among them | `cargo test -p kernel --lib -- paged::` | 43fa98206 | 0 (22 passed) | `r2/host/host-paged-r2.log` |
| control: the wait ends only on the page (no version exit) | `r2/host/mut-no-version-r2.patch`, the same command | 43fa98206 | 101, restored identical | `r2/host/mut-no-version-r2.log` |
| control: the withdraw marks no waiter | `r2/host/mut-no-mark-r2.patch` | 43fa98206 | 101, restored identical | `r2/host/mut-no-mark-r2.log` |
| control: `Want::withdrawn` never news | `r2/host/mut-withdrawn-r2.patch` | 43fa98206 | 101, restored identical | `r2/host/mut-withdrawn-r2.log` |
| clippy, the kernel's four shapes (as in r1) | `cargo clippy ... -- <adopted lints> -D warnings` | 43fa98206 | 0 each | `r2/host/clippy-r2.log` |

The model's red lines: without the version exit, `after [Report, Answer, Supply, Supply, Shrink, Grow]: the read
waits for ever`; without the marking, `after [Report, Answer, Supply, Supply, Supply, Withdraw]`.

Metal: the T14 `testcases` boot with the same two jobs, staged at 43fa98206, exit 2 (`r2/metal/stage-t14-r2.log`),
requested. It must show both jobs `exit=0` and no "has a read overdue" line; its readback is added here.
