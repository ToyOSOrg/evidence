**Sources the speed track's stages cite**, quoted verbatim from text extracted with PyMuPDF 1.28.0 (`page.get_text()`). Each quote is a line range of the extract; the page is the PDF's.

## Intel® 64 and IA-32 Architectures Software Developer's Manual, combined volumes, 325462-093

Fetched from `https://cdrdv2-public.intel.com/929349/325462-093-sdm-vol-1-2abcd-3abcd-4.pdf`, SHA-256 `a4a62e6a7ba11a76c7753a195b825087306812aac39b930973f9168ee599f321`.

Vol. 3A §7.6, the instruction boundary (`every-syscall-saves-…`) (PDF page 3355 of the extract):

```text
7.6 
PROGRAM OR TASK RESTART
To allow the restarting of program or task following the handling of an exception or an interrupt, all exceptions 
(except aborts) are guaranteed to report exceptions on an instruction boundary. All interrupts are guaranteed to be 
taken on an instruction boundary.
```

Vol. 3A §11.10.4, what a halted CPU costs the poster (`idle-is-hlt-…`) (PDF page 3512 of the extract):

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

Vol. 3A §11.10.5, padding to the monitor line size (`idle-is-hlt-…`) (PDF page 3513 of the extract):

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

Vol. 3A §11.10.6.4, MONITOR/MWAIT in the C1 idle loop (`idle-is-hlt-…`) (PDF page 3516 of the extract):

```text
11.10.6.4  Potential Usage of MONITOR/MWAIT in C1 Idle Loops
An operating system may also consider replacing HLT with MONITOR/MWAIT in its C1 idle loop. An example is 
```

Vol. 3A §13.5.4.1, TSC-deadline mode (`the-timer-is-a-lapic-count-…`) (PDF page 3587 of the extract):

```text
13.5.4.1  TSC-Deadline Mode
The mode of operation of the local-APIC timer is determined by the LVT Timer Register. Specifically:
•
If CPUID.01H:ECX.TSC_DEADLINE[24] = 0, the mode is determined by bit 17 of the register.
•
```

Vol. 3A §13.5.4.1, continued (PDF page 3588 of the extract):

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

Vol. 3A §16.4, saving FP state on a switch (`every-syscall-saves-…`) (PDF page 3670 of the extract):

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

Vol. 3A §16.4, continued (PDF page 3671 of the extract):

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

§11.4, MONITOR/MWAIT in the C1 loop (`idle-is-hlt-…`) (PDF page 374 of the extract):

```text
SSE3 provides two instructions (MONITOR/MWAIT) to help multithreaded software improve synchronization 
between multiple agents. In the first implementation of MONITOR and MWAIT, these instructions are available to 
operating system so that operating system can optimize thread synchronization in different areas. For example, an 
operating system can use MONITOR and MWAIT in its system idle loop (known as C0 loop) to reduce power 
consumption. An operating system can also use MONITOR and MWAIT to implement its C1 loop to improve the 
responsiveness of the C1 loop. See Chapter 9, “Multiple-Processor Management” in the Intel® 64 and IA-32 
Architectures Software Developer’s Manual, Volume 3A.
```

§11.4.5, sharing of modified data and false sharing (`per-cpu-scheduler-…`) (PDF page 379 of the extract):

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
```

§11.4.5, User/Source Coding Rule 17 (PDF page 380 of the extract):

```text
User/Source Coding Rule 17. (H impact, M generality) Beware of false sharing within a cache line or within a sector. 
Allocate critical data or locks separately using alignment granularity not smaller than the “false-sharing threshold”. 
When a common block of parameters is passed from a parent thread to several worker threads, it is desirable for each 
work thread to create a private copy (each copy aligned to multiples of the “false-sharing threshold”) of frequently 
accessed data in the parameter block.
```

## AMD64 Architecture Programmer's Manual, Volume 2, 24593 rev. 3.42

Fetched through the Internet Archive's snapshot `https://web.archive.org/web/20250405225925id_/https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/programmer-references/24593.pdf` (amd.com reset the connection), SHA-256 `0829b862bf93e0d455b1d418664dc6ab3f494e866af53b2a04dff0f0b48eb649`. It says nothing on an idle loop's MWAIT, on TSC-deadline mode or on false sharing.

§2.5.12, FXSAVE and FXRSTOR (`every-syscall-saves-…`) (PDF page 97 of the extract):

```text
2.5.12  FXSAVE and FXRSTOR Instructions
The FXSAVE and FXRSTOR instructions are used to save and restore the entire 128-bit media 
(XMM), 64-bit media, and x87 instruction-set environment during a context switch. The AMD64 
architecture modifies the memory format used by these instructions in order to save and restore the full 
```

## Intel, Guidance for Enabling FSGSBASE, ID 767615, updated 9/15/2019

Fetched from `https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/best-practices/guidance-enabling-fsgsbase.html`, tags stripped. Lines of the stripped text:

```text
 Intel is continually adding new processor features. Some require virtually no additional system software support or are entirely transparent to software; others have touch points across the software stack. FSGSBASE is one feature that falls into the latter category. 
 FSGSBASE is an Intel® architecture extension that allows applications to directly write to the  FS  and  GS  segment registers. This allows fast switching to different threads in user applications, as well as providing an additional address register for application use. In addition it allows the kernel to do more efficient context switching. 
 FSGSBASE is a processor feature, introduced in 3rd Generation Intel® Core™ processors based on the Ivy Bridge microarchitecture, which allows expanded direct access from user level software to the  FS  and  GS  base registers. Previously, applications had to access these registers via system calls, which can be much slower than direct access. Enabling direct access also effectively grows the set of registers available to applications, improving performance. 
 Given the purpose of this bit,  Intel recommends that it be used with caution and never in production environments unless accompanied by a complete OS implementation. Incomplete implementations, such as those listed above, can be exploited to gain privilege escalation. 
```

## Lozi et al., "The Linux Scheduler: a Decade of Wasted Cores", EuroSys '16, doi 10.1145/2901318.2901326

Fetched from `https://people.ece.ubc.ca/sasha/papers/eurosys16-final29.pdf`, SHA-256 `c0d99ee07a3ec791e0e75b60a2834a6f46afb41c0959230aae4110d5321f9515`.

Abstract (`a-wake-to-a-busy-cpu-…`) (PDF page 1 of the extract):

```text
Abstract
As a central part of resource management, the OS thread
scheduler must maintain the following, simple, invariant:
make sure that ready threads are scheduled on available
cores. As simple as it may seem, we found that this invari-
ant is often broken in Linux. Cores may stay idle for sec-
onds while ready threads are waiting in runqueues. In our
```

Venue (PDF page 1 of the extract):

```text
EuroSys ’16,
April 18 - 21, 2016, London, United Kingdom
Copyright c
⃝2016 held by owner/author(s). Publication rights licensed to ACM.
ACM 978-1-4503-4240-7/16/04...$15.00
DOI: http://dx.doi.org/10.1145/2901318.2901326
```

Introduction (PDF page 2 of the extract):

```text
These bugs have different root causes, but a common
symptom. The scheduler unintentionally and for a long
time leaves cores idle while there are runnable threads
waiting in runqueues. Short-term occurrences of this condi-
tion are acceptable: the system may temporarily enter such
a state when, for instance, a thread exits or blocks or when
a thread is created or becomes unblocked. Long-term occur-
rences are not an expected behavior. The Linux scheduler is
work-conserving, meaning that it should never leave cores
idle if there is work to do. Long-term presence of this symp-
tom is, therefore, unintentional: it is due to bugs and it hurts
performance.
```

Algorithm 2 (PDF page 11 of the extract):

```text
by the software. The invariant veriﬁed by our sanity checker
is shown in Algorithm 2. It veriﬁes that no core is idle while
another core’s runqueue has waiting threads. We strived to
keep the code simple, perhaps at the expense of a higher
algorithmic complexity, to minimize the chance of bugs in
the sanity checker itself.
Algorithm 2 “No core remains idle while another core is
overloaded”
```

