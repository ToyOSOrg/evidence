**Primary sources the build rests on**, quoted from their text.

Intel® 64 and IA-32 Architectures SDM, combined volumes, order number 325462-093, fetched from `cdrdv2-public.intel.com/929349/325462-093-sdm-vol-1-2abcd-3abcd-4.pdf` and extracted with PyMuPDF. PDF page numbers are the extract's.

**The open question: are the XSAVE family's stores ordered before the later store that hands the thread to another CPU?** Yes. Vol. 3A §11.2.2, "Memory Ordering in P6 and More Recent Processor Families" (PDF pp. 3469–3470):

```text
processor systems are written from the perspective of software executing on the processor, where the term 
“processor” refers to a logical processor. For example, a physical processor supporting multiple cores and/or Intel 
Hyper-Threading Technology is treated as a multi-processor systems.):
•
Reads are not reordered with other reads.
•
Writes are not reordered with older reads.
•
Writes to memory are not reordered with other writes, with the following exceptions:
—
streaming stores (writes) executed with the non-temporal move instructions (MOVNTI, MOVNTQ, 
MOVNTDQ, MOVNTPS, and MOVNTPD); and
—
string operations (see Section 11.2.4.1).
•
No write to memory may be reordered with an execution of the CLFLUSH instruction; a write may be reordered 
with an execution of the CLFLUSHOPT instruction that flushes a cache line other than the one being written.1 
Executions of the CLFLUSH instruction are not reordered with each other. Executions of CLFLUSHOPT that 
access different cache lines may be reordered with each other. An execution of CLFLUSHOPT may be reordered 
with an execution of CLFLUSH that accesses a different cache line.
•
Reads may be reordered with older writes to different locations but not with older writes to the same location. 
•
Reads or writes cannot be reordered with I/O instructions, locked instructions, or serializing instructions.
•
Reads cannot pass earlier LFENCE and MFENCE instructions.
•
Writes and executions of CLFLUSH and CLFLUSHOPT cannot pass earlier LFENCE, SFENCE, and MFENCE 
instructions.
•
LFENCE instructions cannot pass earlier reads.
•
SFENCE instructions cannot pass earlier writes or executions of CLFLUSH and CLFLUSHOPT.
1.
Earlier versions of this manual specified that writes to memory may be reordered with executions of the CLFLUSH instruction. No 
processors implementing the CLFLUSH instruction allow such reordering.

=====PAGE 3470=====
11-8 Vol. 3A
MULTIPLE-PROCESSOR MANAGEMENT
•
```

The family is neither a non-temporal move nor a string operation. Vol. 1 §13.13, "Memory Accesses by the XSAVE Feature Set" (PDF p. 348), says which bytes an execution may access and states no ordering exception:

```text
MEMORY ACCESSES BY THE XSAVE FEATURE SET
Each instruction in the XSAVE feature set operates on a set of XSAVE-managed state components. The specific set 
of components on which an instruction operates is determined by the values of XCR0, the IA32_XSS MSR, 
EDX:EAX, and (for XRSTOR and XRSTORS) the XSAVE header.
Section 13.4 provides the details necessary to determine the location of each state component for any execution of 
an instruction in the XSAVE feature set. An execution of an instruction in the XSAVE feature set may access any 
byte of any state component on which that execution operates even when saving a state component is omitted 
because it is in its initial configuration; when restoring a state component to its initial configuration; or when XFD 
is enabled for the state components (see Section 13.14).
Section 13.5 provides details of the different XSAVE-managed state components. Some portions of some of these 
components are accessible only in 64-bit mode. Executions of XRSTOR and XRSTORS outside 64-bit mode will not 
update those portions; executions of XSAVE, XSAVEC, XSAVEOPT, and XSAVES will not modify the corresponding 
locations in memory.
1.
```

So `fpu::save`'s stores come before every later store of the saving CPU, the pass that posts the task to another CPU among them, and the build puts no fence after the save. The scheduler's own StoreLoad pairs carry their explicit `SeqCst` fences (`kernel/pure/sched/cpu.rs` `balance_fence`, `watch.rs` `gate_fence`).

**The modified optimisation** (§13.6, PDF p. 340), what the per-task area exists for:

```text
•
XMODIFIED denotes the state-component bitmap corresponding to the modified optimization. If 
XMODIFIED[i] = 0, state component i is known not to have been modified since the most recent execution of 
XRSTOR or XRSTORS; otherwise XMODIFIED[i] = 1. It is possible for XMODIFIED[i] to be 1 even when state 
component i has not been modified since the most recent execution of XRSTOR or XRSTORS. On a processor 
that does not support the modified optimization, XMODIFIED[i] is always 1 for every value of i.
A processor that implements the modified optimization saves information about the most recent execution of 
XRSTOR or XRSTORS in a quantity called XRSTOR_INFO, a 4-tuple containing the following: (1) the CPL; 
(2) whether the logical processor was in VMX non-root operation; (3) the linear address of the XSAVE area; and 
(4) the XCOMP_BV field in the XSAVE area. An execution of XSAVEOPT or XSAVES uses the modified optimization 
only if that execution corresponds to XRSTOR_INFO on these four parameters.
```

XSAVES writes no header byte but XSTATE_BV and XCOMP_BV (Vol. 2D, XSAVES, PDF p. 2900), so the area's zeroed header stays valid for every restore:

```text
XSAVES writes the logical AND of RFBM and XINUSE to the XSTATE_BV field of the XSAVE header.2 (See Section 
13.4.2, “XSAVE Header,” of the Intel® 64 and IA-32 Architectures Software Developer’s Manual, Volume 1.) 
XSAVES sets bit 63 of the XCOMP_BV field and sets bits 62:0 of that field to RFBM[62:0]. XSAVES does not 
write to any parts of the XSAVE header other than the XSTATE_BV and XCOMP_BV fields.
```

**No `lock` on the preempt count.** Vol. 3A §7.6, "Program or Task Restart" (PDF p. 3355):

```text
PROGRAM OR TASK RESTART
To allow the restarting of program or task following the handling of an exception or an interrupt, all exceptions 
(except aborts) are guaranteed to report exceptions on an instruction boundary. All interrupts are guaranteed to be 
taken on an instruction boundary.
```

**TCG does not model the modified optimisation**, so a TCG run cannot judge the stack-slot mutant. QEMU v11.1.1, `target/i386/tcg/fpu_helper.c` (fetched from `gitlab.com/qemu-project/qemu/-/raw/v11.1.1/...`), lines 2724–2736 and 2802–2811:

```c
static uint64_t get_xinuse(CPUX86State *env)
{
    uint64_t inuse = -1;

    /* For the most part, we don't track XINUSE.  We could calculate it
       here for all components, but it's probably less work to simply
       indicate in use.  That said, the state of BNDREGS is important
       enough to track in HFLAGS, so we might as well use that here.  */
    if ((env->hflags & HF_MPX_IU_MASK) == 0) {
       inuse &= ~XSTATE_BNDREGS_MASK;
    }
    return inuse;
}
...
void helper_xsave(CPUX86State *env, target_ulong ptr, uint64_t rfbm)
{
    do_xsave(env, ptr, rfbm, get_xinuse(env), rfbm, GETPC());
}

void helper_xsaveopt(CPUX86State *env, target_ulong ptr, uint64_t rfbm)
{
    uint64_t inuse = get_xinuse(env);
    do_xsave(env, ptr, rfbm, inuse, inuse, GETPC());
}
```

`helper_xsaveopt` saves every component `get_xinuse` returns, which is all of them except BNDREGS: no component is ever skipped as unmodified.
