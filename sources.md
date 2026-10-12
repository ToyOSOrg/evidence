**Sources the speed track's stages cite**, quoted verbatim. A PDF's text is extracted with PyMuPDF 1.28.0 (`page.get_text()`); each quote is a line range of the extract, and the page is the PDF's. A PDF's text drops its section headings' numbers, so a section is numbered by the document's own cross-references to it.

## Intel® 64 and IA-32 Architectures Software Developer's Manual, combined volumes, 325462-093

Fetched from `https://cdrdv2-public.intel.com/929349/325462-093-sdm-vol-1-2abcd-3abcd-4.pdf`, SHA-256 `a4a62e6a7ba11a76c7753a195b825087306812aac39b930973f9168ee599f321`.

Vol. 3A §7.6, the instruction boundary (`every-syscall-saves-…`, which #871 closed) (PDF page 3355 of the extract, lines 225147-225151):

```text
7.6 
PROGRAM OR TASK RESTART
To allow the restarting of program or task following the handling of an exception or an interrupt, all exceptions 
(except aborts) are guaranteed to report exceptions on an instruction boundary. All interrupts are guaranteed to be 
taken on an instruction boundary.
```

Vol. 3A §11.10.4, what a halted CPU costs the poster (`idle-is-hlt-…`) (PDF page 3512 of the extract, lines 234192-234207):

```text
11.10.4 MONITOR/MWAIT Instruction
Operating systems usually implement idle loops to handle thread synchronization. In a typical idle-loop scenario, 
there could be several “busy loops” and they would use a set of memory locations. An impacted processor waits in 
a loop and poll a memory location to determine if there is available work to execute. The posting of work is typically 
a write to memory (the work-queue of the waiting processor). The time for initiating a work request and getting it 
scheduled is on the order of a few bus cycles. 
From a resource sharing perspective (logical processors sharing execution resources), use of the HLT instruction in 
an OS idle loop is desirable but has implications. Executing the HLT instruction on a idle logical processor puts the 
targeted processor in a non-execution state. This requires another processor (when posting work for the halted 
logical processor) to wake up the halted processor using an inter-processor interrupt. The posting and servicing of 
such an interrupt introduces a delay in the servicing of new work requests. 
In a shared memory configuration, exits from busy loops usually occur because of a state change applicable to a 
specific memory location; such a change tends to be triggered by writes to the memory location by another agent 
(typically a processor). 
MONITOR/MWAIT complement the use of HLT and PAUSE to allow for efficient partitioning and un-partitioning of 
shared resources among logical processors sharing physical resources. MONITOR sets up an effective address 
```

Vol. 3A §11.10.5, padding to the monitor line size (`idle-is-hlt-…`) (PDF page 3513 of the extract, lines 234254-234266):

```text
11.10.5 Monitor/Mwait Address Range Determination
To use the MONITOR/MWAIT instructions, software should know the length of the region monitored by the 
MONITOR/MWAIT instructions and the size of the coherence line size for cache-snoop traffic in a multiprocessor 
system. This information can be queried using CPUID.05H). You will need the smallest and largest monitor line 
size:
•
To avoid missed wake-ups: make sure that the data structure used to monitor writes fits within the smallest 
monitor line-size. Otherwise, the processor may not wake up after a write intended to trigger an exit from 
MWAIT. 
•
To avoid false wake-ups; use the largest monitor line size to pad the data structure used to monitor writes. 
Software must make sure that beyond the data structure, no unrelated data variable exists in the triggering 
area for MWAIT. A pad may be needed to avoid this situation.
```

Vol. 3A §11.10.6.4, MONITOR/MWAIT in the C1 idle loop (`idle-is-hlt-…`) (PDF page 3516 of the extract, lines 234399-234400):

```text
11.10.6.4  Potential Usage of MONITOR/MWAIT in C1 Idle Loops
An operating system may also consider replacing HLT with MONITOR/MWAIT in its C1 idle loop. An example is 
```

Vol. 3A §13.5.4.1, TSC-deadline mode (`the-timer-is-a-lapic-count-…`) (PDF page 3587 of the extract, lines 238984-238988):

```text
13.5.4.1  TSC-Deadline Mode
The mode of operation of the local-APIC timer is determined by the LVT Timer Register. Specifically:
•
If CPUID.01H:ECX.TSC_DEADLINE[24] = 0, the mode is determined by bit 17 of the register.
•
```

Vol. 3A §13.5.4.1, continued (PDF page 3588 of the extract, lines 239027-239036):

```text
TSC-deadline mode allows software to use the local APIC timer to signal an interrupt at an absolute time. In TSC-
deadline mode, writes to the initial-count register are ignored; and current-count register always reads 0. Instead, 
timer behavior is controlled using the IA32_TSC_DEADLINE MSR.
The IA32_TSC_DEADLINE MSR (MSR address 6E0H) is a per-logical processor MSR that specifies the time at which 
a timer interrupt should occur. Writing a non-zero 64-bit value into IA32_TSC_DEADLINE arms the timer. An inter-
rupt is generated when the logical processor’s time-stamp counter equals or exceeds the target value in the 
IA32_TSC_DEADLINE MSR.1 When the timer generates an interrupt, it disarms itself and clears the 
IA32_TSC_DEADLINE MSR. Thus, each write to the IA32_TSC_DEADLINE MSR generates at most one timer inter-
rupt.
In TSC-deadline mode, writing 0 to the IA32_TSC_DEADLINE MSR disarms the local-APIC timer. Transitioning 
```

Vol. 3A §16.4, saving FP state on a switch (`every-syscall-saves-…`, which #871 closed) (PDF page 3670 of the extract, lines 244830-244845):

```text
DESIGNING OS FACILITIES FOR SAVING X87 FPU, SSE, AND EXTENDED 
STATES ON TASK OR CONTEXT SWITCHES
The x87 FPU and SSE state consist of the state of the x87 FPU, XMM, and MXCSR registers. The FXSAVE and 
FXRSTOR instructions provide a fast method for saving and restoring this state. The XSAVE feature set can also be 
used to save FP and SSE state along with other extended states (see Section 16.5).
Older operating systems may use FSAVE/FNSAVE and FRSTOR to save the x87 FPU state. These facilities can be 
extended to save and restore SSE state by substituting FXSAVE and FXRSTOR or the XSAVE feature set in place of 
FSAVE/FNSAVE and FRSTOR.
If task or context switching facilities are written from scratch, any of several approaches may be taken for using the 
FXSAVE and FXRSTOR instructions or the XSAVE feature set to save and restore x87 FPU and SSE state:
•
The operating system can require applications that are intended to be run as tasks take responsibility for saving 
the states prior to a task suspension during a task switch and for restoring the states when the task is resumed. 
This approach is appropriate for cooperative multitasking operating systems, where the application has control 
over (or is able to determine) when a task switch is about to occur and can save state prior to the task switch.

```

Vol. 3A §16.4, continued (PDF page 3671 of the extract, lines 244849-244870):

```text
•
The operating system can take the responsibility for saving the states as part of the task switch process and 
restoring the state of the registers when a suspended task is resumed. This approach is appropriate for 
preemptive multitasking operating systems, where the application cannot know when it is going to be 
preempted and cannot prepare in advance for task switching. 
•
The operating system can take the responsibility for saving the states as part of the task switch process, but 
delay the restoring of the states until an instruction operating on the states is actually executed by the new 
task. See Section 16.4.1, “Using the TS Flag to Control the Saving of the x87 FPU and SSE State,” for more 
information. This approach is called lazy restore.
The use of lazy restore mechanism in context switches is not recommended when XSAVE feature set is used to 
save/restore states for the following reasons.
—
With XSAVE feature set, Intel processors have optimizations in place to avoid saving the state components 
that are in their initial configurations or when they have not been modified since they were restored last. 
These optimizations eliminate the need for lazy restore. See section 13.5.4 in Intel® 64 and IA-32 Architec-
tures Software Developer’s Manual, Volume 1. 
—
Intel processors have power optimizations when state components are in their initial configurations. Use of 
lazy restore retains the non-initial configuration of the last thread and is not power efficient.
—
Not all extended states support lazy restore mechanisms. As such, when one or more such states are 
```

## Intel® 64 and IA-32 Architectures Optimization Reference Manual, Volume 1, 248966-051

Fetched from `https://cdrdv2.intel.com/v1/dl/getContent/671488`, the link Intel's optimization manual page gives for Volume 1, SHA-256 `284783f5f6541a60a3ec4927100d5033468e51419883832d97bd180b8704f35d`.

§11.4, MONITOR/MWAIT in the C1 loop (`idle-is-hlt-…`) (PDF page 374 of the extract, lines 22369-22375):

```text
SSE3 provides two instructions (MONITOR/MWAIT) to help multithreaded software improve synchronization 
between multiple agents. In the first implementation of MONITOR and MWAIT, these instructions are available to 
operating system so that operating system can optimize thread synchronization in different areas. For example, an 
operating system can use MONITOR and MWAIT in its system idle loop (known as C0 loop) to reduce power 
consumption. An operating system can also use MONITOR and MWAIT to implement its C1 loop to improve the 
responsiveness of the C1 loop. See Chapter 9, “Multiple-Processor Management” in the Intel® 64 and IA-32 
Architectures Software Developer’s Manual, Volume 3A.
```

§11.4.5, sharing of modified data and false sharing, and step 1 of the threshold (`per-cpu-scheduler-…`) (PDF page 379 of the extract, lines 22626-22647):

```text
11.4.5 
PREVENT SHARING OF MODIFIED DATA AND FALSE-SHARING
Depending on the cache topology relative to processor/core topology and the specific underlying microarchitecture, 
sharing of modified data can incur some degree of performance penalty when a software thread running on one core 
tries to read or write data that is currently present in modified state in the local cache of another core. This will cause 
eviction of the modified cache line back into memory and reading it into the first-level cache of the other core. The 
latency of such cache line transfer is much higher than using data in the immediate first level cache or second level 
cache.
False sharing applies to data used by one thread that happens to reside on the same cache line as different data used 
by another thread. These situations can also incur a performance delay depending on the topology of the logical 
processors/cores in the platform. 
False sharing can experience a performance penalty when the threads are running on logical processors reside on 
different physical processors or processor cores. For processors that support HT Technology, false-sharing incurs a 
performance penalty when two threads run on different cores, different physical processors, or on two logical 
processors in the physical processor package. In the first two cases, the performance penalty is due to cache evictions 
to maintain cache coherency. In the latter case, performance penalty is due to memory order machine clear 
conditions. 
A generic approach for multi-threaded software to prevent incurring false-sharing penalty is to allocate separate 
critical data or locks with alignment granularity according to a “false-sharing threshold” size. The following steps will 
allow software to determine the “false-sharing threshold” across Intel processors:
1.
If the processor supports CLFLUSH instruction, i.e. CPUID.01H:EDX.CLFLUSH[bit 19] =1:
```

§11.4.5, step 1, continued across the page and past Example 11-5 (PDF page 380 of the extract, lines 22672-22672):

```text
— Use the CLFLUSH line size, i.e. the integer value of CPUID.01H:EBX[15:8], as the “false-sharing threshold”.
```

§11.4.5, User/Source Coding Rule 17 (PDF page 380 of the extract, lines 22684-22688):

```text
User/Source Coding Rule 17. (H impact, M generality) Beware of false sharing within a cache line or within a sector. 
Allocate critical data or locks separately using alignment granularity not smaller than the “false-sharing threshold”. 
When a common block of parameters is passed from a parent thread to several worker threads, it is desirable for each 
work thread to create a private copy (each copy aligned to multiples of the “false-sharing threshold”) of frequently 
accessed data in the parameter block.
```

## AMD64 Architecture Programmer's Manual, Volume 2, 24593 rev. 3.42

Fetched through the Internet Archive's snapshot `https://web.archive.org/web/20250405225925id_/https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/programmer-references/24593.pdf` (amd.com reset the connection), SHA-256 `0829b862bf93e0d455b1d418664dc6ab3f494e866af53b2a04dff0f0b48eb649`. Its text was searched for an idle loop, TSC-deadline mode and false sharing, and says nothing on any of them.

§2.5.12, FXSAVE and FXRSTOR (`every-syscall-saves-…`, which #871 closed) (PDF page 97 of the extract, lines 4885-4888):

```text
2.5.12  FXSAVE and FXRSTOR Instructions
The FXSAVE and FXRSTOR instructions are used to save and restore the entire 128-bit media 
(XMM), 64-bit media, and x87 instruction-set environment during a context switch. The AMD64 
architecture modifies the memory format used by these instructions in order to save and restore the full 
```

CR4.FSGSBASE (`fsgsbase-is-taken`) (PDF page 111 of the extract, lines 5718-5723):

```text
FSGSBASE.  Bit 16. System software must set this bit to 1 to enable the execution of the 
RDFSBASE, RDGSBASE, WRFSBASE, and WRGSBASE instructions when supported. When 
enabled, these instructions allow software running in 64-bit mode at any privilege level to read and 
write the FS.base and GS.base hidden segment register state. See the discussion of segment registers in 
64-bit mode in Section 4.5.3 “Segment Registers in 64-Bit Mode,” on page 80. Also see descriptions 
of the RDFSBASE, RDGSBASE, WRFSBASE, and WRGSBASE instructions in Volume 3. 
```

## AMD64 Architecture Programmer's Manual, Volume 3, 24594 rev. 3.36

Fetched through the Internet Archive's snapshot `https://web.archive.org/web/20250405225955id_/https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/programmer-references/24594.pdf` (amd.com reset the connection again), SHA-256 `4d8eff047a237895dfa4433111511088a80b40dde9e2012f9b652113ee58a00e`. Its text was searched for an idle loop and false sharing, and says nothing on either.

MONITOR (`idle-is-hlt-…`) (PDF page 456 of the extract, lines 28169-28176):

```text
Establishes a linear address range of memory for hardware to monitor and puts the processor in the
monitor event pending state. When in the monitor event pending state, the monitoring hardware
detects stores to the specified linear address range and causes the processor to exit the monitor event
pending state. The MWAIT instruction uses the state of the monitor hardware.
The address range should be a write-back memory type. Executing MONITOR on an address range for
a non-write-back memory type is not guaranteed to cause the processor to enter the monitor event
pending state. The size of the linear address range that is established by the MONITOR instruction can
be determined by CPUID function 0000_0005h.
```

MWAIT (`idle-is-hlt-…`) (PDF page 462 of the extract, lines 28464-28472):

```text
Used in conjunction with the MONITOR instruction to cause a processor to wait until a store occurs to
a specific linear address range from another processor. The previously executed MONITOR
instruction causes the processor to enter the monitor event pending state. The MWAIT instruction may
enter an implementation dependent power state until the monitor event pending state is exited. The
MWAIT instruction has the same effect on architectural state as the NOP instruction.
Events that cause an exit from the monitor event pending state include:
•
A store from another processor matches the address range established by the MONITOR
instruction.
```

§E.3.2, the heading (`the-timer-is-a-lapic-count-…`) (PDF page 643 of the extract, lines 44866-44866):

```text
E.3.2 Function 1h—Processor and Processor Feature Identifiers
```

§E.3.2, CPUID Fn0000_0001_ECX, its first rows (PDF page 644 of the extract, lines 44956-44961):

```text
CPUID Fn0000_0001_ECX Feature Identifiers
Bits Field Name
Description
31
—
RAZ. Reserved for use by hypervisor to indicate guest status.
```

§E.3.2, CPUID Fn0000_0001_ECX, bit 24 on the next page (the extract puts the EDX intro line above it) (PDF page 645 of the extract, lines 44985-44996):

```text
=====PAGE 645=====
Obtaining Processor Information Via the CPUID Instruction
603
24594—Rev. 3.36—March 2024
AMD64 Technology
The value returned in EDX contains the following miscellaneous feature identifiers:
24
—
Reserved
23
POPCNT
POPCNT instruction. See “POPCNT” in APM Volume 3. 
```

RDFSBASE, RDGSBASE (`fsgsbase-is-taken`) (PDF page 338 of the extract, lines 20915-20920):

```text
Copies the base field of the FS or GS segment descriptor to the specified register. When supported and
enabled, these instructions can be executed at any processor privilege level. The RDFSBASE and
RDGSBASE instructions are only defined in 64-bit mode.
System software must set the FSGSBASE bit (bit 16) of CR4 to enable the RDFSBASE and
RDGSBASE instructions.
Support for this instruction is indicated by CPUID Fn0000_0007_EBX_x0[FSGSBASE] = 1.
```

WRFSBASE, WRGSBASE (`fsgsbase-is-taken`) (PDF page 399 of the extract, lines 24934-24940):

```text
Writes the base field of the FS or GS segment descriptor with the value contained in the register
operand. When supported and enabled, these instructions can be executed at any processor privilege
level. Instructions are only defined in 64-bit mode. The address written to the base field must be in
canonical form or a #GP fault will occur.
System software must set the FSGSBASE bit (bit 16) of CR4 to enable the WRFSBASE and
WRGSBASE instructions.
Support for this instruction is indicated by CPUID Fn0000_0007_EBX_x0[FSGSBASE] = 1.
```

CLFLUSH, the line size by CPUID (`per-cpu-scheduler-…`) (PDF page 186 of the extract, lines 11662-11663):

```text
The CLFLUSH instruction is supported if the feature flag CPUID Fn0000_0001_EDX[CLFSH] is set.
The 8-bit field CPUID Fn 0000_0001_EBX[CLFlush] returns the size of the cacheline in quadwords.
```

## AMD, Software Optimization Guide for AMD EPYC™ 7002 Processors, 56305 rev. 3.02

Fetched through the Internet Archive's snapshot `https://web.archive.org/web/20221127101035id_/https://www.amd.com/system/files/TechDocs/56305.zip`, SHA-256 `70ad6f1437f34bf17d6202e1b2f6189b8540f408c941e5a4117a94552cdda0f0`; its `56305-3.02.pdf`, SHA-256 `392ffc9262d0d8e7315bdc82eca57483f4db3619ce71137a414c9f474ddc89fb`. Its text was searched for MONITOR, MWAIT, an idle loop and false sharing, and says nothing on any of them.

The title page (PDF page 1 of the extract, lines 2-12):

```text
=====PAGE 1=====
Advanced Micro Devices 
Software Optimization 
Guide for AMD EPYC™ 
7002 Processors
Publication No.
Revision
Date
56305
3.02
March 2020
```

Chapter 2, the processors it covers (the AMD bench is family 17h model 60h) (PDF page 11 of the extract, lines 254-258):

```text
=====PAGE 11=====
Chapter 2
Microarchitecture of AMD Family 17h Models 30h and Greater Processors
17
Software Optimization Guide for AMD EPYC™ 
```

§2.6.1, the line size (`per-cpu-scheduler-…`) (PDF page 17 of the extract, lines 632-635):

```text
2.6.1
L1 Instruction Cache
The processor contains a 32-Kbyte, 8-way set associative L1 instruction cache. Cache line size is 64 
bytes; 32 bytes are fetched in a cycle. Functions associated with the L1 instruction cache are fetching 
```

§2.6.2, its heading (PDF page 17 of the extract, lines 646-647):

```text
2.6.2
L1 Data Cache
```

§2.6.2, the data cache's 64-byte boundary (PDF page 17 of the extract, lines 654-656):

```text
The data cache natural alignment boundary is 64 bytes for loads. A misaligned load operation suffers, 
at minimum, a one cycle penalty in the load-store pipeline if it spans a 64-byte boundary. Stores have 
two different alignment boundaries. The alignment boundary for accessing TLB and tags is 64 bytes, 
```

## Intel, Guidance for Enabling FSGSBASE, ID 767615, updated 9/15/2019

Fetched from `https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/best-practices/guidance-enabling-fsgsbase.html`, tags stripped. Lines of the stripped text:

```text
 Intel is continually adding new processor features. Some require virtually no additional system software support or are entirely transparent to software; others have touch points across the software stack. FSGSBASE is one feature that falls into the latter category. 
 FSGSBASE is an Intel® architecture extension that allows applications to directly write to the  FS  and  GS  segment registers. This allows fast switching to different threads in user applications, as well as providing an additional address register for application use. In addition it allows the kernel to do more efficient context switching. 
 FSGSBASE is a processor feature, introduced in 3rd Generation Intel® Core™ processors based on the Ivy Bridge microarchitecture, which allows expanded direct access from user level software to the  FS  and  GS  base registers. Previously, applications had to access these registers via system calls, which can be much slower than direct access. Enabling direct access also effectively grows the set of registers available to applications, improving performance. 
 The legacy Linux kernel has assumptions for the  FS / GS  base register. The base address corresponds to the selector, and the range of the GS base address is different between privilege modes. To enable FSGSBASE, the Linux kernel has to deprecate  FS / GS  base across the board. Context switching, ring transition, and process trace system calls are the affected elements. In context switching and process trace system calls, the kernel needs to manage the  FS / GS  base entirely separate from its selector. The ring transition code has to be insensitive to the  GS  base address. Linux kernel 5.9 and later versions contain these changes and support FSGSBASE. 
 Given the purpose of this bit,  Intel recommends that it be used with caution and never in production environments unless accompanied by a complete OS implementation. Incomplete implementations, such as those listed above, can be exploited to gain privilege escalation. 
```

## Linux v5.9, its FSGSBASE implementation (`fsgsbase-is-taken`)

Each file fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/<path>?h=v5.9`.

`arch/x86/kernel/cpu/common.c`, SHA-256 `db77ac5712f33c457a0966f700de450ab4b22b1b8e3cfbe09e90ea6ff4417826`, enabling it on every CPU that enumerates it (lines 1515-1519):

```text
	/* Enable FSGSBASE instructions if available. */
	if (cpu_has(c, X86_FEATURE_FSGSBASE)) {
		cr4_set_bits(X86_CR4_FSGSBASE);
		elf_hwcap2 |= HWCAP2_FSGSBASE;
	}
```

`arch/x86/kernel/process_64.c`, SHA-256 `b9fdf09491187f8bc0eca867e250ad3c860f20018add907d7acebcf67211ea80`, the switch saving each thread's bases (lines 248-264):

```text
static __always_inline void save_fsgs(struct task_struct *task)
{
	savesegment(fs, task->thread.fsindex);
	savesegment(gs, task->thread.gsindex);
	if (static_cpu_has(X86_FEATURE_FSGSBASE)) {
		/*
		 * If FSGSBASE is enabled, we can't make any useful guesses
		 * about the base, and user code expects us to save the current
		 * value.  Fortunately, reading the base directly is efficient.
		 */
		task->thread.fsbase = rdfsbase();
		task->thread.gsbase = __rdgsbase_inactive();
	} else {
		save_base_legacy(task, task->thread.fsindex, FS);
		save_base_legacy(task, task->thread.gsindex, GS);
	}
}
```

`arch/x86/entry/entry_64.S`, SHA-256 `d73e2f1bdc7d5c8fbd23fdf3c3b26e159433c395f32463d296d08550a8678f5f`, the paranoid entry (lines 823-848):

```text
	 * Switching CR3 does not depend on kernel GSBASE so it can
	 * be done before switching to the kernel GSBASE. This is
	 * required for FSGSBASE because the kernel GSBASE has to
	 * be retrieved from a kernel internal table.
	 */
	SAVE_AND_SWITCH_TO_KERNEL_CR3 scratch_reg=%rax save_reg=%r14

	/*
	 * Handling GSBASE depends on the availability of FSGSBASE.
	 *
	 * Without FSGSBASE the kernel enforces that negative GSBASE
	 * values indicate kernel GSBASE. With FSGSBASE no assumptions
	 * can be made about the GSBASE value when entering from user
	 * space.
	 */
	ALTERNATIVE "jmp .Lparanoid_entry_checkgs", "", X86_FEATURE_FSGSBASE

	/*
	 * Read the current GSBASE and store it in %rbx unconditionally,
	 * retrieve and set the current CPUs kernel GSBASE. The stored value
	 * has to be restored in paranoid_exit unconditionally.
	 *
	 * The MSR write ensures that no subsequent load is based on a
	 * mispredicted GSBASE. No extra FENCE required.
	 */
	SAVE_AND_SET_GSBASE scratch_reg=%rax save_reg=%rbx
```

## Lozi et al., "The Linux Scheduler: a Decade of Wasted Cores", EuroSys '16, doi 10.1145/2901318.2901326

Fetched from `https://people.ece.ubc.ca/sasha/papers/eurosys16-final29.pdf`, SHA-256 `c0d99ee07a3ec791e0e75b60a2834a6f46afb41c0959230aae4110d5321f9515`.

Venue (PDF page 1 of the extract, lines 56-61):

```text
EuroSys ’16,
April 18 - 21, 2016, London, United Kingdom
Copyright c
⃝2016 held by owner/author(s). Publication rights licensed to ACM.
ACM 978-1-4503-4240-7/16/04...$15.00
DOI: http://dx.doi.org/10.1145/2901318.2901326
```

§3.3, the Overload-on-Wakeup bug (`a-wake-to-a-busy-cpu-…`) (PDF page 7 of the extract, lines 739-753):

```text
3.3
The Overload-on-Wakeup bug
The bug.
The gist of this bug is that a thread that was
asleep may wake up on an overloaded core while other
cores in the system are idle. The bug was introduced by an
optimization in the wakeup code (select task rq fair
function). When a thread goes to sleep on Node X and
the thread that wakes it up later is running on that same
node, the scheduler only considers the cores of Node X for
scheduling the awakened thread. If all cores of Node X are
busy, the thread will wake up on an already busy core and
miss opportunities to use idle cores on other nodes. This
can lead to a signiﬁcant under-utilization of the machine,
especially on workloads where threads frequently wait.
```

§3.3, its fix (PDF page 8 of the extract, lines 835-851):

```text
The ﬁx.
To ﬁx this bug, we alter the code that is executed
when a thread wakes up. We wake up the thread on the local
core—i.e., the core where the thread was scheduled last—
if it is idle; otherwise, if there are idle cores in the system,
we wake up the thread on the core that has been idle for
the longest amount of time. If there are no idle cores, we
fall back to the original algorithm to ﬁnd the core where the
thread will wake up.
Waking up the thread on a long-term idle core may have
implications for power consumption. Cores that have been
idle for a long time usually go into a low-power mode. Wak-
ing up a thread on that core will force the core to exit that
mode and run at full power. For that reason, we only en-
force the new wakeup strategy if the system’s power man-
agement policy does not allow cores to enter low-power
states at all. Furthermore, our ﬁx only matters for workloads
```

## NVM Express® Base Specification, Revision 2.1

Fetched from `https://nvmexpress.org/wp-content/uploads/NVM-Express-Base-Specification-Revision-2.1-2024.08.05-Ratified.pdf`, SHA-256 `4e31f826dd7ceaee311f93b74eef5c05ac32afe4ef45436534dfcfd6a40dc746`.

§5.1.25.1.6, the APST feature (`diskserver-drives-nvme-apst`) (PDF page 400 of the extract, lines 30034-30037):

```text
5.1.25.1.6 
Autonomous Power State Transition (Feature Identifier 0Ch) 
This Feature configures the settings for autonomous controller power state transitions, refer to section 
8.1.17.2. 
```

§5.1.25.1.6, Figure 393, an entry of its table (PDF page 401 of the extract, lines 30065-30080):

```text
Figure 393: Autonomous Power State Transition – Data Structure Entry 
Bits 
Description 
63:32 
Reserved 
31:08 
Idle Time Prior to Transition (ITPT): This field specifies the amount of idle time that occurs in this power 
state prior to transitioning to the Idle Transition Power State. The time is specified in milliseconds. A 
value of 0h disables the autonomous power state transition feature for this power state.  
07:03 
Idle Transition Power State (ITPS): This field specifies the power state to which the controller 
autonomously transitions, after there is a continuous period of idle time in the current power state that 
exceeds the time specified in the Idle Time Prior to Transition (ITPT) field. If the ITPT field is set to a 
non-zero value, then the state specified in this field shall be a non-operational state as described in 
Figure 313. This field should not specify a power state with higher reported idle power than the current 
power state. If the ITPT field is cleared to 0h, then this field should be cleared to 0h. 
```

§8.1.17, a transition's latency (numbered by the cross-reference on line 26429) (PDF page 557 of the extract, lines 40132-40138):

```text
The host may dynamically modify the power state using the Set Features command and determine the 
current power state using the Get Features command. The host may directly transition between any two 
supported power states. The Entry Latency (ENLAT) field in the Power State Descriptor data structure 
indicates the maximum amount of time in microseconds to enter that power state and the Exit Latency 
(EXLAT) field indicates the maximum amount of time in microseconds to exit that state. 
The maximum amount of time to transition between any two power states is equal to the sum of the old 
state’s exit latency and the new state’s entry latency. The host is not required to wait for a previously 
```

§8.1.17.2, autonomous power state transitions (numbered by the cross-reference on lines 30036-30037) (PDF page 558 of the extract, lines 40204-40219):

```text
 Autonomous Power State Transitions 
The controller may support autonomous power state transitions, as indicated in the Identify Controller data 
structure in Figure 312. Autonomous power state transitions provide a mechanism for the host to configure 
the controller to automatically transition between power states on certain conditions without software 
intervention. 
The entry condition to transition to the Idle Transition Power State is that the controller has been in idle for 
a continuous period of time exceeding the Idle Time Prior to Transition time specified. The controller is idle 
when there are no commands outstanding to any I/O Submission Queue. If a controller has an operation in 
process (e.g., device self-test operation) that would cause controller power to exceed that advertised for 
the proposed non-operational power state, then the controller should not autonomously transition to that 
state. 
The power state to transition to shall be a non-operational power state (a non-operational power state may 
autonomously transition to another non-operational power state). If an operational power state is specified 
by a Set Features command specifying the Autonomous Power State Transitions feature (i.e., the Feature 
Identifier field set to 0Ch (refer to section 5.1.25.1.6), then the controller should abort the command with a 
status code of Invalid Field in Command. Refer to section 8.1.17.1 for more details. 
```

## Linux commits

Each commit fetched as `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/patch/?id=<hash>`, which kernel.org redirects to the full hash. The release that first carries it is read by fetching a file it touches at the tag before and at that tag.

### 279f1461432c, the one-shot through `IA32_TSC_DEADLINE` (`the-timer-is-a-lapic-count-…`)

SHA-256 of the patch `239bc4d695e8d58b7224c6d50eb8986b23ff621c1880e4f351c596ef1460a842`.

Header and message (lines 1-25 of the patch):

```text
From 279f1461432ccdec0b98c0bcbe0a8e2c0f6fdda5 Mon Sep 17 00:00:00 2001
From: Suresh Siddha <suresh.b.siddha@intel.com>
Date: Mon, 22 Oct 2012 14:37:58 -0700
Subject: x86: apic: Use tsc deadline for oneshot when available

If the TSC deadline mode is supported, LAPIC timer one-shot mode can be
implemented using IA32_TSC_DEADLINE MSR. An interrupt will be generated
when the TSC value equals or exceeds the value in the IA32_TSC_DEADLINE
MSR.

This enables us to skip the APIC calibration during boot. Also, in
xapic mode, this enables us to skip the uncached apic access to re-arm
the APIC timer.

As this timer ticks at the high frequency TSC rate, we use the
TSC_DIVISOR (32) to work with the 32-bit restrictions in the
clockevent API's to avoid 64-bit divides etc (frequency is u32 and
"unsigned long" in the set_next_event(), max_delta limits the next
event to 32-bit for 32-bit kernel).

Signed-off-by: Suresh Siddha <suresh.b.siddha@intel.com>
Cc: venki@google.com
Cc: len.brown@intel.com
Link: http://lkml.kernel.org/r/1350941878.6017.31.camel@sbsiddha-desk.sc.intel.com
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
```

`arch/x86/kernel/apic/apic.c` at `v3.7`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/arch/x86/kernel/apic/apic.c?h=v3.7`, SHA-256 `e49c0e3b79e1b280e5175e44b030c6c0950dd2894ee0405cf69d4e90b28071ab`: `TSC_DEADLINE` matches 0 of its lines.

`arch/x86/kernel/apic/apic.c` at `v3.8`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/arch/x86/kernel/apic/apic.c?h=v3.8`, SHA-256 `20ec8038599e566d1aa0490f414eab852ec84ca05f1009b3b6b354b92172029b`, the deadline write (lines 469-476):

```c
static int lapic_next_deadline(unsigned long delta,
			       struct clock_event_device *evt)
{
	u64 tsc;

	rdtscll(tsc);
	wrmsrl(MSR_IA32_TSC_DEADLINE, tsc + (((u64) delta) * TSC_DIVISOR));
	return 0;
```

`arch/x86/kernel/apic/apic.c` at `v3.8`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/arch/x86/kernel/apic/apic.c?h=v3.8`, SHA-256 `20ec8038599e566d1aa0490f414eab852ec84ca05f1009b3b6b354b92172029b`, registered on every CPU that enumerates the mode (lines 559-567):

```c
	if (this_cpu_has(X86_FEATURE_TSC_DEADLINE_TIMER)) {
		levt->features &= ~(CLOCK_EVT_FEAT_PERIODIC |
				    CLOCK_EVT_FEAT_DUMMY);
		levt->set_next_event = lapic_next_deadline;
		clockevents_config_and_register(levt,
						(tsc_khz / TSC_DIVISOR) * 1000,
						0xF, ~0UL);
	} else
		clockevents_register_device(levt);
```

`arch/x86/kernel/apic/apic.c` at `v3.8`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/arch/x86/kernel/apic/apic.c?h=v3.8`, SHA-256 `20ec8038599e566d1aa0490f414eab852ec84ca05f1009b3b6b354b92172029b`, no calibration where the mode is (lines 695-697):

```c
	if (boot_cpu_has(X86_FEATURE_TSC_DEADLINE_TIMER)) {
		return 0;
	} else if (lapic_timer_frequency) {
```

`arch/x86/kernel/apic/apic.c` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/arch/x86/kernel/apic/apic.c?h=v7.2`, SHA-256 `e187313fbae0c6941331be18e51ac6fb3f2b5e33bc11caf84f6b621b7c215a40`, its errata table, `deadline_match`, today (lines 513-542):

```c
static const struct x86_cpu_id deadline_match[] __initconst = {
	X86_MATCH_VFM_STEPS(INTEL_HASWELL_X,   0x2, 0x2, 0x3a), /* EP */
	X86_MATCH_VFM_STEPS(INTEL_HASWELL_X,   0x4, 0x4, 0x0f), /* EX */

	X86_MATCH_VFM(INTEL_BROADWELL_X,	0x0b000020),

	X86_MATCH_VFM_STEPS(INTEL_BROADWELL_D, 0x2, 0x2, 0x00000011),
	X86_MATCH_VFM_STEPS(INTEL_BROADWELL_D, 0x3, 0x3, 0x0700000e),
	X86_MATCH_VFM_STEPS(INTEL_BROADWELL_D, 0x4, 0x4, 0x0f00000c),
	X86_MATCH_VFM_STEPS(INTEL_BROADWELL_D, 0x5, 0x5, 0x0e000003),

	X86_MATCH_VFM_STEPS(INTEL_SKYLAKE_X,   0x3, 0x3, 0x01000136),
	X86_MATCH_VFM_STEPS(INTEL_SKYLAKE_X,   0x4, 0x4, 0x02000014),
	X86_MATCH_VFM_STEPS(INTEL_SKYLAKE_X,   0x5, 0xf, 0),

	X86_MATCH_VFM(INTEL_HASWELL,		0x22),
	X86_MATCH_VFM(INTEL_HASWELL_L,		0x20),
	X86_MATCH_VFM(INTEL_HASWELL_G,		0x17),

	X86_MATCH_VFM(INTEL_BROADWELL,		0x25),
	X86_MATCH_VFM(INTEL_BROADWELL_G,	0x17),

	X86_MATCH_VFM(INTEL_SKYLAKE_L,		0xb2),
	X86_MATCH_VFM(INTEL_SKYLAKE,		0xb2),

	X86_MATCH_VFM(INTEL_KABYLAKE_L,		0x52),
	X86_MATCH_VFM(INTEL_KABYLAKE,		0x52),

	{},
};
```

`arch/x86/kernel/apic/apic.c` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/arch/x86/kernel/apic/apic.c?h=v7.2`, SHA-256 `e187313fbae0c6941331be18e51ac6fb3f2b5e33bc11caf84f6b621b7c215a40`, `setup_APIC_timer` today (lines 580-605):

```c
static void setup_APIC_timer(void)
{
	struct clock_event_device *levt = this_cpu_ptr(&lapic_events);

	if (this_cpu_has(X86_FEATURE_ARAT)) {
		lapic_clockevent.features &= ~CLOCK_EVT_FEAT_C3STOP;
		/* Make LAPIC timer preferable over percpu HPET */
		lapic_clockevent.rating = 150;
	}

	memcpy(levt, &lapic_clockevent, sizeof(*levt));
	levt->cpumask = cpumask_of(smp_processor_id());

	if (this_cpu_has(X86_FEATURE_TSC_DEADLINE_TIMER)) {
		levt->name = "lapic-deadline";
		levt->features &= ~(CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_DUMMY);
		levt->features |= CLOCK_EVT_FEAT_CLOCKSOURCE_COUPLED;
		levt->cs_id = CSID_X86_TSC;
		levt->set_next_event = lapic_next_deadline;
		clockevents_config_and_register(levt, tsc_khz * (1000 / TSC_DIVISOR), 0xF, ~0UL);
	} else {
		clockevents_register_device(levt);
	}

	apic_update_vector(smp_processor_id(), LOCAL_TIMER_VECTOR, true);
}
```

`arch/x86/kernel/apic/apic.c` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/arch/x86/kernel/apic/apic.c?h=v7.2`, SHA-256 `e187313fbae0c6941331be18e51ac6fb3f2b5e33bc11caf84f6b621b7c215a40`, `calibrate_APIC_clock` today (lines 799-810):

```c
static int __init calibrate_APIC_clock(void)
{
	struct clock_event_device *levt = this_cpu_ptr(&lapic_events);
	u64 tsc_perj = 0, tsc_start = 0;
	long delta_tsc_khz, bus_khz;
	unsigned long jif_start;
	unsigned long deltaj;
	long delta, deltatsc;
	int pm_referenced = 0;

	if (boot_cpu_has(X86_FEATURE_TSC_DEADLINE_TIMER))
		return 0;
```

The T14 is family 6 model 140, 0x8C (`kernel/cpuvuln/fixtures/t14/cpuinfo.txt:2-4` in ToyOS), and no `deadline_match` row names it.

`arch/x86/include/asm/intel-family.h` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/arch/x86/include/asm/intel-family.h?h=v7.2`, SHA-256 `894e851bf5fdc55c5dbf5a6270fb1b095c74798d4100db440b328a20f53fd184`, model 0x8C (lines 120-120):

```c
#define INTEL_TIGERLAKE_L		IFM(6, 0x8C) /* Willow Cove */
```

### f246ec3478cf, TSC-coupled programming (`the-timer-is-a-lapic-count-…`)

SHA-256 of the patch `42f7af783e0301844fe016ea3827f2bc102efa5e7e781b58e9ee53673bd144d4`.

Header and message (lines 1-23 of the patch):

```text
From f246ec3478cfdab830ee0815209f48923e7ee5e2 Mon Sep 17 00:00:00 2001
From: Thomas Gleixner <tglx@kernel.org>
Date: Tue, 24 Feb 2026 17:36:49 +0100
Subject: x86/apic: Enable TSC coupled programming mode

The TSC deadline timer is directly coupled to the TSC and setting the next
deadline is tedious as the clockevents core code converts the
CLOCK_MONOTONIC based absolute expiry time to a relative expiry by reading
the current time from the TSC. It converts that delta to cycles and hands
the result to lapic_next_deadline(), which then has read to the TSC and add
the delta to program the timer.

The core code now supports coupled clock event devices and can provide the
expiry time in TSC cycles directly without reading the TSC at all.

This obviouly works only when the TSC is the current clocksource, but
that's the default for all modern CPUs which implement the TSC deadline
timer. If the TSC is not the current clocksource (e.g. early boot) then the
core code falls back to the relative set_next_event() callback as before.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260224163430.076565985@kernel.org
```

`arch/x86/kernel/apic/apic.c` at `v7.0`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/arch/x86/kernel/apic/apic.c?h=v7.0`, SHA-256 `2093f0e0e7bd056a54e68959d33fd4a6a54481523ec1ea3f8530e0649ae62c9b`: `CLOCKSOURCE_COUPLED` matches 0 of its lines.

`arch/x86/kernel/apic/apic.c` at `v7.1`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/arch/x86/kernel/apic/apic.c?h=v7.1`, SHA-256 `a4fbffbc322c38c4f89cbcb1f2b124a3e6a2b444b9f0db9f50ea69933772ebea`, the deadline device, coupled (lines 592-599):

```c
	if (this_cpu_has(X86_FEATURE_TSC_DEADLINE_TIMER)) {
		levt->name = "lapic-deadline";
		levt->features &= ~(CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_DUMMY);
		levt->features |= CLOCK_EVT_FEAT_CLOCKSOURCE_COUPLED;
		levt->cs_id = CSID_X86_TSC;
		levt->set_next_event = lapic_next_deadline;
		clockevents_config_and_register(levt, tsc_khz * (1000 / TSC_DIVISOR), 0xF, ~0UL);
	} else {
```

`arch/x86/include/asm/clock_inlined.h` at `v7.1`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/arch/x86/include/asm/clock_inlined.h?h=v7.1`, SHA-256 `7bf4bd9213c5a4c33c64f81d79819f15cc0c96e716a3758a5bc5b06333bc968b`, the absolute write (lines 14-20):

```c
struct clock_event_device;

static __always_inline void
arch_inlined_clockevent_set_next_coupled(u64 cycles, struct clock_event_device *evt)
{
	native_wrmsrq(MSR_IA32_TSC_DEADLINE, cycles);
}
```

### 147f3efaa241, EEVDF, and wakeup preemption since CFS (`a-wake-to-a-busy-cpu-…`)

SHA-256 of the patch `7fae396127a776d551c700615f58628d060d33f2f86b1c369729ae4b1a49976e`.

Header and message (lines 1-34 of the patch):

```text
From 147f3efaa24182a21706bca15eab2f3f4630b5fe Mon Sep 17 00:00:00 2001
From: Peter Zijlstra <peterz@infradead.org>
Date: Wed, 31 May 2023 13:58:44 +0200
Subject: sched/fair: Implement an EEVDF-like scheduling policy

Where CFS is currently a WFQ based scheduler with only a single knob,
the weight. The addition of a second, latency oriented parameter,
makes something like WF2Q or EEVDF based a much better fit.

Specifically, EEVDF does EDF like scheduling in the left half of the
tree -- those entities that are owed service. Except because this is a
virtual time scheduler, the deadlines are in virtual time as well,
which is what allows over-subscription.

EEVDF has two parameters:

 - weight, or time-slope: which is mapped to nice just as before

 - request size, or slice length: which is used to compute
   the virtual deadline as: vd_i = ve_i + r_i/w_i

Basically, by setting a smaller slice, the deadline will be earlier
and the task will be more eligible and ran earlier.

Tick driven preemption is driven by request/slice completion; while
wakeup preemption is driven by the deadline.

Because the tree is now effectively an interval tree, and the
selection is no longer 'leftmost', over-scheduling is less of a
problem.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://lore.kernel.org/r/20230531124603.931005524@infradead.org
```

The wakeup-preemption hunk (lines 577-593 of the patch):

```text
@@ -8228,7 +8460,19 @@ static void check_preempt_wakeup(struct rq *rq, struct task_struct *p, int wake_
 	if (cse_is_idle != pse_is_idle)
 		return;
 
-	update_curr(cfs_rq_of(se));
+	cfs_rq = cfs_rq_of(se);
+	update_curr(cfs_rq);
+
+	if (sched_feat(EEVDF)) {
+		/*
+		 * XXX pick_eevdf(cfs_rq) != se ?
+		 */
+		if (pick_eevdf(cfs_rq) == pse)
+			goto preempt;
+
+		return;
+	}
```

`kernel/sched/fair.c` at `v6.5`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/kernel/sched/fair.c?h=v6.5`, SHA-256 `c3b7ee0a0bc51b9f5c39c25c97490b5c5b220b5e456a7c5eeb678463d2886188`: `eevdf` matches 0 of its lines.

`kernel/sched/fair.c` at `v6.6`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/kernel/sched/fair.c?h=v6.6`, SHA-256 `7d259d533ffb439992969e5d1d20b27dc64c9203f5c09e09f839047cbd4e40bb`, wakeup preemption by the EEVDF pick (lines 8117-8132):

```c
	if (cse_is_idle != pse_is_idle)
		return;

	cfs_rq = cfs_rq_of(se);
	update_curr(cfs_rq);

	/*
	 * XXX pick_eevdf(cfs_rq) != se ?
	 */
	if (pick_eevdf(cfs_rq) == pse)
		goto preempt;

	return;

preempt:
	resched_curr(rq);
```

`kernel/sched_fair.c` at `v2.6.23`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/kernel/sched_fair.c?h=v2.6.23`, SHA-256 `9572c1797db2ee5e7a87e5700030cf46c0f11fbde28407f0fb3d76d5816903a0`, CFS's first release: the running task preempted for a woken one (lines 976-1001):

```c
/*
 * Preempt the current task with a newly woken task if needed:
 */
static void check_preempt_curr_fair(struct rq *rq, struct task_struct *p)
{
	struct task_struct *curr = rq->curr;
	struct cfs_rq *cfs_rq = task_cfs_rq(curr);
	unsigned long gran;

	if (unlikely(rt_prio(p->prio))) {
		update_rq_clock(rq);
		update_curr(cfs_rq);
		resched_task(curr);
		return;
	}

	gran = sysctl_sched_wakeup_granularity;
	/*
	 * Batch tasks prefer throughput over latency:
	 */
	if (unlikely(p->policy == SCHED_BATCH))
		gran = sysctl_sched_batch_wakeup_granularity;

	if (is_same_group(curr, p))
		__check_preempt_curr_fair(cfs_rq, &p->se, &curr->se, gran);
}
```

### 63304558ba5d, EEVDF's curb on wakeup preemption, `RUN_TO_PARITY` (`a-wake-to-a-busy-cpu-…`)

SHA-256 of the patch `9d76759c2fb670c7cdd3d906c66d3c79138e6066e1c403087b0967e2ed04efcb`.

Header and message (lines 1-41 of the patch):

```text
From 63304558ba5dcaaff9e052ee43cfdcc7f9c29e85 Mon Sep 17 00:00:00 2001
From: Peter Zijlstra <peterz@infradead.org>
Date: Wed, 16 Aug 2023 15:40:59 +0200
Subject: sched/eevdf: Curb wakeup-preemption

Mike and others noticed that EEVDF does like to over-schedule quite a
bit -- which does hurt performance of a number of benchmarks /
workloads.

In particular, what seems to cause over-scheduling is that when lag is
of the same order (or larger) than the request / slice then placement
will not only cause the task to be placed left of current, but also
with a smaller deadline than current, which causes immediate
preemption.

[ notably, lag bounds are relative to HZ ]

Mike suggested we stick to picking 'current' for as long as it's
eligible to run, giving it uninterrupted runtime until it reaches
parity with the pack.

Augment Mike's suggestion by only allowing it to exhaust it's initial
request.

One random data point:

echo NO_RUN_TO_PARITY > /debug/sched/features
perf stat -a -e context-switches --repeat 10 -- perf bench sched messaging -g 20 -t -l 5000

	3,723,554        context-switches      ( +-  0.56% )
	9.5136 +- 0.0394 seconds time elapsed  ( +-  0.41% )

echo RUN_TO_PARITY > /debug/sched/features
perf stat -a -e context-switches --repeat 10 -- perf bench sched messaging -g 20 -t -l 5000

	2,556,535        context-switches      ( +-  0.51% )
	9.2427 +- 0.0302 seconds time elapsed  ( +-  0.33% )

Suggested-by: Mike Galbraith <umgwanakikbuti@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://lkml.kernel.org/r/20230816134059.GC982867@hirez.programming.kicks-ass.net
```

The hunks: `pick_eevdf` keeps `curr`, and the feature, on by default (lines 47-88 of the patch):

```text
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index f496cef90ce771..0b7445cd5af98b 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -873,6 +873,13 @@ static struct sched_entity *pick_eevdf(struct cfs_rq *cfs_rq)
 	if (curr && (!curr->on_rq || !entity_eligible(cfs_rq, curr)))
 		curr = NULL;
 
+	/*
+	 * Once selected, run a task until it either becomes non-eligible or
+	 * until it gets a new slice. See the HACK in set_next_entity().
+	 */
+	if (sched_feat(RUN_TO_PARITY) && curr && curr->vlag == curr->deadline)
+		return curr;
+
 	while (node) {
 		struct sched_entity *se = __node_2_se(node);
 
@@ -5167,6 +5174,11 @@ set_next_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
 		update_stats_wait_end_fair(cfs_rq, se);
 		__dequeue_entity(cfs_rq, se);
 		update_load_avg(cfs_rq, se, UPDATE_TG);
+		/*
+		 * HACK, stash a copy of deadline at the point of pick in vlag,
+		 * which isn't used until dequeue.
+		 */
+		se->vlag = se->deadline;
 	}
 
 	update_stats_curr_start(cfs_rq, se);
diff --git a/kernel/sched/features.h b/kernel/sched/features.h
index 61bcbf5e46a450..f770168230ae4a 100644
--- a/kernel/sched/features.h
+++ b/kernel/sched/features.h
@@ -6,6 +6,7 @@
  */
 SCHED_FEAT(PLACE_LAG, true)
 SCHED_FEAT(PLACE_DEADLINE_INITIAL, true)
+SCHED_FEAT(RUN_TO_PARITY, true)
 
 /*
  * Prefer to schedule the task we woke last (assuming it failed
```

`kernel/sched/features.h` at `v6.5`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/kernel/sched/features.h?h=v6.5`, SHA-256 `b89cf04277f8064b7fb9314dd105341474d88711524a6cf4208bb69250f3e3bf`: `RUN_TO_PARITY` matches 0 of its lines.

`kernel/sched/features.h` at `v6.6`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/kernel/sched/features.h?h=v6.6`, SHA-256 `cbd722fd1adba7a49148ab954f74e3fc5de42241b85c9cd63d356965939cca21`, the release that first carries it (lines 7-9):

```c
SCHED_FEAT(PLACE_LAG, true)
SCHED_FEAT(PLACE_DEADLINE_INITIAL, true)
SCHED_FEAT(RUN_TO_PARITY, true)
```

`kernel/sched/features.h` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/kernel/sched/features.h?h=v7.2`, SHA-256 `6ea97b9773bc3662a11028155479a8b609b94070e2e602dd918db9269bfe5c49`, the feature today, on by default (lines 16-25):

```c
/*
 * Inhibit (wakeup) preemption until the current task has either matched the
 * 0-lag point or until is has exhausted it's slice.
 */
SCHED_FEAT(RUN_TO_PARITY, true)
/*
 * Allow wakeup of tasks with a shorter slice to cancel RUN_TO_PARITY for
 * current.
 */
SCHED_FEAT(PREEMPT_SHORT, true)
```

`kernel/sched/fair.c` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/kernel/sched/fair.c?h=v7.2`, SHA-256 `830ae44741cd322df8de5ae75be8fe2c5469fa6e9e1365fbc4233481e6f1fff0`, the base slice, 0.7 ms before CPU-count scaling (lines 74-80):

```c
/*
 * Minimal preemption granularity for CPU-bound tasks:
 *
 * (default: 0.70 msec * (1 + ilog(ncpus)), units: nanoseconds)
 */
unsigned int sysctl_sched_base_slice			= 700000ULL;
static unsigned int normalized_sysctl_sched_base_slice	= 700000ULL;
```

`kernel/sched/fair.c` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/kernel/sched/fair.c?h=v7.2`, SHA-256 `830ae44741cd322df8de5ae75be8fe2c5469fa6e9e1365fbc4233481e6f1fff0`, the protected slice (lines 1076-1115):

```c
/*
 * Set the vruntime up to which an entity can run before looking
 * for another entity to pick.
 * In case of run to parity, we use the shortest slice of the enqueued
 * entities to set the protected period.
 * When run to parity is disabled, we give a minimum quantum to the running
 * entity to ensure progress.
 */
static inline void set_protect_slice(struct cfs_rq *cfs_rq, struct sched_entity *se)
{
	u64 slice = normalized_sysctl_sched_base_slice;
	u64 vprot = se->deadline;

	if (sched_feat(RUN_TO_PARITY))
		slice = cfs_rq_min_slice(cfs_rq);

	slice = min(slice, se->slice);
	if (slice != se->slice)
		vprot = min_vruntime(vprot, se->vruntime + calc_delta_fair(slice, se));

	se->vprot = vprot;
}

static inline void update_protect_slice(struct cfs_rq *cfs_rq, struct sched_entity *se)
{
	u64 slice = cfs_rq_min_slice(cfs_rq);

	se->vprot = min_vruntime(se->vprot, se->vruntime + calc_delta_fair(slice, se));
}

static inline bool protect_slice(struct sched_entity *se)
{
	return vruntime_cmp(se->vruntime, "<", se->vprot);
}

static inline void cancel_protect_slice(struct sched_entity *se)
{
	if (protect_slice(se))
		se->vprot = se->vruntime;
}
```

`kernel/sched/fair.c` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/kernel/sched/fair.c?h=v7.2`, SHA-256 `830ae44741cd322df8de5ae75be8fe2c5469fa6e9e1365fbc4233481e6f1fff0`, `pick_eevdf` keeps a protected `curr` (lines 1160-1164):

```c
	if (curr && (!curr->on_rq || !entity_eligible(cfs_rq, curr)))
		curr = NULL;

	if (curr && protect && protect_slice(curr))
		return curr;
```

`kernel/sched/fair.c` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/kernel/sched/fair.c?h=v7.2`, SHA-256 `830ae44741cd322df8de5ae75be8fe2c5469fa6e9e1365fbc4233481e6f1fff0`, `wakeup_preempt_fair` preempts only for what that pick returns (lines 9886-9905):

```c
pick:
	nse = pick_next_entity(rq, cfs_rq, preempt_action != PREEMPT_WAKEUP_SHORT);
	/* If @p has become the most eligible task, force preemption */
	if (nse == pse)
		goto preempt;

	/*
	 * Because p is enqueued, nse being null can only mean that we
	 * dequeued a delayed task. If there are still entities queued in
	 * cfs, check if the next one will be p.
	 */
	if (!nse && cfs_rq->nr_queued)
		goto pick;

	if (sched_feat(RUN_TO_PARITY))
		update_protect_slice(cfs_rq, se);

	return;

preempt:
```

### aebef63cf7ff, MWAIT as AMD's default idle state from family 17h (`idle-is-hlt-…`)

SHA-256 of the patch `aba8056f09218ff84aeb677e431962d72eb1445aebb33879b5d23c2708ab3b66`.

Header and message (lines 1-40 of the patch):

```text
From aebef63cf7ff222660fd321c47e24452e8437673 Mon Sep 17 00:00:00 2001
From: Wyes Karny <wyes.karny@amd.com>
Date: Mon, 6 Jun 2022 23:33:35 +0530
Subject: x86: Remove vendor checks from prefer_mwait_c1_over_halt

Remove vendor checks from prefer_mwait_c1_over_halt function. Restore
the decision tree to support MWAIT C1 as the default idle state based on
CPUID checks as done by Thomas Gleixner in
commit 09fd4b4ef5bc ("x86: use cpuid to check MWAIT support for C1")

The decision tree is removed in
commit 69fb3676df33 ("x86 idle: remove mwait_idle() and "idle=mwait" cmdline param")

Prefer MWAIT when the following conditions are satisfied:
    1. CPUID_Fn00000001_ECX [Monitor] should be set
    2. CPUID_Fn00000005 should be supported
    3. If CPUID_Fn00000005_ECX [EMX] is set then there should be
       at least one C1 substate available, indicated by
       CPUID_Fn00000005_EDX [MWaitC1SubStates] bits.

Otherwise use HLT for default_idle function.

HPC customers who want to optimize for lower latency are known to
disable Global C-States in the BIOS. In fact, some vendors allow
choosing a BIOS 'performance' profile which explicitly disables
C-States.  In this scenario, the cpuidle driver will not be loaded and
the kernel will continue with the default idle state chosen at boot
time. On AMD systems currently the default idle state is HLT which has
a higher exit latency compared to MWAIT.

The reason for the choice of HLT over MWAIT on AMD systems is:

1. Families prior to 10h didn't support MWAIT
2. Families 10h-15h supported MWAIT, but not MWAIT C1. Hence it was
   preferable to use HLT as the default state on these systems.

However, AMD Family 17h onwards supports MWAIT as well as MWAIT C1. And
it is preferable to use MWAIT as the default idle state on these
systems, as it has lower exit latencies.

```

Its sign-offs (lines 106-111 of the patch):

```text
Signed-off-by: Wyes Karny <wyes.karny@amd.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Tested-by: Zhang Rui <rui.zhang@intel.com>
Link: https://ozlabs.org/~anton/junkcode/context_switch2.c
Link: https://lkml.kernel.org/r/0cc675d8fd1f55e41b510e10abf2e21b6e9803d5.1654538381.git-series.wyes.karny@amd.com
```

`arch/x86/kernel/process.c` at `v5.19`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/arch/x86/kernel/process.c?h=v5.19`, SHA-256 `60cb1943549f39f5866dbab0ad1b5eaf2bd63f0a73049e7d529a3954b369071e`, the vendor check before it (lines 815-832):

```c
 * on systems that support only C1 -- so the boot default must be MWAIT.
 *
 * Some AMD machines are the opposite, they depend on using HALT.
 *
 * So for default C1, which is used during boot until cpuidle loads,
 * use MWAIT-C1 on Intel HW that has it, else use HALT.
 */
static int prefer_mwait_c1_over_halt(const struct cpuinfo_x86 *c)
{
	if (c->x86_vendor != X86_VENDOR_INTEL)
		return 0;

	if (!cpu_has(c, X86_FEATURE_MWAIT) || boot_cpu_has_bug(X86_BUG_MONITOR))
		return 0;

	return 1;
}

```

`arch/x86/kernel/process.c` at `v6.0`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/arch/x86/kernel/process.c?h=v6.0`, SHA-256 `048f28acf5cfdf5083f9824e7c1d138a0452ffb5e15eb47703577ad7f20d034d`, no vendor check at v6.0 (lines 812-850):

```c
/*
 * Prefer MWAIT over HALT if MWAIT is supported, MWAIT_CPUID leaf
 * exists and whenever MONITOR/MWAIT extensions are present there is at
 * least one C1 substate.
 *
 * Do not prefer MWAIT if MONITOR instruction has a bug or idle=nomwait
 * is passed to kernel commandline parameter.
 */
static int prefer_mwait_c1_over_halt(const struct cpuinfo_x86 *c)
{
	u32 eax, ebx, ecx, edx;

	/* User has disallowed the use of MWAIT. Fallback to HALT */
	if (boot_option_idle_override == IDLE_NOMWAIT)
		return 0;

	/* MWAIT is not supported on this platform. Fallback to HALT */
	if (!cpu_has(c, X86_FEATURE_MWAIT))
		return 0;

	/* Monitor has a bug. Fallback to HALT */
	if (boot_cpu_has_bug(X86_BUG_MONITOR))
		return 0;

	cpuid(CPUID_MWAIT_LEAF, &eax, &ebx, &ecx, &edx);

	/*
	 * If MWAIT extensions are not available, it is safe to use MWAIT
	 * with EAX=0, ECX=0.
	 */
	if (!(ecx & CPUID5_ECX_EXTENSIONS_SUPPORTED))
		return 1;

	/*
	 * If MWAIT extensions are available, there should be at least one
	 * MWAIT C1 substate present.
	 */
	return (edx & MWAIT_C1_SUBSTATE_MASK);
}
```

`arch/x86/kernel/process.c` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/arch/x86/kernel/process.c?h=v7.2`, SHA-256 `f1792e208d5c0a01d0752154c66745d310728dc7beaf1567c37cd0bebd5cb61c`, no vendor check today (lines 869-908):

```c
/*
 * Prefer MWAIT over HALT if MWAIT is supported, MWAIT_CPUID leaf
 * exists and whenever MONITOR/MWAIT extensions are present there is at
 * least one C1 substate.
 *
 * Do not prefer MWAIT if MONITOR instruction has a bug or idle=nomwait
 * is passed to kernel commandline parameter.
 */
static __init bool prefer_mwait_c1_over_halt(void)
{
	const struct cpuinfo_x86 *c = &boot_cpu_data;
	u32 eax, ebx, ecx, edx;

	/* If override is enforced on the command line, fall back to HALT. */
	if (boot_option_idle_override != IDLE_NO_OVERRIDE)
		return false;

	/* MWAIT is not supported on this platform. Fallback to HALT */
	if (!cpu_has(c, X86_FEATURE_MWAIT))
		return false;

	/* Monitor has a bug or APIC stops in C1E. Fallback to HALT */
	if (boot_cpu_has_bug(X86_BUG_MONITOR) || boot_cpu_has_bug(X86_BUG_AMD_APIC_C1E))
		return false;

	cpuid(CPUID_LEAF_MWAIT, &eax, &ebx, &ecx, &edx);

	/*
	 * If MWAIT extensions are not available, it is safe to use MWAIT
	 * with EAX=0, ECX=0.
	 */
	if (!(ecx & CPUID5_ECX_EXTENSIONS_SUPPORTED))
		return true;

	/*
	 * If MWAIT extensions are available, there should be at least one
	 * MWAIT C1 substate present.
	 */
	return !!(edx & MWAIT_C1_SUBSTATE_MASK);
}
```

### c9a4b55431e5, MONITOR loses wakes on Lunar Lake, so the IPI stays (`idle-is-hlt-…`)

SHA-256 of the patch `94f4b720e3b4cf45965ec4a3bec69055b416451e072b4c897e5936c7af5972b4`.

Header and message (lines 1-23 of the patch):

```text
From c9a4b55431e5220347881e148725bed69c84e037 Mon Sep 17 00:00:00 2001
From: Len Brown <len.brown@intel.com>
Date: Tue, 12 Nov 2024 21:07:00 -0500
Subject: x86/cpu: Add Lunar Lake to list of CPUs with a broken MONITOR
 implementation

Under some conditions, MONITOR wakeups on Lunar Lake processors
can be lost, resulting in significant user-visible delays.

Add Lunar Lake to X86_BUG_MONITOR so that wake_up_idle_cpu()
always sends an IPI, avoiding this potential delay.

Reported originally here:

	https://bugzilla.kernel.org/show_bug.cgi?id=219364

[ dhansen: tweak subject ]

Signed-off-by: Len Brown <len.brown@intel.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Cc:stable@vger.kernel.org
Link: https://lore.kernel.org/all/a4aa8842a3c3bfdb7fe9807710eef159cbf0e705.1731463305.git.len.brown%40intel.com
```

The hunk (lines 28-42 of the patch):

```text
diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index d1de300af17374..8ded9f859a3a96 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -555,7 +555,9 @@ static void init_intel(struct cpuinfo_x86 *c)
 	     c->x86_vfm == INTEL_WESTMERE_EX))
 		set_cpu_bug(c, X86_BUG_CLFLUSH_MONITOR);
 
-	if (boot_cpu_has(X86_FEATURE_MWAIT) && c->x86_vfm == INTEL_ATOM_GOLDMONT)
+	if (boot_cpu_has(X86_FEATURE_MWAIT) &&
+	    (c->x86_vfm == INTEL_ATOM_GOLDMONT ||
+	     c->x86_vfm == INTEL_LUNARLAKE_M))
 		set_cpu_bug(c, X86_BUG_MONITOR);
 
 #ifdef CONFIG_X86_64
```

`arch/x86/kernel/cpu/intel.c` at `v6.12`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/arch/x86/kernel/cpu/intel.c?h=v6.12`, SHA-256 `74c5ab60349488aa31d260dbec8acbdd8fd38d7f1b00ecc071fa04e994deee16`, Goldmont alone before it (lines 589-590):

```c
	if (boot_cpu_has(X86_FEATURE_MWAIT) && c->x86_vfm == INTEL_ATOM_GOLDMONT)
		set_cpu_bug(c, X86_BUG_MONITOR);
```

`arch/x86/kernel/cpu/intel.c` at `v6.13`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/arch/x86/kernel/cpu/intel.c?h=v6.13`, SHA-256 `9c647e23e004e176baa229dcad37535a19bf07e56d2c5d5b6f2ca014a262f44b`, the release that first carries it (lines 558-561):

```c
	if (boot_cpu_has(X86_FEATURE_MWAIT) &&
	    (c->x86_vfm == INTEL_ATOM_GOLDMONT ||
	     c->x86_vfm == INTEL_LUNARLAKE_M))
		set_cpu_bug(c, X86_BUG_MONITOR);
```

`arch/x86/kernel/cpu/intel.c` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/arch/x86/kernel/cpu/intel.c?h=v7.2`, SHA-256 `e718ec56f420a2ee68de3bf0b9c1474362e737c5d33ce0e41f74d905f4a5fb88`, the bug today (lines 560-563):

```c
	if (boot_cpu_has(X86_FEATURE_MWAIT) &&
	    (c->x86_vfm == INTEL_ATOM_GOLDMONT ||
	     c->x86_vfm == INTEL_LUNARLAKE_M))
		set_cpu_bug(c, X86_BUG_MONITOR);
```

`arch/x86/include/asm/intel-family.h` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/arch/x86/include/asm/intel-family.h?h=v7.2`, SHA-256 `894e851bf5fdc55c5dbf5a6270fb1b095c74798d4100db440b328a20f53fd184`, Lunar Lake's model (lines 152-152):

```c
#define INTEL_LUNARLAKE_M		IFM(6, 0xBD) /* Lion Cove / Skymont */
```

`arch/x86/include/asm/intel-family.h` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/arch/x86/include/asm/intel-family.h?h=v7.2`, SHA-256 `894e851bf5fdc55c5dbf5a6270fb1b095c74798d4100db440b328a20f53fd184`, Goldmont's model (lines 179-179):

```c
#define INTEL_ATOM_GOLDMONT		IFM(6, 0x5C) /* Apollo Lake */
```

`arch/x86/include/asm/mwait.h` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/arch/x86/include/asm/mwait.h?h=v7.2`, SHA-256 `aad26ca72fafddc2e07e452dfb9604c66adae0f1616816a8499d015574d8a63f`, MWAIT idle sets no polling flag on such a CPU (lines 99-135):

```c
/*
 * This uses new MONITOR/MWAIT instructions on P4 processors with PNI,
 * which can obviate IPI to trigger checking of need_resched.
 * We execute MONITOR against need_resched and enter optimized wait state
 * through MWAIT. Whenever someone changes need_resched, we would be woken
 * up from MWAIT (without an IPI).
 *
 * New with Core Duo processors, MWAIT can take some hints based on CPU
 * capability.
 */
static __always_inline void mwait_idle_with_hints(u32 eax, u32 ecx)
{
	if (need_resched())
		return;

	x86_idle_clear_cpu_buffers();

	if (static_cpu_has_bug(X86_BUG_MONITOR) || !current_set_polling_and_test()) {
		const void *addr = &current_thread_info()->flags;

		alternative_input("", "clflush (%[addr])", X86_BUG_CLFLUSH_MONITOR, [addr] "a" (addr));
		__monitor(addr, 0, 0);

		if (need_resched())
			goto out;

		if (ecx & 1) {
			__mwait(eax, ecx);
		} else {
			__sti_mwait(eax, ecx);
			raw_local_irq_disable();
		}
	}

out:
	current_clr_polling();
}
```

`kernel/sched/core.c` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/kernel/sched/core.c?h=v7.2`, SHA-256 `957f657af1a2327c75dac495548eaa7bd1571a12a756c7f704e6f3195b156988`, a wake sends the IPI unless the polling flag is set (lines 1046-1055):

```c
#ifdef TIF_POLLING_NRFLAG
/*
 * Atomically set TIF_NEED_RESCHED and test for TIF_POLLING_NRFLAG,
 * this avoids any races wrt polling state changes and thereby avoids
 * spurious IPIs.
 */
static inline bool set_nr_and_not_polling(struct thread_info *ti, int tif)
{
	return !(fetch_or(&ti->flags, 1 << tif) & _TIF_POLLING_NRFLAG);
}
```

`kernel/sched/core.c` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/kernel/sched/core.c?h=v7.2`, SHA-256 `957f657af1a2327c75dac495548eaa7bd1571a12a756c7f704e6f3195b156988`, `wake_up_idle_cpu` (lines 1324-1357):

```c
static void wake_up_idle_cpu(int cpu)
{
	struct rq *rq = cpu_rq(cpu);

	if (cpu == smp_processor_id())
		return;

	/*
	 * Set TIF_NEED_RESCHED and send an IPI if in the non-polling
	 * part of the idle loop. This forces an exit from the idle loop
	 * and a round trip to schedule(). Now this could be optimized
	 * because a simple new idle loop iteration is enough to
	 * re-evaluate the next tick. Provided some re-ordering of tick
	 * nohz functions that would need to follow TIF_NR_POLLING
	 * clearing:
	 *
	 * - On most architectures, a simple fetch_or on ti::flags with a
	 *   "0" value would be enough to know if an IPI needs to be sent.
	 *
	 * - x86 needs to perform a last need_resched() check between
	 *   monitor and mwait which doesn't take timers into account.
	 *   There a dedicated TIF_TIMER flag would be required to
	 *   fetch_or here and be checked along with TIF_NEED_RESCHED
	 *   before mwait().
	 *
	 * However, remote timer enqueue is not such a frequent event
	 * and testing of the above solutions didn't appear to report
	 * much benefits.
	 */
	if (set_nr_and_not_polling(task_thread_info(rq->idle), TIF_NEED_RESCHED))
		smp_send_reschedule(cpu);
	else
		trace_sched_wake_idle_without_ipi(cpu);
}
```

`arch/x86/kernel/process.c` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/arch/x86/kernel/process.c?h=v7.2`, SHA-256 `f1792e208d5c0a01d0752154c66745d310728dc7beaf1567c37cd0bebd5cb61c`, `prefer_mwait_c1_over_halt` takes `hlt` on such a CPU (lines 890-892):

```c
	/* Monitor has a bug or APIC stops in C1E. Fallback to HALT */
	if (boot_cpu_has_bug(X86_BUG_MONITOR) || boot_cpu_has_bug(X86_BUG_AMD_APIC_C1E))
		return false;
```

## Linux v7.2, a CPU's hot data on lines of its own (`per-cpu-scheduler-…`)

`kernel/sched/core.c` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/kernel/sched/core.c?h=v7.2`, SHA-256 `957f657af1a2327c75dac495548eaa7bd1571a12a756c7f704e6f3195b156988`, the run queues (lines 131-131):

```c
DEFINE_PER_CPU_SHARED_ALIGNED(struct rq, runqueues);
```

`include/linux/percpu-defs.h` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/include/linux/percpu-defs.h?h=v7.2`, SHA-256 `409b36b90d949956583fc786b55367eca4ae0d4078fe2f79418732fa133f3195`, `DEFINE_PER_CPU_SHARED_ALIGNED` (lines 129-146):

```c
/*
 * Declaration/definition used for per-CPU variables that must be cacheline
 * aligned under SMP conditions so that, whilst a particular instance of the
 * data corresponds to a particular CPU, inefficiencies due to direct access by
 * other CPUs are reduced by preventing the data from unnecessarily spanning
 * cachelines.
 *
 * An example of this would be statistical data, where each CPU's set of data
 * is updated by that CPU alone, but the data from across all CPUs is collated
 * by a CPU processing a read from a proc file.
 */
#define DECLARE_PER_CPU_SHARED_ALIGNED(type, name)			\
	DECLARE_PER_CPU_SECTION(type, name, PER_CPU_SHARED_ALIGNED_SECTION) \
	____cacheline_aligned_in_smp

#define DEFINE_PER_CPU_SHARED_ALIGNED(type, name)			\
	DEFINE_PER_CPU_SECTION(type, name, PER_CPU_SHARED_ALIGNED_SECTION) \
	____cacheline_aligned_in_smp
```

`include/linux/cache.h` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/include/linux/cache.h?h=v7.2`, SHA-256 `80126344324f512af39227e0c54ea4dc19933e6943fdedf900fb3cbf9d3f654a`, `____cacheline_aligned_in_smp` (lines 63-69):

```c
#ifndef ____cacheline_aligned_in_smp
#ifdef CONFIG_SMP
#define ____cacheline_aligned_in_smp ____cacheline_aligned
#else
#define ____cacheline_aligned_in_smp
#endif /* CONFIG_SMP */
#endif
```

`include/vdso/cache.h` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/include/vdso/cache.h?h=v7.2`, SHA-256 `7cf987365a5ed2a3cea1ac1afe31d23c5287af54a9b99417e30f545fdc8a2ded`, `____cacheline_aligned` and `SMP_CACHE_BYTES` (lines 7-13):

```c
#ifndef SMP_CACHE_BYTES
#define SMP_CACHE_BYTES L1_CACHE_BYTES
#endif

#ifndef ____cacheline_aligned
#define ____cacheline_aligned __attribute__((__aligned__(SMP_CACHE_BYTES)))
#endif
```

`arch/x86/include/asm/cache.h` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/arch/x86/include/asm/cache.h?h=v7.2`, SHA-256 `a4940ff4b26143d543d46089e40864ede0dc3d50d905de20e1f95e76c9d7f3e5`, x86's line, which defines no `SMP_CACHE_BYTES` of its own (lines 7-9):

```c
/* L1 cache line size */
#define L1_CACHE_SHIFT	(CONFIG_X86_L1_CACHE_SHIFT)
#define L1_CACHE_BYTES	(1 << L1_CACHE_SHIFT)
```

## Linux v7.2, the unlocked preempt count (round 2's NOTE 3)

Cited by no issue: `every-syscall-saves-…`, where the review asked for it, was closed by #871 in the merge before this round's commit. Quoted for the review's claim.

`arch/x86/include/asm/preempt.h` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/arch/x86/include/asm/preempt.h?h=v7.2`, SHA-256 `4a0be0a532563e85ee4ac28dcbffe23d7e6592fd6870fe7ce6f7e29dc605bb83`, `__preempt_count_add` and `__preempt_count_sub` (lines 74-86):

```c
/*
 * The various preempt_count add/sub methods
 */

static __always_inline void __preempt_count_add(int val)
{
	raw_cpu_add_4(__preempt_count, val);
}

static __always_inline void __preempt_count_sub(int val)
{
	raw_cpu_add_4(__preempt_count, -val);
}
```

## Linux v7.2, the drives whose APST failed (`diskserver-drives-nvme-apst`)

`drivers/nvme/host/nvme.h` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/drivers/nvme/host/nvme.h?h=v7.2`, SHA-256 `2b38e70d68395306c49646011630874f679f49e7ae83f8bd55e94b5fa33d0a91`, the two quirks (lines 83-91):

```c
	/*
	 * APST should not be used.
	 */
	NVME_QUIRK_NO_APST			= (1 << 4),

	/*
	 * The deepest sleep state should not be used.
	 */
	NVME_QUIRK_NO_DEEPEST_PS		= (1 << 5),
```

`drivers/nvme/host/core.c` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/drivers/nvme/host/core.c?h=v7.2`, SHA-256 `a946234dc13cb09d7c608f1a27b934adf53bfc02a93a48788132cf0e5a0122c7`, no transition to the deepest state on a `NO_DEEPEST_PS` drive (lines 2966-2972):

```c
		/*
		 * Don't allow transitions to the deepest state if it's quirked
		 * off.
		 */
		if (state == ctrl->npss &&
		    (ctrl->quirks & NVME_QUIRK_NO_DEEPEST_PS))
			continue;
```

`drivers/nvme/host/core.c` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/drivers/nvme/host/core.c?h=v7.2`, SHA-256 `a946234dc13cb09d7c608f1a27b934adf53bfc02a93a48788132cf0e5a0122c7`, `core_quirks`, by vendor, model and firmware (lines 3048-3108):

```c
struct nvme_core_quirk_entry {
	/*
	 * NVMe model and firmware strings are padded with spaces.  For
	 * simplicity, strings in the quirk table are padded with NULLs
	 * instead.
	 */
	u16 vid;
	const char *mn;
	const char *fr;
	unsigned long quirks;
};

static const struct nvme_core_quirk_entry core_quirks[] = {
	{
		/*
		 * This Toshiba device seems to die using any APST states.  See:
		 * https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1678184/comments/11
		 */
		.vid = 0x1179,
		.mn = "THNSF5256GPUK TOSHIBA",
		.quirks = NVME_QUIRK_NO_APST,
	},
	{
		/*
		 * This LiteON CL1-3D*-Q11 firmware version has a race
		 * condition associated with actions related to suspend to idle
		 * LiteON has resolved the problem in future firmware
		 */
		.vid = 0x14a4,
		.fr = "22301111",
		.quirks = NVME_QUIRK_SIMPLE_SUSPEND,
	},
	{
		/*
		 * This Kioxia CD6-V Series / HPE PE8030 device times out and
		 * aborts I/O during any load, but more easily reproducible
		 * with discards (fstrim).
		 *
		 * The device is left in a state where it is also not possible
		 * to use "nvme set-feature" to disable APST, but booting with
		 * nvme_core.default_ps_max_latency_us=0 works.
		 */
		.vid = 0x1e0f,
		.mn = "KCD6XVUL6T40",
		.quirks = NVME_QUIRK_NO_APST,
	},
	{
		/*
		 * The external Samsung X5 SSD fails initialization without a
		 * delay before checking if it is ready and has a whole set of
		 * other problems.  To make this even more interesting, it
		 * shares the PCI ID with internal Samsung 970 Evo Plus that
		 * does not need or want these quirks.
		 */
		.vid = 0x144d,
		.mn = "Samsung Portable SSD X5",
		.quirks = NVME_QUIRK_DELAY_BEFORE_CHK_RDY |
			  NVME_QUIRK_NO_DEEPEST_PS |
			  NVME_QUIRK_IGNORE_DEV_SUBNQN,
	}
};
```

`drivers/nvme/host/core.c` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/drivers/nvme/host/core.c?h=v7.2`, SHA-256 `a946234dc13cb09d7c608f1a27b934adf53bfc02a93a48788132cf0e5a0122c7`, no APST on a `NO_APST` drive (lines 3686-3698):

```c
	ctrl->npss = id->npss;
	ctrl->apsta = id->apsta;
	prev_apst_enabled = ctrl->apst_enabled;
	if (ctrl->quirks & NVME_QUIRK_NO_APST) {
		if (force_apst && id->apsta) {
			dev_warn(ctrl->device, "forcibly allowing APST due to nvme_core.force_apst -- use at your own risk\n");
			ctrl->apst_enabled = true;
		} else {
			ctrl->apst_enabled = false;
		}
	} else {
		ctrl->apst_enabled = id->apsta;
	}
```

`drivers/nvme/host/pci.c` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/drivers/nvme/host/pci.c?h=v7.2`, SHA-256 `f01e258f3e9bcc2d8bee918bda9296c6a7bff36ea21a6ddb740e266c6277b12d`, `check_vendor_combination_bug`, by drive and machine (lines 3584-3657):

```c
static unsigned long check_vendor_combination_bug(struct pci_dev *pdev)
{
	if (pdev->vendor == 0x144d && pdev->device == 0xa802) {
		/*
		 * Several Samsung devices seem to drop off the PCIe bus
		 * randomly when APST is on and uses the deepest sleep state.
		 * This has been observed on a Samsung "SM951 NVMe SAMSUNG
		 * 256GB", a "PM951 NVMe SAMSUNG 512GB", and a "Samsung SSD
		 * 950 PRO 256GB", but it seems to be restricted to two Dell
		 * laptops.
		 */
		if (dmi_match(DMI_SYS_VENDOR, "Dell Inc.") &&
		    (dmi_match(DMI_PRODUCT_NAME, "XPS 15 9550") ||
		     dmi_match(DMI_PRODUCT_NAME, "Precision 5510")))
			return NVME_QUIRK_NO_DEEPEST_PS;
	} else if (pdev->vendor == 0x144d && pdev->device == 0xa804) {
		/*
		 * Samsung SSD 960 EVO drops off the PCIe bus after system
		 * suspend on a Ryzen board, ASUS PRIME B350M-A, as well as
		 * within few minutes after bootup on a Coffee Lake board -
		 * ASUS PRIME Z370-A
		 */
		if (dmi_match(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC.") &&
		    (dmi_match(DMI_BOARD_NAME, "PRIME B350M-A") ||
		     dmi_match(DMI_BOARD_NAME, "PRIME Z370-A")))
			return NVME_QUIRK_NO_APST;
	} else if ((pdev->vendor == 0x144d && (pdev->device == 0xa801 ||
		    pdev->device == 0xa808 || pdev->device == 0xa809)) ||
		   (pdev->vendor == 0x1e0f && pdev->device == 0x0001)) {
		/*
		 * Forcing to use host managed nvme power settings for
		 * lowest idle power with quick resume latency on
		 * Samsung and Toshiba SSDs based on suspend behavior
		 * on Coffee Lake board for LENOVO C640
		 */
		if ((dmi_match(DMI_BOARD_VENDOR, "LENOVO")) &&
		     dmi_match(DMI_BOARD_NAME, "LNVNB161216"))
			return NVME_QUIRK_SIMPLE_SUSPEND;
	} else if (pdev->vendor == 0x2646 && (pdev->device == 0x2263 ||
		   pdev->device == 0x500f)) {
		/*
		 * Exclude some Kingston NV1 and A2000 devices from
		 * NVME_QUIRK_SIMPLE_SUSPEND. Do a full suspend to save a
		 * lot of energy with s2idle sleep on some TUXEDO platforms.
		 */
		if (dmi_match(DMI_BOARD_NAME, "NS5X_NS7XAU") ||
		    dmi_match(DMI_BOARD_NAME, "NS5x_7xAU") ||
		    dmi_match(DMI_BOARD_NAME, "NS5x_7xPU") ||
		    dmi_match(DMI_BOARD_NAME, "PH4PRX1_PH6PRX1"))
			return NVME_QUIRK_FORCE_NO_SIMPLE_SUSPEND;
	} else if (pdev->vendor == 0x144d && pdev->device == 0xa80d) {
		/*
		 * Exclude Samsung 990 Evo from NVME_QUIRK_SIMPLE_SUSPEND
		 * because of high power consumption (> 2 Watt) in s2idle
		 * sleep. Only some boards with Intel CPU are affected.
		 * (Note for testing: Samsung 990 Evo Plus has same PCI ID)
		 */
		if (dmi_match(DMI_BOARD_NAME, "DN50Z-140HC-YD") ||
		    dmi_match(DMI_BOARD_NAME, "GMxPXxx") ||
		    dmi_match(DMI_BOARD_NAME, "GXxMRXx") ||
		    dmi_match(DMI_BOARD_NAME, "NS5X_NS7XAU") ||
		    dmi_match(DMI_BOARD_NAME, "PH4PG31") ||
		    dmi_match(DMI_BOARD_NAME, "PH4PRX1_PH6PRX1") ||
		    dmi_match(DMI_BOARD_NAME, "PH6PG01_PH6PG71"))
			return NVME_QUIRK_FORCE_NO_SIMPLE_SUSPEND;
	}

	/*
	 * NVMe SSD drops off the PCIe bus after system idle
	 * for 10 hours on a Lenovo N60z board.
	 */
	if (dmi_match(DMI_BOARD_NAME, "LXKT-ZXEG-N6"))
		return NVME_QUIRK_NO_APST;

```

`drivers/nvme/host/pci.c` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/drivers/nvme/host/pci.c?h=v7.2`, SHA-256 `f01e258f3e9bcc2d8bee918bda9296c6a7bff36ea21a6ddb740e266c6277b12d`, applied at probe (lines 3699-3699):

```c
	quirks |= check_vendor_combination_bug(pdev);
```

`drivers/nvme/host/pci.c` at `v7.2`, fetched from `https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/drivers/nvme/host/pci.c?h=v7.2`, SHA-256 `f01e258f3e9bcc2d8bee918bda9296c6a7bff36ea21a6ddb740e266c6277b12d`, `nvme_id_table`, by PCI ID (lines 4097-4290):

```c
static const struct pci_device_id nvme_id_table[] = {
	{ PCI_VDEVICE(INTEL, 0x0953),	/* Intel 750/P3500/P3600/P3700 */
		.driver_data = NVME_QUIRK_STRIPE_SIZE |
				NVME_QUIRK_DEALLOCATE_ZEROES, },
	{ PCI_VDEVICE(INTEL, 0x0a53),	/* Intel P3520 */
		.driver_data = NVME_QUIRK_STRIPE_SIZE |
				NVME_QUIRK_DEALLOCATE_ZEROES, },
	{ PCI_VDEVICE(INTEL, 0x0a54),	/* Intel P4500/P4600 */
		.driver_data = NVME_QUIRK_STRIPE_SIZE |
				NVME_QUIRK_IGNORE_DEV_SUBNQN |
				NVME_QUIRK_BOGUS_NID, },
	{ PCI_VDEVICE(INTEL, 0x0a55),	/* Dell Express Flash P4600 */
		.driver_data = NVME_QUIRK_STRIPE_SIZE, },
	{ PCI_VDEVICE(INTEL, 0xf1a5),	/* Intel 600P/P3100 */
		.driver_data = NVME_QUIRK_NO_DEEPEST_PS |
				NVME_QUIRK_MEDIUM_PRIO_SQ |
				NVME_QUIRK_NO_TEMP_THRESH_CHANGE |
				NVME_QUIRK_DISABLE_WRITE_ZEROES, },
	{ PCI_VDEVICE(INTEL, 0xf1a6),	/* Intel 760p/Pro 7600p */
		.driver_data = NVME_QUIRK_IGNORE_DEV_SUBNQN, },
	{ PCI_VDEVICE(INTEL, 0x5845),	/* Qemu emulated controller */
		.driver_data = NVME_QUIRK_IDENTIFY_CNS |
				NVME_QUIRK_DISABLE_WRITE_ZEROES |
				NVME_QUIRK_BOGUS_NID, },
	{ PCI_VDEVICE(REDHAT, 0x0010),	/* Qemu emulated controller */
		.driver_data = NVME_QUIRK_BOGUS_NID, },
	{ PCI_DEVICE(0x1217, 0x8760), /* O2 Micro 64GB Steam Deck */
		.driver_data = NVME_QUIRK_DMAPOOL_ALIGN_512, },
	{ PCI_DEVICE(0x126f, 0x1001),	/* Silicon Motion generic */
		.driver_data = NVME_QUIRK_NO_DEEPEST_PS |
				NVME_QUIRK_IGNORE_DEV_SUBNQN, },
	{ PCI_DEVICE(0x126f, 0x2262),	/* Silicon Motion generic */
		.driver_data = NVME_QUIRK_NO_DEEPEST_PS |
				NVME_QUIRK_BOGUS_NID, },
	{ PCI_DEVICE(0x126f, 0x2263),	/* Silicon Motion unidentified */
		.driver_data = NVME_QUIRK_NO_NS_DESC_LIST |
				NVME_QUIRK_BOGUS_NID, },
	{ PCI_DEVICE(0x1bb1, 0x0100),   /* Seagate Nytro Flash Storage */
		.driver_data = NVME_QUIRK_DELAY_BEFORE_CHK_RDY |
				NVME_QUIRK_NO_NS_DESC_LIST, },
	{ PCI_DEVICE(0x1c58, 0x0003),	/* HGST adapter */
		.driver_data = NVME_QUIRK_DELAY_BEFORE_CHK_RDY, },
	{ PCI_DEVICE(0x1c58, 0x0023),	/* WDC SN200 adapter */
		.driver_data = NVME_QUIRK_DELAY_BEFORE_CHK_RDY, },
	{ PCI_DEVICE(0x1c5f, 0x0540),	/* Memblaze Pblaze4 adapter */
		.driver_data = NVME_QUIRK_DELAY_BEFORE_CHK_RDY, },
	{ PCI_DEVICE(0x1c5f, 0x0555),	/* Memblaze Pblaze5 adapter */
		.driver_data = NVME_QUIRK_NO_NS_DESC_LIST, },
	{ PCI_DEVICE(0x144d, 0xa821),   /* Samsung PM1725 */
		.driver_data = NVME_QUIRK_DELAY_BEFORE_CHK_RDY, },
	{ PCI_DEVICE(0x144d, 0xa822),   /* Samsung PM1725a */
		.driver_data = NVME_QUIRK_DELAY_BEFORE_CHK_RDY |
				NVME_QUIRK_DISABLE_WRITE_ZEROES|
				NVME_QUIRK_IGNORE_DEV_SUBNQN, },
	{ PCI_DEVICE(0x15b7, 0x5008),   /* Sandisk SN530 */
		.driver_data = NVME_QUIRK_BROKEN_MSI },
	{ PCI_DEVICE(0x15b7, 0x5009),   /* Sandisk SN550 */
		.driver_data = NVME_QUIRK_BROKEN_MSI |
				NVME_QUIRK_NO_DEEPEST_PS },
	{ PCI_DEVICE(0x1987, 0x5012),	/* Phison E12 */
		.driver_data = NVME_QUIRK_BOGUS_NID, },
	{ PCI_DEVICE(0x1987, 0x5016),	/* Phison E16 */
		.driver_data = NVME_QUIRK_IGNORE_DEV_SUBNQN |
				NVME_QUIRK_BOGUS_NID, },
	{ PCI_DEVICE(0x1987, 0x5019),  /* phison E19 */
		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES, },
	{ PCI_DEVICE(0x1987, 0x5021),   /* Phison E21 */
		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES, },
	{ PCI_DEVICE(0x1b4b, 0x1092),	/* Lexar 256 GB SSD */
		.driver_data = NVME_QUIRK_NO_NS_DESC_LIST |
				NVME_QUIRK_IGNORE_DEV_SUBNQN, },
	{ PCI_DEVICE(0x1cc1, 0x33f8),   /* ADATA IM2P33F8ABR1 1 TB */
		.driver_data = NVME_QUIRK_BOGUS_NID, },
	{ PCI_DEVICE(0x10ec, 0x5762),   /* ADATA SX6000LNP */
		.driver_data = NVME_QUIRK_IGNORE_DEV_SUBNQN |
				NVME_QUIRK_BOGUS_NID, },
	{ PCI_DEVICE(0x10ec, 0x5763),  /* ADATA SX6000PNP */
		.driver_data = NVME_QUIRK_BOGUS_NID, },
	{ PCI_DEVICE(0x1cc1, 0x8201),   /* ADATA SX8200PNP 512GB */
		.driver_data = NVME_QUIRK_NO_DEEPEST_PS |
				NVME_QUIRK_IGNORE_DEV_SUBNQN, },
	 { PCI_DEVICE(0x1344, 0x5407), /* Micron Technology Inc NVMe SSD */
		.driver_data = NVME_QUIRK_IGNORE_DEV_SUBNQN },
	 { PCI_DEVICE(0x1344, 0x6001),   /* Micron Nitro NVMe */
		 .driver_data = NVME_QUIRK_BOGUS_NID, },
	{ PCI_DEVICE(0x1c5c, 0x1504),   /* SK Hynix PC400 */
		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES, },
	{ PCI_DEVICE(0x1c5c, 0x174a),   /* SK Hynix P31 SSD */
		.driver_data = NVME_QUIRK_BOGUS_NID, },
	{ PCI_DEVICE(0x1c5c, 0x1D59),   /* SK Hynix BC901 */
		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES, },
	{ PCI_DEVICE(0x15b7, 0x2001),   /*  Sandisk Skyhawk */
		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES, },
	{ PCI_DEVICE(0x1d97, 0x2263),   /* SPCC */
		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES, },
	{ PCI_DEVICE(0x144d, 0xa80b),   /* Samsung PM9B1 256G and 512G */
		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES |
				NVME_QUIRK_BOGUS_NID, },
	{ PCI_DEVICE(0x144d, 0xa809),   /* Samsung MZALQ256HBJD 256G */
		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES, },
	{ PCI_DEVICE(0x144d, 0xa802),   /* Samsung SM953 */
		.driver_data = NVME_QUIRK_BOGUS_NID, },
	{ PCI_DEVICE(0x1cc4, 0x6303),   /* UMIS RPJTJ512MGE1QDY 512G */
		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES, },
	{ PCI_DEVICE(0x1cc4, 0x6302),   /* UMIS RPJTJ256MGE1QDY 256G */
		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES, },
	{ PCI_DEVICE(0x2646, 0x2262),   /* KINGSTON SKC2000 NVMe SSD */
		.driver_data = NVME_QUIRK_NO_DEEPEST_PS, },
	{ PCI_DEVICE(0x2646, 0x2263),   /* KINGSTON A2000 NVMe SSD  */
		.driver_data = NVME_QUIRK_NO_DEEPEST_PS, },
	{ PCI_DEVICE(0x2646, 0x5013),   /* Kingston KC3000, Kingston FURY Renegade */
		.driver_data = NVME_QUIRK_NO_SECONDARY_TEMP_THRESH, },
	{ PCI_DEVICE(0x2646, 0x5018),   /* KINGSTON OM8SFP4xxxxP OS21012 NVMe SSD */
		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES, },
	{ PCI_DEVICE(0x2646, 0x5016),   /* KINGSTON OM3PGP4xxxxP OS21011 NVMe SSD */
		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES, },
	{ PCI_DEVICE(0x2646, 0x501A),   /* KINGSTON OM8PGP4xxxxP OS21005 NVMe SSD */
		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES, },
	{ PCI_DEVICE(0x2646, 0x501B),   /* KINGSTON OM8PGP4xxxxQ OS21005 NVMe SSD */
		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES, },
	{ PCI_DEVICE(0x2646, 0x501E),   /* KINGSTON OM3PGP4xxxxQ OS21011 NVMe SSD */
		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES, },
	{ PCI_DEVICE(0x2646, 0x502F),   /* KINGSTON OM3SGP4xxxxK NVMe SSD */
		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES, },
	{ PCI_DEVICE(0x1f40, 0x1202),   /* Netac Technologies Co. NV3000 NVMe SSD */
		.driver_data = NVME_QUIRK_BOGUS_NID, },
	{ PCI_DEVICE(0x1f40, 0x5236),   /* Netac Technologies Co. NV7000 NVMe SSD */
		.driver_data = NVME_QUIRK_BOGUS_NID, },
	{ PCI_DEVICE(0x1e4B, 0x1001),   /* MAXIO MAP1001 */
		.driver_data = NVME_QUIRK_BOGUS_NID, },
	{ PCI_DEVICE(0x1e4B, 0x1002),   /* MAXIO MAP1002 */
		.driver_data = NVME_QUIRK_BOGUS_NID, },
	{ PCI_DEVICE(0x1e4B, 0x1202),   /* MAXIO MAP1202 */
		.driver_data = NVME_QUIRK_BOGUS_NID, },
	{ PCI_DEVICE(0x1e4B, 0x1602),   /* MAXIO MAP1602 */
		.driver_data = NVME_QUIRK_BOGUS_NID, },
	{ PCI_DEVICE(0x1cc1, 0x5350),   /* ADATA XPG GAMMIX S50 */
		.driver_data = NVME_QUIRK_BOGUS_NID, },
	{ PCI_DEVICE(0x1dbe, 0x5216),   /* Acer/INNOGRIT FA100/5216 NVMe SSD */
		.driver_data = NVME_QUIRK_BOGUS_NID, },
	{ PCI_DEVICE(0x1dbe, 0x5236),   /* ADATA XPG GAMMIX S70 */
		.driver_data = NVME_QUIRK_BOGUS_NID, },
	{ PCI_DEVICE(0x1e49, 0x0021),   /* ZHITAI TiPro5000 NVMe SSD */
		.driver_data = NVME_QUIRK_NO_DEEPEST_PS, },
	{ PCI_DEVICE(0x1e49, 0x0041),   /* ZHITAI TiPro7000 NVMe SSD */
		.driver_data = NVME_QUIRK_NO_DEEPEST_PS, },
	{ PCI_DEVICE(0x1fa0, 0x2283),   /* Wodposit WPBSNM8-256GTP */
		.driver_data = NVME_QUIRK_NO_SECONDARY_TEMP_THRESH, },
	{ PCI_DEVICE(0x025e, 0xf1ac),   /* SOLIDIGM  P44 pro SSDPFKKW020X7  */
		.driver_data = NVME_QUIRK_NO_DEEPEST_PS, },
	{ PCI_DEVICE(0xc0a9, 0x540a),   /* Crucial P2 */
		.driver_data = NVME_QUIRK_BOGUS_NID, },
	{ PCI_DEVICE(0x1d97, 0x2263), /* Lexar NM610 */
		.driver_data = NVME_QUIRK_BOGUS_NID, },
	{ PCI_DEVICE(0x1d97, 0x1d97), /* Lexar NM620 */
		.driver_data = NVME_QUIRK_BOGUS_NID, },
	{ PCI_DEVICE(0x1d97, 0x2269), /* Lexar NM760 */
		.driver_data = NVME_QUIRK_BOGUS_NID |
				NVME_QUIRK_IGNORE_DEV_SUBNQN, },
	{ PCI_DEVICE(0x10ec, 0x5763), /* TEAMGROUP T-FORCE CARDEA ZERO Z330 SSD */
		.driver_data = NVME_QUIRK_BOGUS_NID, },
	{ PCI_DEVICE(0x1e4b, 0x1602), /* HS-SSD-FUTURE 2048G  */
		.driver_data = NVME_QUIRK_BOGUS_NID, },
	{ PCI_DEVICE(0x10ec, 0x5765), /* TEAMGROUP MP33 2TB SSD */
		.driver_data = NVME_QUIRK_BOGUS_NID, },
	{ PCI_DEVICE(PCI_VENDOR_ID_AMAZON, 0x0061),
		.driver_data = NVME_QUIRK_DMA_ADDRESS_BITS_48, },
	{ PCI_DEVICE(PCI_VENDOR_ID_AMAZON, 0x0065),
		.driver_data = NVME_QUIRK_DMA_ADDRESS_BITS_48, },
	{ PCI_DEVICE(PCI_VENDOR_ID_AMAZON, 0x8061),
		.driver_data = NVME_QUIRK_DMA_ADDRESS_BITS_48, },
	{ PCI_DEVICE(PCI_VENDOR_ID_AMAZON, 0xcd00),
		.driver_data = NVME_QUIRK_DMA_ADDRESS_BITS_48, },
	{ PCI_DEVICE(PCI_VENDOR_ID_AMAZON, 0xcd01),
		.driver_data = NVME_QUIRK_DMA_ADDRESS_BITS_48, },
	{ PCI_DEVICE(PCI_VENDOR_ID_AMAZON, 0xcd02),
		.driver_data = NVME_QUIRK_DMA_ADDRESS_BITS_48, },
	{ PCI_DEVICE(PCI_VENDOR_ID_APPLE, 0x2001),
		/*
		 * Fix for the Apple controller found in the MacBook8,1 and
		 * some MacBook7,1 to avoid controller resets and data loss.
		 */
		.driver_data = NVME_QUIRK_SINGLE_VECTOR |
				NVME_QUIRK_QDEPTH_ONE },
	{ PCI_DEVICE(PCI_VENDOR_ID_APPLE, 0x2003) },
	{ PCI_DEVICE(PCI_VENDOR_ID_APPLE, 0x2005),
		.driver_data = NVME_QUIRK_SINGLE_VECTOR |
				NVME_QUIRK_128_BYTES_SQES |
				NVME_QUIRK_SHARED_TAGS |
				NVME_QUIRK_SKIP_CID_GEN |
				NVME_QUIRK_IDENTIFY_CNS },
	{ PCI_DEVICE_CLASS(PCI_CLASS_STORAGE_EXPRESS, 0xffffff) },
	{ 0, }
};
```

No reading in ToyOS's tree names the T14's drive by PCI ID, model or firmware: `issues/features-no-proving-machine-is-known-to-offer.md` has its `id-ctrl` unread, and `issues/no-program-measures-toyos-against-linux-on-one-machine.md` reads its NVMe identity.

