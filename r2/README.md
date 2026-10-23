# #1045, round 2: review r1's blockers

Head `1595bbbcd`. Paths are masked.

| file | command | revision | exit |
|---|---|---|---|
| r2-ci-host.log.gz | `cargo run -- --ci host`: 103 steps green | `1595bbbcd`'s tree, uncommitted then | 0 |
| r2-sweep.log.gz | the 79 shared Rust tests in one q35 boot, `readdir_bound` appended last | `1595bbbcd` | 1: `readdir_bound` only, see below |
| r2-readdir.log.gz | `readdir_bound` alone in its boot, as its rows run it | `1595bbbcd` | 0 |
| r2-rows.log.gz | 11 QEMU rows: `kernel_objects_refused_alone`, `libc_children`, `virt_claim_lpi` (`claim_bar_fault`'s futex on the BAR), `virt_smp`, spawn and stream rows | `1595bbbcd` | 0 |
| r2-guest-1.log.gz | `kernel_objects_refused_alone` and `virt_claim_lpi` before the commit | the same tree | 0 |
| t14-judge-8288896ed.log.gz | the coordinator's T14 judge of round 1's boots: 274 passed, 4 failed (the three amdvi rows and `klogd_hosted`, as before) | `8288896ed` | 1 |
| osbench-8288896ed-vs-r4.txt | osbench p50 at round 1's head against round 4's head (the stack without charges) and its base | | |

`readdir_bound` appended after 79 other members was refused `OutOfMemory` at the 16,384-entry listing. The cause, which the reviewer found, is files `std_process` and `file_mtime` leave in `/tmp`. They push the listing past `MAX_LIST_ENTRIES`, so the refusal is that bound, not leaked memory. In its own boot, which is where its rows run it, it is green.

## Controls

| control | breaks | result |
|---|---|---|
| futex-reach-unchecked | `reach` no longer refuses an aperture | `virt_claim_lpi` red: a kernel data abort, `scheduler::futex_wait` in the backtrace |
| listing-uncharged | a listing charges nothing | `kernel_objects_refused_alone` red: the kernel panics, "memory allocation of 3928 bytes failed" in `TmpFs::list` under `sys_readdir` |
| dirs-uncharged-2 | directories charge nothing (round 1's control, in the test's own boot) | red by its assertion: "200000 directories were made and none refused", 339 s, the kernel alive and the serial log kept |

Round 1's `dirs-uncharged` went silent for 1,066 s in a shared boot. In its own boot the same control reaches its assertion in 339 s with no kernel stop. The listing control shows that heap exhaustion panics loudly, naming the allocation. So the earlier silence was most likely the fill still working with nothing printed, past the harness's ceiling. That is an inference: the shared run's serial log was not kept. The test now prints its progress every 20,000 directories.

## The T14 at `1595bbbcd`

`t14-judge-1595bbbcd.log.gz` is the coordinator's judge of five boots (`boot:testcases boot:shared-debug kernel_objects_refused pmm_accounting osbench`): 273 passed and 5 failed. None of the 5 is this PR's:

- `klogd_hosted`, from `usbd_spare_fault`'s deliberate fault;
- `i219_messages_on_its_msi_vector` (`issues/i219-msi-passes-only-when-the-network-sends-it-a-frame.md`);
- the three AMD-only amdvi rows.

`kernel_objects_refused` passed on its own boot, `testcases-refused`.
