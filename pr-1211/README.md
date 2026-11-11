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
