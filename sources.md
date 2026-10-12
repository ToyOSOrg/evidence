**Sources the speed track's stages cite**, quoted verbatim. A PDF's text is extracted with PyMuPDF 1.28.0 (`page.get_text()`); each quote is a line range of the extract, and the page is the PDF's. A PDF's text drops its section headings' numbers, so a section is numbered by the document's own cross-references to it.

## Intel® 64 and IA-32 Architectures Software Developer's Manual, combined volumes, 325462-093

Fetched from `https://cdrdv2-public.intel.com/929349/325462-093-sdm-vol-1-2abcd-3abcd-4.pdf`, SHA-256 `a4a62e6a7ba11a76c7753a195b825087306812aac39b930973f9168ee599f321`.

Vol. 3A §7.6, the instruction boundary (`every-syscall-saves-…`) (PDF page 3355 of the extract, lines 225147-225151):

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

Vol. 3A §16.4, saving FP state on a switch (`every-syscall-saves-…`) (PDF page 3670 of the extract, lines 244830-244845):

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

§2.5.12, FXSAVE and FXRSTOR (`every-syscall-saves-…`) (PDF page 97 of the extract, lines 4885-4888):

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

