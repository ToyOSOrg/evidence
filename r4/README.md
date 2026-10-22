# The backing-memory stack, round 4

The stack is now on `main` 35e930136:

- #1003 `7125a0eb3`
- #1008 `2d271c9f2`, which adds the /tmp snapshot as `2d271c9f2`
- #1010 `53049d55c`

Paths are masked.

## The T14 at dadeebe0a (round 3's staged run)

| file | what |
|---|---|
| t14/judge-h.log.gz | the judge at the head. EXIT=1: the AMD rows, `klogd_hosted`, and the five reds below |
| t14/judge-z.log.gz | the judge at the base 028244feb, osbench only. EXIT=0 |
| t14/osbench-head.txt, t14/osbench-base.txt | each osbench row's p50 |

### The five reds are main's

I reran each of them under QEMU at the head `dadeebe0a` and at its base `028244feb`, the same day, in the same harness. scratch-sweep.patch runs Rust programs; scratch-sweep-c.patch adds named C corpus cases to it. Neither is committed.

| red | head | base | log |
|---|---|---|---|
| `test_rs_vector_state` 101: "a `stat` of /system/bin/test_rs_vector_state was refused" | red | red | r3q-vs-head/base, r3q-c-head/base |
| `209_libc_uname` exit 2: `uname` answers -1 | red | red | r3q-c-head/base |
| `210_stat_identity` exit 1: the four `d_ino` rows on /system answer NO | red | red, the same output | r3q-c-head/base |
| `test_rs_handle_lifetime` 101: "an open carrying a flag bit this ABI does not define was served" | red | red | r3q-act-head/base |
| `test_rs_spawn_child_ends_first` 134 | red ×3 | red ×3 | r3q-act-head/base |

`handle_lifetime`'s cause can be read from the source. Its undefined bit is 32, and `OpenFlags::EXCLUSIVE` has been 32 since main's d48ca1828 ("an exclusive /tmp create"). That commit is still on `main`.

## /tmp spawn (2d271c9f2)

At dadeebe0a, `proc.spawn_wait.large` was 6.41 ms against the base's 0.74 ms, because a program in /tmp was still copied whole at spawn. It is now copied page by page out of a snapshot of the file.

| file | command | revision | exit |
|---|---|---|---|
| h7-guest.log | the shared sweep with `spawn_from_tmp`, and `libc_children` | dadeebe0a plus the fix, uncommitted | 0 |
| controls/tmp-live-source.* | `spawn_from_tmp` with the source reading the file live: the child ends with a memory fault | the same | 1 |

## `libc_children`'s `spawn_children_cap`

| file | revision | exit |
|---|---|---|
| lc-main-1..3.log | `main` 35e930136 | 1, 1, 1: child 240 SIGSEGV twice, an abort once |
| lc-head-1..3.log | the stack on 35e930136 (53049d55c) | 0, 0, 0 |

## The head 53049d55c

| file | command | exit |
|---|---|---|
| h9-host.log | `cargo run -- --ci host`, 102 steps | 0 |
| h9-guest.log | 78 shared Rust tests in one q35 boot (with `spawn_from_tmp`), and 15 QEMU rows | 0 |
| h9-testkernel.log | `tlb_shootdown_waits` ×3, `abuse_kernel_addr`, `global_leaf_discharge`, `global_leaf_flush` | 0 |
| h9-clang.log | `hosted_clang_hello` | 0 |
| r4-metal-prep.log, r4-base-metal-prep.log, metal-request.txt | staged with `--metal-readback`, not run: the head's `testcases`, `testcases-watchdog`, `shared-debug` and `benchcase`, and the base's `benchcase` at 35e930136 | 2 |
