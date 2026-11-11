# PR 1211: every kernel stack sits above an unmapped page, and an overflow names its stack

Revision under test: `41e545dd31678c2bb08ea0b69153ccef5b394931` (branch `kmem-guards-wx`, on main `9349705ce`), two commits:
`cf370b943` and the fix `41e545dd3`, which changes `kernel/src/arch/x86_64/percpu.rs` alone.
Local paths are masked as `<home>`, `<scratch>` and `<tmp>`; the runner's machine name is masked.

| check | command | target | exit | log |
|---|---|---|---|---|
| host checks | `cargo run -- --ci host` | macOS arm64 host, `cf370b943` | 1: 1 of 110 steps red | `ci-host.log` |
| clippy | `cargo run -- --clippy` | macOS arm64 host, `41e545dd3` | 0: 26 invocations clean | `clippy-41e545dd3.log` |
| guest rows, first push | `gh workflow run guest-rows.yml --ref kmem-guards-wx -f filter='a_kernel_stack_overflow_names_its_stack nested_nmi_is_loud std_threads_count_the_cpus_and_give_back_ended_threads libc_children kernel_wx_leaf_is_refused virt_kernel_wx_leaf_is_refused virt_smp virt_el1_smp virt_user_mode'` | guest runner, run 42939714086, `cf370b943` | failure: 4 AArch64 rows passed, 5 x86-64 rows failed | `guest-rows-42939714086.log` |
| guest rows | the same workflow, filter `a_kernel_stack_overflow_names_its_stack nested_nmi_is_loud std_threads_count_the_cpus_and_give_back_ended_threads libc_children kernel_wx_leaf_is_refused virt_smp` | guest runner, run 42940741605, `41e545dd3` | success, 7 passed | `guest-rows-42940741605.log` |
| negative control | the same workflow at `6bfb268ce` (`41e545dd3` plus `control.diff`), filter `a_kernel_stack_overflow_names_its_stack` | guest runner, run 42942201408 | failure, as intended | `guest-rows-control-42942201408.log` |
| metal boot staged | `cargo test --test toyos-build -- --metal --metal-readback ../metal-stack kernel_wx smp_roster_and_tsc_trail pmm_accounting spawn_cost` | no machine touched | 2: staged, not run | `metal-prepare.log` |

## What is reused across the two commits

The host checks ran on `cf370b943`. `41e545dd3` moves two calls inside `init_bsp` in `kernel/src/arch/x86_64/percpu.rs`, which no
host test executes; clippy, which does compile it in every kernel shape, was rerun at `41e545dd3`. The AArch64 rows
`virt_el1_smp`, `virt_user_mode` and `virt_kernel_wx_leaf_is_refused` passed at `cf370b943` and the fix touches no file AArch64 builds;
`virt_smp` and `virt_kernel_wx_leaf_is_refused` were run again at `41e545dd3`.

## The host red

The one red step is `the build system: cargo test --lib`, and its one failing test is
`llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key`, which fails on every macOS host:
`issues/the-llvm-environment-test-breaks-git-on-macos.md`. The branch's one change under `build/` is a row removed from
`sourcegate.rs`, whose own test passed.

## The first push's red, which was this branch's defect

Every x86-64 guest of run 42939714086 reset after `ACPI: reset register` and before `percpu: BSP`. `init_bsp` carved the boot
CPU's stacks before the `wrmsr` of `IA32_GS_BASE`; a guard page's flush records its CPU through `gs:` once the TLB tables are sized,
so the read faulted with no IDT of this kernel's loaded. `41e545dd3` carves them after `gs:` is valid and before the IDT.

## What the green run shows

One boot per kind of stack, each run off its bottom by its actuator, each ending in a `#DF` whose report names the stack:

```
stack-overflow-task: KERNEL STACK OVERFLOW: 0xffff800000c60ee8 is in the guard page 0xffff800000c60000..0xffff800000c61000 under the kernel stack of pid=0 tid=0
stack-overflow-idle: KERNEL STACK OVERFLOW: 0xffff800000c00ff8 is in the guard page 0xffff800000c00000..0xffff800000c01000 under cpu0's idle stack
stack-overflow-nmi:  KERNEL STACK OVERFLOW: 0xffff800000c26f48 is in the guard page 0xffff800000c26000..0xffff800000c27000 under cpu0's IST2 stack
stack-overflow-boot: KERNEL STACK OVERFLOW: 0xffff80007a301f68 is in the guard page 0xffff80007a301000..0xffff80007a302000 under the boot stack
```

The NMI arm is the one that shows a fault on an IST stack's guard page is a `#DF` the handler reports and not a triple fault.
Not exercised: IST1's own overflow, IST3, and the handler's refusal to report twice.

The guard addresses give the layout: cpu0's idle slot at `0xc00000` (4 KiB + 128 KiB), three IST slots of 4 KiB + 16 KiB from
`0xc21000`, cpu1's the same from `0xc30000`, and the first task's guard at `0xc60000`.

## The negative control

`control.diff` leaves every stack's guard page mapped (the call is kept behind an opaque `false`, since a kernel that never calls
`guard_4k` does not build). The image built and booted to `Boot: complete` with both CPUs online and the supervisor spawned; the first
task then recursed, and the guest reset with neither a `DOUBLE FAULT` nor a `KERNEL STACK OVERFLOW` line. The control branches
`kmem-guards-nc` (which did not build, run 42941100993, not kept here) and `kmem-guards-nc2` were deleted after the run.

No metal bench has booted this revision: the T14 was down and the AMD bench busy when it was staged.

# Round two: `6f1f01b120ca9a4a0aa5e2034c856ebd93438abb`

This branch was recreated once: the guest logs' instrument line carried the runner's CPU model and core count, now masked
as `<cpu model>` and `<n> core(s)` in every log here.

Review r1, reworked to the owner's design: a thread's kernel stack is its job's frames mapped in a kernel virtual range of its own;
per-CPU stacks stay carved out of the direct map at bring-up. Two commits on the round-one head: `130d5e74f` (the rework) and
`6f1f01b12`, which changes `tests/common/faults.rs` alone. Everything in the round-one tables describes the earlier design and is
superseded, the negative control included.

| check | command | target | exit | log |
|---|---|---|---|---|
| host checks | `cargo run -- --ci host` | macOS arm64 host, `130d5e74f` | 1: 1 of 110 steps red, the same macOS-only test | `r2/ci-host.log` |
| clippy | `cargo run -- --clippy` | macOS arm64 host, the tree committed as `130d5e74f` | 0: 26 invocations clean | `r2/clippy.log` |
| guest rows | `gh workflow run guest-rows.yml --ref kmem-guards-wx -f filter='a_kernel_stack_overflow_names_its_stack nested_nmi_is_loud std_threads_count_the_cpus_and_give_back_ended_threads libc_children kernel_wx_leaf_is_refused virt_smp virt_el1_smp virt_user_mode'` | guest runner, run 42954073360, `130d5e74f` | failure: 8 passed, 1 failed | `r2/guest-rows-42954073360.log` |
| the failed row again | the same workflow, filter `a_kernel_stack_overflow_names_its_stack` | guest runner, run 42954506304, `6f1f01b12` | success | `r2/guest-rows-42954506304.log` |
| AArch64 stack probes | `llvm-objdump -d` of the AArch64 kernel built at `130d5e74f` | macOS arm64 host | two frames over a page, each stepping `sub sp, sp, #0x1, lsl #12` then `str xzr, [sp]` | `r2/aarch64-probe-excerpt.txt` |
| metal boots staged | `cargo test --test toyos-build -- --metal --metal-readback <dir> kernel_wx smp_roster_and_tsc_trail topology_readback pmm_accounting spawn_cost syscall_cost abuse_thread_table`, once per bench at `6f1f01b12`; and `spawn_cost syscall_cost` once per bench at the base `9349705ce` | no machine touched | 2: staged, not run | `r2/metal-prepare-*.log` |

## The one red row, which was the test's

In run 42954073360 the four overflow boots of round one passed, the thread's now naming a guard in the new range:
`0xffffff000001eee8 is in the guard 0xffffff0000000000..0xffffff000001f000 under the kernel stack of pid=0 tid=0`.
The new fifth boot, `stack-overflow-report`, reached its raw line,
`DOUBLE FAULT inside the double fault report above, which ends here: cr2=0xffff800000c21f18`, an address in IST1's guard page,
and the test then looked for the first report's records before that line. They reach the console after it, when the halt drains
the log. `6f1f01b12` waits for them instead, and run 42954506304 is green with all five.

## What is and is not shown

- The thread stack's guard is the rest of its slot, 124 KiB here, never mapped; the other four kinds are as in round one.
- IST1's own guard and the handler's second-entry arm are now exercised, by the fifth boot.
- `std_threads_count_the_cpus_and_give_back_ended_threads` spawns and joins 64 threads one at a time and then more, so it retires
  more slots than the batch and takes the flush path. No passing row's log shows the census, so the flush count is unread.
- No negative control was run for the new range. The round-one control left a guard page mapped; in this design a slot's lower
  part is unmapped by never having been mapped, and a mutation that maps it still leaves the slot's first page and the test green.
- A guest row cannot run `abuse_thread_table` (it is a member of the metal shared boot); it is in the staged metal boots.
- No metal bench has booted this revision.

# Round three: `6dc26300d5fde278f7a5390d18d175e27e2d40b9`

Review r2's fixes, two commits on `6f1f01b12`: `4b1ca3bcd` (the fixes) and `6dc26300d`, which changes only the tests in
`kernel/pure/stackslots.rs`.

- A refused spawn no longer builds and forgets a `Stack`, so it keeps no reference to the job.
- Which slot a stack is handed, and when a retired one is clean, is `kernel::stackslots`: pure, three fixed bitmaps over
  262144 slots, host-tested. Nothing allocates under the slot lock and a take past the range's bound is refused.
- x86-64 stack leaves are written accessed and dirty; the range's walk asserts it meets tables; an unmap looks its table up
  without making one.
- The record of the never-freed tables is a question for the owner and says the design is the orchestrator's decision.

| check | command | target | exit | log |
|---|---|---|---|---|
| host checks | `cargo run -- --ci host` | macOS arm64 host, `6dc26300d` | 1: 1 of 110 steps red, the same macOS-only test | `r3/ci-host.log` |
| the slots' tests | `cargo test -p kernel --lib stackslots` | macOS arm64 host, `6dc26300d` | 0: 5 passed | `r3/stackslots-tests.log` |
| negative control | the same on `6dc26300d` plus `r3/control-no-wait.diff` | macOS arm64 host | 101: 3 of 5 red, as intended | `r3/control-no-wait.log` |
| guest rows | `gh workflow run guest-rows.yml --ref kmem-guards-wx -f filter='a_kernel_stack_overflow_names_its_stack nested_nmi_is_loud std_threads_count_the_cpus_and_give_back_ended_threads libc_children kernel_wx_leaf_is_refused virt_smp virt_user_mode'` | guest runner, run 42980721935, `4b1ca3bcd` | success, 8 passed | `r3/guest-rows-42980721935.log` |
| metal boots staged | head, per bench: `… --metal --metal-readback <dir> kernel_wx smp_roster_and_tsc_trail topology_readback pmm_accounting spawn_cost syscall_cost abuse_thread_table` at `6dc26300d`; base, per bench: `… spawn_cost syscall_cost` at `9349705ce` | no machine touched | 2: staged, not run | `r3/metal-prepare-*.log` |

## Reading the host log

The verdict is 1 of 110 steps red: `the build system: cargo test --lib`, 383 passed and 1 failed,
`llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key`. Every other `failures:` list in the log is under a
`control` step, a mutation reaching its verdict. The run includes clippy's 26 invocations, clean.

## The control

The mutation makes retired slots clean when a flush is asked for instead of when it has reached every CPU. Three tests red:
`a_slot_retired_during_a_flush_waits_for_the_next`, `a_spent_range_flushes_for_one_retired_slot_and_refuses_with_none`, and the
property test `no_slot_retired_since_the_last_flush_is_handed_out`. The property test as first written at `4b1ca3bcd` ran each
flush straight through and stayed green under this mutation; `6dc26300d` lands a take and a drop inside every flush, and it
now reds. Restored with `git checkout` on the committed tree and rerun green (`r3/stackslots-tests.log`).

## What is reused

The guest rows ran at `4b1ca3bcd`. `6dc26300d` changes test code inside a `#[cfg(test)]` module of the pure crate, which no
kernel image contains.

Not run: metal. Both benches are reserved; the staged boots run after.

# Round four: `6d7e3557a4632fd7d11637c2bf4067d76a97082c`

Review r3's blocker D, fixed in code by the orchestrator's decision, then rebased twice: onto `cb3f9c062` (one conflict, in
x86-64 `paging.rs`, where main had deleted `wrote_code` beside the new `map_stack`) and, once #1212 had merged and GitHub showed
a conflict, onto `422915e2c` (one conflict, in the list of
`issues/the-kernel-is-at-least-as-secure-as-linux-on-every-machine-toyos-supports.md`). The branch is seven commits on
`422915e2c`; the fix for D is the last.

- A take that finds no clean slot while a flush is under way, or with a batch of retired slots waiting, answers `Flush` and
  changes nothing. The kernel passes such takers through a gate one at a time: the first flushes, the rest find the slots it
  cleaned. A never-used slot is drawn only where fewer than the batch are retired and no flush is under way.
- So the slots ever used are at most the most alive at once and 64 more, and the model's property test asserts that with no
  term for raced takes.

| check | command | target | exit | log |
|---|---|---|---|---|
| host checks | `cargo run -- --ci host` | macOS arm64 host, `6d7e3557a` | 1: 1 of 110 steps red, the same macOS-only test | `r4/ci-host.log` |
| the slots' tests | `cargo test -p kernel --lib stackslots` | macOS arm64 host, `6d7e3557a` | 0: 5 passed | `r4/stackslots-tests.log` |
| negative control | the same on `eb23be19c` plus `r4/control-raced-fresh.diff` | macOS arm64 host | 101: 3 of 5 red, as intended | `r4/control-raced-fresh.log` |
| guest rows | `gh workflow run guest-rows.yml --ref kmem-guards-wx -f filter='a_kernel_stack_overflow_names_its_stack nested_nmi_is_loud std_threads_count_the_cpus_and_give_back_ended_threads libc_children kernel_wx_leaf_is_refused virt_smp virt_user_mode'` | guest runner, run 43013777372, `6d7e3557a` | success, 8 passed | `r4/guest-rows-43013777372.log` |
| metal boots staged | head, per bench, at `6d7e3557a`: `kernel_wx smp_roster_and_tsc_trail topology_readback pmm_accounting spawn_cost syscall_cost abuse_thread_table`; base, per bench, at `422915e2c`: `spawn_cost syscall_cost` | no machine touched | 2: staged, not run | `r4/metal-prepare-*.log` |

- The host run's one red step is `the build system: cargo test --lib`, 384 passed and 1 failed,
  `llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key`; every other failure list is under a `control`
  step. Clippy's 26 invocations and the five `stackslots` tests are in the run.
- The control ran on `eb23be19c`, the fix's commit before the rebases; `kernel/pure/stackslots.rs` is byte-identical at
  `6d7e3557a`. Its mutation lets a take beside a flush draw a never-used slot. Red:
  `a_take_beside_a_flush_waits_for_it_and_a_slot_retired_during_it_waits_for_the_next`,
  `a_spent_range_flushes_for_one_retired_slot_and_refuses_with_none` and the property test.
- Round three's control (retired slots made clean before the flush is done) was not rerun on the new model.
- The same guest rows were also green at the first rebased head `bf0d25eb1` (run 42990708879, not published); the host run at
  that head was cut by a network outage and has no verdict.
- The cost baseline is `422915e2c`, the commit the head sits on, so the pair measures this change alone. Earlier rounds'
  stagings against `9349705ce` are deleted.

Not run: metal.

# Round five: `22a577abe7d58ebc6bec25017dd33de4b038221f`

Review r4's three suggestions, one commit on `6d7e3557a`: two comments in `kernel/src/mm/stack.rs`, each rewritten in the
same number of lines, and the property test's lone taker asserting `begin_flush` in `kernel/pure/stackslots.rs`'s
`#[cfg(test)]` module.

Where round four's items are, for review r4's list, all at `6d7e3557a`:
- the host check's log, `r4/ci-host.log`: one red step, the macOS `llvm` test; `the kernel's library` step lists the five
  `stackslots` tests under their new names; clippy's kernel invocations are there for both targets, ten in all;
- the control's diff and log, `r4/control-raced-fresh.diff` and `.log`: 3 of 5 red, the take-beside-a-flush test, the
  spent-range test and the property test.

| check | command | target | exit | log |
|---|---|---|---|---|
| the staged images' kernel is unaffected | `shasum -a 256 target/x86_64-unknown-none/toyos/kernel` after `cargo run -- --build-only`, at `6d7e3557a` and at `22a577abe` | macOS arm64 host | identical | `r5/kernel-hashes.txt` |
| the slots' tests | `cargo test -p kernel --lib stackslots` | macOS arm64 host, `22a577abe` | 0: 5 passed | `r5/stackslots-tests.log` |

- The x86-64 kernel ELF hashes the same before and after. `bootable.img` does not hash the same across two builds of one
  tree (third entry in the file), so the image's hash says nothing either way; the kernel is the only built artifact these
  two source files feed.
- The AArch64 kernel builds at `22a577abe` (`cargo run -- --build-only --arch aarch64`, exit 0; log not published). Its bytes
  were not compared: no AArch64 image is staged.
- Not rerun at `22a577abe`: the full host run, clippy and the guest rows. They stand at `6d7e3557a` on the hash above.
- The staged boots are still the ones built at `6d7e3557a` (head) and `422915e2c` (base).
