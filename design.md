**Design round. Nothing is built yet.** This takes up `issues/every-syscall-saves-the-fp-state-and-every-preemption-disable-is-locked.md`, which is on #866's branch.

The measurement that ordered this round is https://github.com/ToyOSOrg/ToyOS/pull/866#issuecomment-6119438569. Removing the entry's FP save and the preempt count's `lock` prefixes from the null syscall cuts it from 646 to 423 TSC cycles on the T14 (−34.5 %) and from 385 to 218 on the AMD bench (−43.4 %). That run used the scout at `wt/toyos-scout-sys` `fbb958b17`, on FXSAVE64 images.

## 1. Which sites account for the lock saving

This comes from reading the code. No boot was needed.

The scout's `scout-nolock` build removed `lock` in two places: the entry's raise and lower (`syscall.rs:63`, `:67`), and `percpu::gs::lock_{inc,dec}_u32`. Those two functions sit behind `preempt::disable` and `preempt::enable`, which every `sync::Lock` acquire and release calls (`sync.rs` `acquire`, `LockGuard::drop`).

A `SYS_GETPID` passes through `syscall_dispatch` (`dispatch.rs:76-85`, `:707-709`), and that function calls `process::with_current_data` twice. Each call does the following (`process.rs:786-820`):

- takes `PROCESS_TABLE.lock()`: a preempt raise, a ticket `lock xadd`, a `now` `lock xadd` and a preempt lower;
- clones the thread's `Arc` with one `lock xadd`;
- takes `arc.lock()`, which repeats the same four;
- drops the `Arc` with one `lock xadd`.

Nothing else on the path is locked. `leave_user_if_due`, `try_with_cpu`, `drain_zero_handles`' flag, `nanos_since_boot`, `enter_syscall` and `leave_syscall` are plain loads and stores.

Counted that way, the null syscall issues **22 locked instructions**. `scout-nolock` removed **10** of them: the entry's 2, plus 4 preempt raises and lowers in each of the two `with_current_data` calls.

| bench | measured saving | ÷ 10 | Ring 3 cost of one `lock` between an fxsave64/fxrstor64 pair (same boots) |
|---|---|---|---|
| T14 | 147 | 14.7 | 95 − 80 = 15 |
| AMD | 57 | 5.7 | 117/118 − 111/112 = 5–6 |

The 10 sites account for the whole saving at the per-prefix cost each bench measured. That cost should not be compared with the 7-cycle `lock add` against `add` in a tight loop. The other 12 locked instructions remain: the ticket and `Arc` RMWs of two table-lock round trips, which exist only to bump `syscall_total` and `syscall_total_ns`. That is outside this fence, and the build round files it as a defect.

## 2. Where user FP/vector state lives when no entry saves it

**The design: the state stays in the registers for as long as its thread is on the CPU, and it is saved only when the thread is switched out.**

- **The area.** Each context that can run in Ring 3 owns one save area for its whole life, at the top of its own kernel stack. The area is `fpu::AREA_BYTES` rounded up to 64 bytes. The stack top that `percpu::set_kernel_stack` installs (TSS `RSP0` and `gs:kernel_rsp`) moves down to the area's base, so no frame of any entry, handler or nested interrupt ever lands on it. The idle context and kernel threads (`sched/kthread.rs`, `Start::Kernel`) never run in Ring 3 and have no area: `KernelCtx` holds an `Option`.
- **Save and restore.** `KernelHw::switch` saves the outgoing context's live registers into that context's area just before `context_switch`, by #859's `FORM` (XSAVES, XSAVEC or XSAVEOPT, with the mask all ones). When `context_switch` returns, the resumed context is back in its own earlier `switch` frame, and it restores from the same area. The save and the restore are one variable at one address. A fresh thread never returns through `switch`: its trampoline loads #859's initial image, as it does now.
- **Deleted.** `save_user_state!` and `restore_user_state!` leave every entry: `syscall_entry`, `common_entry`, `timer`, `device_irq_entry`, `tlb_flush_entry`, and the `spurious` and `unclaimed` saves that #859 added. The `rdx` and `rax` shuffles #859 added in `syscall_entry` go with them. So do the `fp_area` and `fp_form` operands of `ring3_naked_asm!`. `Ring3Entry` and `Ring0Entry` exist because a gate that can reach another task brackets the user state. Once no gate brackets it, the build round reads every use: if nothing else rests on the split, the two types collapse into one, and otherwise the split stays with its remaining reason at the site.
- **#859's invariant, restated.** XSAVEOPT and XSAVES skip a component left unmodified since the last restore from the same address. So between a context's switch-in restore and its next save on that CPU, nothing may write its area. The only writer of the area is the context's own save, and every path that resumes a context on a CPU (the `switch` return or a trampoline) performs an XRSTOR or XRSTORS on that CPU before that context can save there. This is #859's invariant with one site instead of eight. It becomes the module header of `arch::entry` or `arch::fpu`.

**What each case sees:**

- **A syscall, or an interrupt from Ring 3, that does not switch.** Nothing is saved or restored. The kernel executes no instruction that touches x87, MMX, SSE, AVX or AMX state (§3), so `sysretq` or `iretq` returns to registers the kernel never wrote. Every tick and every device interrupt taken from Ring 3 also drops its XSAVE and XRSTOR, which #859 made unconditional.
- **A context switch.** The outgoing context saves to its own area and the incoming one restores from its own area with the full mask. XRSTOR initialises every component its `XSTATE_BV` leaves clear, so no register keeps a value from the CPU's previous tenant when the incoming thread reaches Ring 3. The same holds across a migration: the save on one CPU is published before another CPU can take the context, because the hand-off is ordered after the save in program order. The build round checks that ordering against SDM Vol. 3A §9.2.2 (§6 lists it as uncertain). The switch saves whatever the registers hold even when the outgoing thread is inside a syscall or was preempted in Ring 0, and that is correct because the kernel is soft-float. The save point therefore does not depend on where a switch happens. `issues/syscall-preemption-is-incidental.md`'s step, which lets a syscall be preempted, needs exactly that.
- **A fault.** Every Ring 3 exception other than `#PF`, including `#MF` and `#XM`, ends the process through `fatal_exception` (`idt/exceptions.rs:483`). The state is never read, and a crash report that someday wants the vector registers reads them live. A `#PF` that blocks is a context switch. One that does not block returns to untouched registers.
- **A signal.** The kernel delivers none. libc's `alarm` runs no handler (`sdk/libc/src/alarm.rs`), and a handler that libc ever runs runs on the thread in Ring 3, with its own live registers. A future kernel-written handler frame would save the live state into that frame when it builds it. This design neither provides that nor blocks it.
- **A thread that never touches FP.** Its syscalls and interrupts pay nothing. Its switch pays an XSAVE whose init optimisation writes the header and nothing else, plus an XRSTOR that initialises every component. Before this change, every entry paid that pair.
- **A thread's last switch** saves once into an area that dies with the stack, which a later pass frees (`hw.rs` `release`). That is one wasted save per thread lifetime, and passing `Dispose::Exit` into `switch` to skip it would cost more code than it saves.

**Ordering with #859.** #859 has been reviewed LAND and is held for a combined PR. The build round merges `origin/wt/toyos-xsave` at its reviewed head into this branch and builds on #859's `FORM`, `AREA_BYTES` and initial images. This branch lands strictly after #859: once #859 is on `main`, the diff shrinks to this change alone. If #859 is still held when this branch is green, the orchestrator decides whether this branch joins the combined PR. If #859 moves, this branch merges it again before review. The metal base arm is `main` with #859 (§5).

**AArch64** is out of this branch. Its entry keeps its eager save. No AArch64 metal exists, so there is nothing to measure a change against. The build round files the twin.

## 3. Holding the soft-float invariant on every byte the kernel runs

After this change, kernel use of FP or vector instructions is no longer harmless. One such instruction corrupts a user thread's registers. `build/build.rs` `assert_kernel_is_softfloat` checks only the target's `cfg`. I measured what the toolchain refuses on `x86_64-unknown-none` (nightly-2026-09-25, `no_core` probes posted whole at https://github.com/ToyOSOrg/ToyOS/pull/871#issuecomment-6119688581):

| what | result |
|---|---|
| `asm!` text: `movaps xmm0, xmm1`, `vpaddd ymm`/`zmm`, `fld qword ptr [rax]`, `paddb mm0, mm1`, `ldmxcsr`, `xsaveopt64` | **accepted**, `EXIT=0` |
| `asm!` operand `in(xmm_reg)` | refused, `EXIT=1`: "register class `xmm_reg` requires the `sse` target feature" |
| `#[target_feature(enable = "avx2")]` | refused, `EXIT=1`, but only by the deny-by-default lint `x86_softfloat_sse`, which `#[allow]` lifts and `--cap-lints` lifts for every registry dependency |
| target cfg | `target_feature="x87"` and `"fxsr"` are on, so x87 is the compiler's to use |

**rustc itself cannot refuse an instruction written as asm text.** The earliest point that sees every instruction the kernel runs (inline `asm!`, `naked_asm!`, `global_asm!`, every dependency, and anything LLVM chose) is the linked kernel ELF. The design is therefore a refusal at link time: the build will not produce a kernel image that contains a forbidden instruction.

- The build decodes every executable section of the linked x86_64 kernel with **`iced-x86`** (decoder and `instr_info` features). The new dependency is justified: it is a general, widely used, pure-Rust x86 decoder that can run on ToyOS. x86 decoding is not ToyOS's own job, and the only alternative, a C++ LLVM tool, is refused where a Rust tool does the job.
- It refuses, naming the symbol, offset and mnemonic, any instruction whose `CpuidFeature` set names x87, MMX, any SSE, AVX, AVX-512, AMX, FMA, F16C, XOP or 3DNow!, or which uses an ST, MM, XMM, YMM, ZMM, K or TMM register.
- The **allow-list** is the save family by mnemonic (`xsaves64`, `xrstors64`, `xsavec64`, `xsaveopt64`, `xrstor64`, plus `fxsave64` for `fpu`'s boot self-check), and only inside the `arch::fpu` and `arch::entry` symbols that own those instructions. `xgetbv` and `xsetbv` are allowed because they read and write `XCR0`, not register state.
- The sweep is linear. LLVM puts no data in x86 `.text`, and a byte that does not decode is refused, so the gate checks that assumption instead of trusting it.
- The x86 arm of `assert_kernel_is_softfloat` is deleted, because the byte gate subsumes it: a target that grew SSE would put SSE everywhere, and the gate names the first instance. Its message about "FXSAVE64's image" is already false under #859. The AArch64 arm stays, since AArch64 still saves at every entry.
- The cheapest tier tests the gate itself: a host test feeds it hand-encoded instructions, one per refused class, plus the allowed save family in an allowed symbol and the same instruction in a symbol outside the list.

## 4. Why the preempt count needs no `lock`

- **Only its own CPU writes it.** On x86 every write goes through `gs:` to the CPU's own `PerCpu` block: `set_preempt_count` (`switch`), `preempt_count_up` and `preempt_count_down`, and the stubs. Nothing in the kernel reaches the word through another CPU's block (`rg OFF_PREEMPT_COUNT\|preempt_count kernel/src/arch/x86_64`). `lock` buys atomicity only against other agents on the bus, and no other agent writes this word.
- **Interrupts and NMIs.** A plain `add dword ptr gs:[off], 1` is a single instruction. Interrupts and NMIs are delivered only on instruction boundaries (SDM Vol. 3A §6.6), so nothing on the same CPU can split it. The current comment at `percpu.rs:299`, "an IRQ can split a plain `add`'s load/store", is false of the hardware. Beyond that, the NMI touches no preempt count (`idt/nmi.rs:6`), and every maskable handler raises and lowers it in pairs. Even an RMW that could be split would find the value it left on return.
- **The fence it also was.** On x86 a `lock` RMW is a full barrier. No user of `preempt::disable` or `enable` relies on it: `Lock::acquire`'s ticket `fetch_add` and `LockGuard::drop`'s `now` `fetch_add` are locked RMWs in their own right. `need_resched` is likewise written only by its own CPU (the kick, timer and device handlers' `set_need_resched`), so `preempt::enable`'s read after the lower sees it in program order. The asm keeps no `nomem` option, so it remains a compiler barrier.
- **Deleted:** `gs::lock_inc_u32` and `gs::lock_dec_u32` become `inc_u32` and `dec_u32` without `lock`, and the false comment goes. The raise and lower in `syscall_entry`, `common_entry`, `device_irq_entry` and `tlb_flush_entry` drop `lock`. The syscall entry's raise itself stays: removing it is `issues/syscall-preemption-is-incidental.md`'s step, not this branch's.
- AArch64's `fetch_add(Relaxed)` is outside the issue and stays, since no AArch64 metal could measure a change. The same argument holds there except for the single-instruction point. Its RMW can be split, but only by a handler that is balanced.

## 5. The metal measurement that judges the build, and its kill condition

The orchestrator runs it on both benches with two images built from one tree. The **base** is the merge base, `main` with #859. The **head** is this branch. Both carry the scout's `syscall_cost` extension and `scout_wake` (test side only, not the kernel twins), so the rows are `scout_syscall` (getpid min TSC over 9×20000, the Ring 3 controls and the XMM check) and `scout_wake` phase 0. Both are fixed here, before the run:

- **Kill condition:** the build is dropped if head's getpid min TSC is above **0.75 × base** on either bench. The scout measured 0.655 (T14) and 0.566 (AMD) against an FXSAVE64 base, and an XSAVE base saves no less. A miss means the build does not deliver what the scout measured.
- **Prediction:** head lands within 5 % of the scout's `both` arm, 423 TSC on the T14 and 218 on the AMD, because its entry is that arm's entry.
- **Guard (the switch path):** the switch now does the save the entry did, so a park/unpark round costs the same work. The build goes back if head's `scout_wake` phase-0 rounds are more than 5 % below base's on either bench.
- **Correctness on metal:** #859's `vector_state` row passes on both benches. Its threads load their registers once and then only spin, so their components stay unmodified across switches. That is the case in which XSAVEOPT and XSAVES skip a component, and so the case that catches an area something else wrote.

## Roast

1. **One stray vector instruction in the kernel now corrupts a user thread silently.** That is true, and it is why §3 is part of the design rather than an extra. The gate refuses at link time, over every instruction, dependencies included. Its own failure modes are a misclassification in iced's tables, met by the host test with one encoding per class, and data in `.text`, met by refusing any undecodable byte.
2. **The scout's placement is wrong under #859.** It saved on the stack, inside `context_switch`, and popped the area after the restore. Kernel frames then overwrite those bytes, and the next save at the same depth is from the same address. XSAVEOPT or XSAVES would skip unmodified components and leave the overwritten bytes for the next restore. The scout was correct only because it used FXSAVE64. The fixed per-thread area above every frame exists to rule this out. **Negative control (build round):** move the area back to the scout's stack slot. `vector_state` must go red on metal or under KVM. TCG's XSAVEOPT does not model the modified optimisation (to be confirmed from QEMU's source in the build round), so that control is not judged under TCG.
3. **Rejected: deferred restore** (a per-CPU owner word, skipping the restore when the CPU still holds the incoming thread's state, as in A → idle → A). It saves one XRSTOR per such switch, nothing measures that as mattering, and the owner word is a new staleness hazard of exactly the kind the modified optimisation already is. Deferred save is worse: a thread woken on another CPU would need an IPI to flush its state.
4. **Rejected: `CR0.TS` to catch kernel FP at runtime.** Toggling CR0 on every entry costs more than the save it replaces, and it is a runtime check where a build-time refusal is possible.
5. **Rejected: an `asm!` wrapper that scans template text.** It misses x87 memory forms that name no register (`fld m64`), `.byte` encodings, `global_asm!` and dependencies.
6. **The cost moves to the switch.** The switch now pays the save and restore once each, but so did every switch before, at the entry and the exit. No path gains a save, and the §5 guard measures it.
7. **The stack shrinks** by at most 2.7 KiB out of 128 KiB: the T14's XSAVES area is 2432 bytes as #859 computed it, and an AVX-512 standard area is 2696. An AMX-sized area of 11 KiB is not in any declared `XCR0`. Saving at the switch is the only placement that would make AMX affordable, and it would never be paid per syscall.
8. **A future writer of a switched-out thread's area** (a debugger, a signal frame) must leave the CPU's last-restore tracking stale, or force a restore from elsewhere. The module header states that rule at the area.
9. **Removing `lock` removes a barrier.** §4 names why nothing relies on it. The build round reads every `preempt::disable`/`enable` caller for a StoreLoad dependence and reports what it found.
10. **The two arches diverge.** x86 saves at the switch and AArch64 at every entry. Each arch's `fpu.rs` owns its own model, and the AArch64 twin is filed, not silently left.

## Unsure

- Whether XSAVE-family stores are ordered before a later plain store, which matters for the cross-CPU hand-off (SDM Vol. 3A §9.2.2 lists string operations and non-temporal stores as exceptions, and XSAVE is to be checked). If it is not listed and the hand-off store is plain, an `sfence` belongs after the save.
- Whether `Ring3Entry` and `Ring0Entry` keep a reason once the bracket is gone (§2).
- Whether TCG's XSAVEOPT models the modified optimisation (§Roast 2).

## Gates

None run yet: this round builds nothing. The build round runs `cargo run -- --ci host`, `cargo run -- --build-only`, `cargo test` on every guest test the change reaches (`vector_state` included), the §3 gate's host test, the §Roast 2 negative control, and the §5 metal request.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

