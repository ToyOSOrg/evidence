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

Dispatched at ab4ba05ab: run 43048940831,
`a_pager_s_end_answers_its_waiting_holders_gone a_served_file_reads_through_its_paged_object` (QEMU x86-64).
Its result is added here when it ends.
