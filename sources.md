**Sources the speed track's stages cite**, quoted verbatim. No Linux source, commit or reading is quoted: the tree cites none. A PDF's text is extracted with PyMuPDF 1.28.0 (`page.get_text()`); each quote is a line range of the extract, and the page is the PDF's. A PDF's text drops its section headings' numbers, so a section is numbered by the document's own cross-references to it.

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

## Intel, 11th Generation Intel® Core™ Processor Specification Update, 631123-034

Fetched from `https://cdrdv2.intel.com/v1/dl/getContent/631123` (served as `https://cdrdv2-public.intel.com/631123/631123_034.pdf`), SHA-256 `9eaacfd64a426fa384034a91a73d59b5262ce2d01381d71429adfad4779f3e4f`. Its errata summary (TGL001-TGL075, PDF pages 12-17) was read whole: no title names the TSC, TSC-deadline mode, the APIC timer, MONITOR or MWAIT, and a search of the whole extract for `tsc`, `deadline`, `apic`, `mwait`, `monitor` and `timer` finds only TGL004/TGL010's APIC page, TGL040/TGL044's internal timer error, TGL066's display monitor and TGL073's virtual machine monitor.

The title and revision (extract lines 3-22):

```text
Document Number: 631123-034 
 
 
 
 
 
 
11th Generation Intel® Core™ 
Processor 
 
Specification Update 
 
Supporting 11th Generation Intel® Core™ Processor, Intel® 
Pentium® Processor, and Intel® Celeron® Processor for UP3, 
UP3 IOT, UP4, H35, H81, UP3-Refresh, and H35-Refresh 
Processor Line Platforms, formerly known as Tiger Lake 
 
Revision 034 
 
April 2026 
```

The T14's processor, family 6 model 140 stepping 1, is the UP3 line's 000806C1h (extract lines 399-406):

```text
UP3/UP4/H35 000806C1h R e s e r v e d 
0000000b 
1000b 
Reserved 
00b 
0110b 
1100b 
0001b 
```

## Intel, Pentium® and Celeron® Processor N- and J- Series Specification Update, 334820-010

Fetched from `https://cdrdv2.intel.com/v1/dl/getContent/334820` (served as `https://cdrdv2-public.intel.com/334820/334820-APL_Spec_Update_rev010.pdf`), SHA-256 `0138c484022b88927e91d4e9459137119fea2f1fda7b6d716135cfae9a6af250`.

The title (extract lines 1-14):

```text
=====PAGE 1=====
Document Number:  334820-010 
 
 
 
 
 
Intel® Pentium® and Celeron® Processor 
N- and J- Series
 
Specification Update 
 
August 2022 
 
```

The signature, family 6, extended model 5, model C (extract lines 993-1006):

```text
27:20 
19:16 
15:13 
12 
11:8 
7:4 
3:0 
0x0 
0x00 
0x5 
0 
0 
0x6 
0xC 
```

APL30 (extract lines 1858-1872):

```text
APL30 A Store Instruction May Not Wake Up MWAIT 
Problem: 
One use of the MONITOR/MWAIT instruction pair is to allow a logical 
processor to wait in a sleep state until a store to the armed address range 
occurs. Due to this erratum, stores to the armed address range may not 
trigger MWAIT to resume execution. 
Implication: 
The logical processor that executed the MWAIT instruction may not resume 
execution until it receives an interrupt. Software that does not rely on stores 
to the armed address range to wake a logical processor from an MWAIT 
sleep state is not affected by this erratum. 
Workaround: 
Software needs to use interrupts to wake processors from MWAIT-induced 
sleep states. 
Status: 
```

## Intel, Core™ Ultra 200V Series specification update

Not read. No document number was found: DuckDuckGo answered 202 and Mojeek a captcha, Bing ignored the quoted title, and the Internet Archive, through which citeseerx and Intel's older links are served, answered 503 (Temporarily Offline).

## Stoica, Abdel-Wahab, Jeffay, Baruah, Gehrke and Plaxton, "A Proportional Share Resource Allocation Algorithm for Real-Time, Time-Shared Systems", RTSS 1996

Fetched from `https://www.cs.unc.edu/~jeffay/papers/RTSS-96a.pdf`, SHA-256 `3b4f7f194cb21db263d7959c5b187292e3fc316f0a9578232fb3b14ee360ae78`. PyMuPDF extracts this PDF a word fragment per line, with its digits lost to the font; the quotes are the extract joined with spaces and folded at 200 columns. Stoica and Abdel-Wahab's ODU TR-95-22, the ruling's paper, was not fetched this round: citeseerx now redirects to the Internet Archive, which answered 503.

The model's quanta (PDF page 3) (extract lines 57-58):

```text
erwise. W e assume that the resource is allo cated in time quan ta of size at most q . A t the b eginning of eac h time quan tum a clien t is selected to use the resource. Once the clien t acquires 
the resource, it ma y use it either for the en tire time quan tum, or it ma y release it b efore the time quan tum expires. Although simple, this mo del captures the basic mec hanisms traditionally 
```

The lag bound (PDF page 5) (extract lines 121-121):

```text
ounds). In comparison, our algorithm (describ ed next) guaran tees optimal lag b ounds of one time quan tum. Third, w e prop ose a new appro ximation sc heme for main taining virtual time, in whic h 
```

The algorithm (PDF page 6) (extract lines 162-163):

```text
times and deadlines and not of the real times. With this, the Earliest Eligible Virtual Deadline First (EEVDF) algorithm can b e simply stated as follo ws: EEVDF Algorithm. A new quantum is al lo c 
ate d to the client which has the eligible r e quest with the e arliest virtual de ad line. Since EEVDF is form ulated in terms of virtual- times, in the remaining of this pap er w e use v e and v d 
```

## AMD, Processor Programming Reference (PPR) for AMD Family 17h Model 60h, Revision A1 Processors, 55922 rev. 3.06

`55922-A1-PUB_3.06.pdf`, supplied by the owner, SHA-256 `b48d3cb4c4f22e2ed308f9e0d2bfd5dcca814afcc8ce582066263b93679996c5`. Its text was searched for `mwait`, `monitor`, `c-state`, `idle`, `halt`, `false shar`, `deadline`: it names no idle loop, nothing on false sharing, and no TSC-deadline mode.

The title (extract lines 2-7):

```text
55922-A1 Rev 3.06 - Sep 28, 2020
PPR for AMD Family 17h Model 60h A1
Processor Programming
Reference (PPR)
for AMD Family 17h
Model 60h, Revision A1
```

CPUID_Fn00000001_EBX, the CLFLUSH size (extract lines 4001-4001):

```text
15:8 CLFlush. Read-only. Reset: Fixed,08h. CLFLUSH size in quadwords.
```

CPUID_Fn00000001_ECX bit 24, reserved (extract lines 4031-4032):

```text
24
Reserved. 
```

CPUID_Fn00000001_ECX bit 3, MONITOR/MWAIT (extract lines 4053-4054):

```text
3
Monitor. Read-only. Reset: !Core::X86::Msr::HWCR[MonMwaitDis]. Monitor/Mwait instructions.
```

CPUID_Fn00000005, the monitor line and MWAIT's sub-states (extract lines 4130-4163):

```text
CPUID_Fn00000005_EAX [Monitor/MWait] (Core::X86::Cpuid::MonMWaitEax)
Read-only. Reset: Fixed,0000_0040h. 
_lthree[1:0]_core[3:0]_thread[1:0]; CPUID_Fn00000005_EAX
Bits
Description
31:16 Reserved. 
15:0 MonLineSizeMin. Read-only. Reset: Fixed,0040h. Smallest monitor-line size in bytes.
CPUID_Fn00000005_EBX [Monitor/MWait] (Core::X86::Cpuid::MonMWaitEbx)
Read-only. Reset: Fixed,0000_0040h. 
_lthree[1:0]_core[3:0]_thread[1:0]; CPUID_Fn00000005_EBX
Bits
Description
31:16 Reserved. 
15:0 MonLineSizeMax. Read-only. Reset: Fixed,0040h. Largest monitor-line size in bytes.
CPUID_Fn00000005_ECX [Monitor/MWait] (Core::X86::Cpuid::MonMWaitEcx)
Read-only. Reset: Fixed,0000_0003h. 
_lthree[1:0]_core[3:0]_thread[1:0]; CPUID_Fn00000005_ECX
Bits
Description
31:2 Reserved. 
1
IBE. Read-only. Reset: Fixed,1. Interrupt break-event.
0
EMX. Read-only. Reset: Fixed,1. Enumerate MONITOR/MWAIT extensions.
CPUID_Fn00000005_EDX [Monitor/MWait] (Core::X86::Cpuid::MonMWaitEdx)
Read-only. Reset: Fixed,0000_0011h. 
_lthree[1:0]_core[3:0]_thread[1:0]; CPUID_Fn00000005_EDX
Bits
Description
31:8 Reserved. 
7:4
MWaitC1SubStates. Read-only. Reset: Fixed,1h. Number of C1 sub-cstates supported by MWAIT.
3:0
MWaitC0SubStates. Read-only. Reset: Fixed,1h. Number of C0 sub-cstates supported by MWAIT.
```

## AMD, Software Optimization Guide for AMD Family 17h Processors, 55723 rev. 3.00

`amd_zen.pdf`, supplied by the owner, SHA-256 `05ccc2b153b167e813f2c621142c8c47f64bffdd04d3184ecf6bf82497c9822d`. Its block diagram is titled for models 00h-0Fh (extract line 586), and it refers to the PPR for models 00h-0Fh (line 191). Its text was searched for `shar`, `false`, `mwait`, `monitor`, `idle`, `coheren`: it says nothing on false sharing, MONITOR, MWAIT or an idle loop.

The title page (extract lines 1-11):

```text
=====PAGE 1=====
Advanced Micro Devices 
 
Software Optimization 
Guide for
AMD Family 17h Processors
Publication No.
Revision
Date
55723
3.00
```

§2.6.1, the line size (extract lines 610-613):

```text
L1 Instruction Cache
The AMD Family 17h processor contains a 64-Kbyte, 4-way set associative L1 instruction cache. 
Cache line size is 64 bytes; 32 bytes are fetched in a cycle. Functions associated with the L1 
instruction cache are fetching cache lines from the L2 cache, providing instruction bytes to the 
```

§2.6.4, the L3 and the cache-to-cache transfer (extract lines 694-704):

```text
L3 Cache
The AMD Family 17h processor implements a 4 MB or 8 MB L3 cache (depending on SOC 
configuration) that is 16-way set associative and shared by four cores inside a CPU complex.  The L3 
is a write-back cache populated by L2 victims.  When there is an L3 hit, the line is invalidated from 
the L3 if the access was a store.  It is invalidated from the L3 if the access was a load and the line was 
read by just one core.  It stays valid in the L3 if it was a code fetch.  It stays valid in the L3 if it was a 
load and the line has been read by more than one core. The L3 maintains shadow tags for each L2 
cache in the complex. If a core misses in its local L2 and also in the L3, the shadow tags are 
consulted. If the shadow tags indicate that the data resides in another L2 within the complex, a cache-
to-cache transfer is initiated within the complex. The L3 has an average load-to-use latency of 35 
cycles. The non-temporal cache fill hint, indicated with PREFETCHNTA, reduces cache pollution for 
```


## Intel® Core™ i5-1135G7 Processor, Intel's product specification

Fetched on 2026-10-13 from `https://www.intel.com/content/www/us/en/products/sku/208658/intel-core-i51135g7-processor-8m-cache-up-to-4-20-ghz/specifications.html`, SHA-256 `8e3bd3f42d571ea622a090db17acfd8b4c87634a275d0a7e5183cd93fd0cbe3d`. The page's markup is stripped (`<script>` blocks, then tags, then HTML entities); each row is a label and the value the page gives it. The speed track's clock item (`toyos-uses-what-modern-hardware-offers-for-speed.md`) takes these as its target.

```text
Code Name: Products formerly Tiger Lake
Total Cores: 4
Total Threads: 8
Max Turbo Frequency: 4.20 GHz
Configurable TDP-up Base Frequency: 2.40 GHz
Configurable TDP-up: 28 W
Configurable TDP-down Base Frequency: 900 MHz
Configurable TDP-down: 12 W
Max Turbo Frequency refers to the maximum single-core processor frequency that can be achieved with Intel® Turbo Boost Technology. See
```
