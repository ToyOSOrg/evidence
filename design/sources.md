# Sources for the #915 design

Each quoted from the PDF text, extracted page by page with PyMuPDF 1.28.0. PDF page numbers are the extract's.

## Intel SDM, combined volumes, 325462-093

Fetched from `https://cdrdv2-public.intel.com/929349/325462-093-sdm-vol-1-2abcd-3abcd-4.pdf`, sha256 `a4a62e6a7ba11a76c7753a195b825087306812aac39b930973f9168ee599f321`.

### Vol. 3B §17.4.4.1, IA32_HWP_REQUEST field defaults (PDF pp. 3685-3686)

```text
When the IA32_HWP_REQUEST MSR Package Control bit is set, any valid bit that is NOT set indicates to the 
processor to use the respective field value from the IA32_HWP_REQUEST_PKG MSR. Otherwise, the values are 
derived from the IA32_HWP_REQUEST MSR. The valid bits are ignored when the IA32_HWP_REQUEST MSR 
Package Control bit is zero.
•
Minimum_Performance (bits 7:0, RW) — Conveys a hint to the HWP hardware. The OS programs the 
minimum performance hint to achieve the required quality of service (QOS) or to meet a service level 
agreement (SLA) as needed. Note that an excursion below the level specified is possible due to hardware 
constraints. The default value of this field is IA32_HWP_CAPABILITIES.Lowest_Performance.
•
Maximum_Performance (bits 15:8, RW) — Conveys a hint to the HWP hardware. The OS programs this 
field to limit the maximum performance that is expected to be supplied by the HWP hardware. Excursions 
above the limit requested by OS are possible due to hardware coordination between the processor cores and 
other components in the package. The default value of this field is 
IA32_HWP_CAPABILITIES.Highest_Performance.
•
Desired_Performance (bits 23:16, RW) — Conveys a hint to the HWP hardware. When set to zero, 
hardware autonomous selection determines the performance target. When set to a non-zero value (between 
the range of Lowest_Performance and Highest_Performance of IA32_HWP_CAPABILITIES) conveys an explicit 
performance request hint to the hardware; effectively disabling HW Autonomous selection. The Desired_Per-
formance input is non-constraining in terms of Performance and Energy Efficiency optimizations, which are 
independently controlled. The default value of this field is 0.
•
Energy_Performance_Preference (bits 31:24, RW) — Conveys a hint to the HWP hardware. The OS may 
write a range of values from 0 (performance preference) to 0FFH (energy efficiency preference) to influence 
the rate of performance increase /decrease and the result of the hardware's energy efficiency and performance 
optimizations. The default value of this field is 80H. Note: If CPUID.06H:EAX[10] indicates that this field is not 
supported, HWP uses the value of the IA32_ENERGY_PERF_BIAS MSR to determine the energy efficiency / 
performance preference.
•
Activity_Window (bits 41:32, RW) — Conveys a hint to the HWP hardware specifying a moving workload 
history observation window for performance/frequency optimizations. If 0, the hardware will determine the 
appropriate window size. When writing a non-zero value to this field, this field is encoded in the format of bits 
38:32 as a 7-bit mantissa and bits 41:39 as a 3-bit exponent value in powers of 10. The resultant value is in 
microseconds. Thus, the minimal/maximum activity window size is 1 microsecond/1270 seconds. Combined 
with the Energy_Performance_Preference input, Activity_Window influences the rate of performance increase 
Figure 17-6.  IA32_HWP_REQUEST Register 
0
63 62 61 60 59
8 7
16 15
24 23
32 31
43 42 41
Reserved
Energy_Performance_Preference
Activity_Window
Desired_Performance
Maximum_Performance
Minimum_Performance
Activity_Window Valid
EPP Valid
Desired Valid
Maximum Valid
Minimum Valid
Package_Control
=====PAGE 3686=====
17-10 Vol. 3B
POWER AND THERMAL MANAGEMENT
/ decrease. This non-zero hint only has meaning when Desired_Performance = 0. The default value of this field 
is 0.
•
Package_Control (bit 42, RW) — When set, causes this logical processor's IA32_HWP_REQUEST control 
inputs to be derived from the IA32_HWP_REQUEST_PKG MSR.
•
Bits 58:43 are reserved and must be zero.
•
Activity_Window Valid (bit 59, RW) — When set, indicates to the processor to derive the Activity Window 
field value from the IA32_HWP_REQUEST MSR even if the package control bit is set. Otherwise, derive it from 
the IA32_HWP_REQUEST_PKG MSR. The default value of this field is 0.
•
```

### Vol. 3B §17.4.1-17.4.3, HWP enumeration, enable order, IA32_HWP_CAPABILITIES (PDF pp. 3682-3684)

```text
and the specification of a relevant workload history observation time window. The means for the OS to override 
HWP's autonomous selection of performance state with a specific desired performance target is also provided, 
however, the effective frequency delivered is subject to the result of energy efficiency and performance optimiza-
tions.
17.4.1 
HWP Programming Interfaces 
The programming interfaces provided by HWP include the following:
•
The CPUID instruction allows software to discover the presence of HWP support in an Intel processor. Specifi-
cally, execute CPUID.06H will return 5 bit flags covering the following aspects in bits 7 through 11 of 
CPUID.06H:EAX:
—
Availability of HWP baseline resource and capability, CPUID.06H:EAX[7]: If this bit is set, HWP provides 
several new architectural MSRs: IA32_PM_ENABLE, IA32_HWP_CAPABILITIES, IA32_HWP_REQUEST, 
IA32_HWP_STATUS. 
—
Availability of HWP Notification upon dynamic Guaranteed Performance change, CPUID.06H:EAX[8]: If this 
bit is set, HWP provides IA32_HWP_INTERRUPT MSR to enable interrupt generation due to dynamic 
Performance changes and excursions.
—
Availability of HWP Activity window control, CPUID.06H:EAX[9]: If this bit is set, HWP allows software to 
program activity window in the IA32_HWP_REQUEST MSR.
—
Availability of HWP energy/performance preference control, CPUID.06H:EAX[10]: If this bit is set, HWP 
allows software to set an energy/performance preference hint in the IA32_HWP_REQUEST MSR.
—
Availability of HWP package level control, CPUID.06H:EAX[11]:If this bit is set, HWP provides the 
IA32_HWP_REQUEST_PKG MSR to convey OS Power Management’s control hints for all logical processors 
in the physical package.
Table 17-1.  Architectural and Non-Architectural MSRs Related to HWP
Address
Architectural
Register Name
Description
770H
Y
IA32_PM_ENABLE
Enable/Disable HWP.
771H
Y
IA32_HWP_CAPABILITIES
Enumerates the HWP performance range (static and dynamic). 
772H
Y
IA32_HWP_REQUEST_PKG
Conveys OSPM's control hints (Min, Max, Activity Window, Energy 
Performance Preference, Desired) for all logical processor in the 
physical package.
773H
Y
IA32_HWP_INTERRUPT
Controls HWP native interrupt generation (Guaranteed Performance 
changes, excursions).
774H
Y
IA32_HWP_REQUEST
Conveys OSPM's control hints (Min, Max, Activity Window, Energy 
Performance Preference, Desired) for a single logical processor.
=====PAGE 3683=====
Vol. 3B 17-7
POWER AND THERMAL MANAGEMENT
•
Additionally, HWP may provide a non-architectural MSR, MSR_PPERF, which provides a quantitative metric to 
software of hardware’s view of workload scalability. This hardware’s view of workload scalability is implemen-
tation specific.
17.4.2 
Enabling HWP 
The layout of the IA32_PM_ENABLE MSR is shown in Figure 17-4. The bit fields are described below: 
•
HWP_ENABLE (bit 0, R/W1Once) — Software sets this bit to enable HWP with autonomous selection of 
processor P-States. When set, the processor will disregard input from the legacy performance control interface 
(IA32_PERF_CTL). Note that this bit can only be enabled once from the default value. Once set, writes to the 
HWP_ENABLE bit are ignored. Only RESET will clear this bit. Default = zero (0). 
•
Bits 63:1 are reserved and must be zero.
After software queries CPUID and verifies the processor’s support of HWP, system software can write 1 to 
IA32_PM_ENABLE.HWP_ENABLE (bit 0) to enable hardware controlled performance states. The default value of 
IA32_PM_ENABLE MSR at power-on is 0, i.e., HWP is disabled.
Additional MSRs associated with HWP may only be accessed after HWP is enabled, with the exception of 
IA32_HWP_INTERRUPT and MSR_PPERF. Accessing the IA32_HWP_INTERRUPT MSR requires only HWP is present 
as enumerated by CPUID but does not require enabling HWP.
IA32_PM_ENABLE is a package level MSR, i.e., writing to it from any logical processor within a package affects all 
logical processors within that package.
17.4.3 
HWP Performance Range and Dynamic Capabilities
The OS reads the IA32_HWP_CAPABILITIES MSR to comprehend the limits of the HWP-managed performance 
range as well as the dynamic capability, which may change during processor operation. The enumerated perfor-
mance range values reported by IA32_HWP_CAPABILITIES directly map to initial frequency targets (prior to work-
load-specific frequency optimizations of HWP). However the mapping is processor family specific.
The layout of the IA32_HWP_CAPABILITIES MSR is shown in Figure 17-5. The bit fields are described below this 
figure. 
775H
Y
IA32_HWP_PECI_REQUEST_INFO
Conveys embedded system controller requests to override some of 
the OS HWP Request settings via the PECI mechanism.
777H
Y
IA32_HWP_STATUS
Status bits indicating changes to Guaranteed Performance and 
excursions to Minimum Performance. 
19CH
Y
IA32_THERM_STATUS[bits 15:12]
Conveys reasons for performance excursions.
64EH
N
MSR_PPERF
Productive Performance Count.
Figure 17-4.  IA32_PM_ENABLE MSR
Table 17-1.  Architectural and Non-Architectural MSRs Related to HWP
1  0
63
Reserved
HWP_ENABLE
=====PAGE 3684=====
17-8 Vol. 3B
POWER AND THERMAL MANAGEMENT
•
Highest_Performance (bits 7:0, RO) — Value for the maximum non-guaranteed performance level.
•
Guaranteed_Performance (bits 15:8, RO) — Current value for the guaranteed performance level. This 
value can change dynamically as a result of internal or external constraints, e.g., thermal or power limits.
•
Most_Efficient_Performance (bits 23:16, RO) — Current value of the most efficient performance level. 
This value can change dynamically as a result of workload characteristics.
•
Lowest_Performance (bits 31:24, RO) — Value for the lowest performance level that software can program 
to IA32_HWP_REQUEST.
•
Bits 63:32 are reserved and must be zero.
The value returned in the Guaranteed_Performance field is hardware's best-effort approximation of the avail-
able performance given current operating constraints. Changes to the Guaranteed_Performance value will 
primarily occur due to a shift in operational mode. This includes a power or other limit applied by an external agent, 
e.g., RAPL (see Figure 17.10.1), or the setting of a Configurable TDP level (see model-specific controls related to 
Programmable TDP Limit in Chapter 2, “Model-Specific Registers (MSRs),” in the Intel® 64 and IA-32 Architectures 
Software Developer’s Manual, Volume 4.). Notification of a change to the Guaranteed_Performance occurs via 
interrupt (if configured) and the IA32_HWP_Status MSR. Changes to Guaranteed_Performance are indicated when 
a macroscopically meaningful change in performance occurs i.e., sustained for greater than one second. Conse-
quently, notification of a change in Guaranteed Performance will typically occur no more frequently than once per 
second. Rapid changes in platform configuration, e.g., docking/undocking, with corresponding changes to a Config-
urable TDP level could potentially cause more frequent notifications.
The value returned by the Most_Efficient_Performance field provides the OS with an indication of the practical 
lower limit for the IA32_HWP_REQUEST. The processor may not honor IA32_HWP_REQUEST.Maximum Perfor-
mance settings below this value.
17.4.4 
```

### Vol. 3B §17.3.4, IA32_ENERGY_PERF_BIAS (PDF p. 3681)

```text
17.3.4 
Performance and Energy Bias Hint Support
Intel 64 processors may support additional software hint to guide the hardware heuristic of power management 
features to favor increasing dynamic performance or conserve energy consumption. 
Software can detect the processor's capability to support the performance-energy bias preference hint by exam-
ining bit 3 of ECX in CPUID.06H. The processor supports this capability if CPUID.06H:ECX.ENERGY_PERF_BIAS[3] 
is set and it also implies the presence of a new architectural MSR called IA32_ENERGY_PERF_BIAS (1B0H).
Software can program the lowest four bits of IA32_ENERGY_PERF_BIAS MSR with a value from 0-15. The values 
represent a sliding scale, where a value of 0 (the default reset value) corresponds to a hint preference for highest 
performance and a value of 15 corresponds to the maximum energy savings. A value of 7 roughly translates into a 
hint to balance performance with energy consumption.
The layout of IA32_ENERGY_PERF_BIAS is shown in Figure 17-3. The scope of IA32_ENERGY_PERF_BIAS is per 
logical processor, which means that each of the logical processors in the package can be programmed with a 
different value. This may be especially important in virtualization scenarios, where the performance / energy 
requirements of one logical processor may differ from the other. Conflicting “hints” from various logical processors 
at higher hierarchy level will be resolved in favor of performance over energy savings. 
Software can use whatever criteria it sees fit to program the MSR with an appropriate value. However, the value 
only serves as a hint to the hardware and the actual impact on performance and energy savings is model specific.
```

### Vol. 1 Table 21 (CPUID.06H): ECX[0], ECX[3] (PDF pp. 464-465)

```text
Reserved
Reserved.
ECX[0]
HW_FEEDBACK_CAP
If 1, supports IA32_MPERF and IA32_APERF 
which provide a measure of delivered processor 
performance (since last reset of the counters), 
as a percentage of the expected processor 
performance when running at the TSC 
frequency.
Platform
ECX[2:1]
Reserved
Reserved.
ECX[3]
ENERGY_PERF_BIAS
If 1, supports performance-energy bias 
preference and a new architectural MSR called 
IA32_ENERGY_PERF_BIAS (1B0H).
Platform
```

### Vol. 1: CPUID.07H:EDX[15] HYBRID; CPUID.01H:ECX[31]; the vendor-string rule; DisplayFamily/DisplayModel

```text
Platform
EDX[15]
HYBRID
If 1, the processor is identified as a hybrid part. 
If CPUID.00H.MAXLEAF ≥ 1AH and 
CPUID.1AH:EAX <> 0, then the Native Model ID 
Enumeration Leaf 1AH exists.
...
ECX[31]
Not Used
Intel processors always return 0.  Allocated for 
use by software emulation.
...
Always begin by testing for the “GenuineIntel,” message in the EBX, EDX, and ECX registers when the CPUID 
instruction is executed with EAX equal to 0. If the processor is not genuine Intel, the feature identification flags 
may have different meanings than are described in Intel documentation.
•
...
NOTE
See Section 21.1.2, “Identification of Earlier Processors,” for information on identifying earlier IA-32 processors.
The Extended Family ID needs to be examined only when the Family ID is 0FH. Integrate the fields into a display 
using the following rule:
        IF Family_ID ≠ 0FH THEN
                DisplayFamily = Family_ID;
        ELSE
                DisplayFamily = Extended_Family_ID + Family_ID;
        FI;
The Extended Model ID needs to be examined only when the Family ID is 06H or 0FH. Integrate the field into a 
display using the following rule:
        IF (Family_ID = 06H or Family_ID = 0FH) THEN
                DisplayModel = (Extended_Model_ID « 4) + Model_ID;
        ELSE
                DisplayModel = Model_ID;
        FI;
```

### Vol. 4 §2.11, Table 2-20 carries MSR_SMI_COUNT (34H)

```text
2.11 
MSRS IN THE INTEL® PROCESSOR FAMILY BASED ON SANDY BRIDGE 
MICROARCHITECTURE
Table 2-20 lists model-specific registers (MSRs) that are common to the Intel® processor family based on Sandy 
Bridge microarchitecture. These processors have a CPUID Signature DisplayFamily_DisplayModel value of 06_2AH 
or 06_2DH; see Table 2-1. Additional MSRs specific to processors with a CPUID Signature 
DisplayFamily_DisplayModel value of 06_2AH are listed in Table 2-21.
...
Thread
Register Address: 34H, 52
MSR_SMI_COUNT
SMI Counter (R/O)
Thread
31:0
SMI Count (R/O) 
Count SMIs.
63:32
Reserved.
```

### Vol. 4 §2.17: 06_8CH (the T14) supports Table 2-20

```text
ture DisplayFamily_DisplayModel value of 06_66H. 
10th generation Intel® Core™ processors are based on Comet Lake microarchitecture (with a CPUID Signature 
DisplayFamily_DisplayModel value of 06_A5H or 06_A6H) and Ice Lake microarchitecture (with a CPUID Signature 
DisplayFamily_DisplayModel value of 06_7EH). 
...
These processors support the MSR interfaces listed in Table 2-20, Table 2-21, Table 2-25, Table 2-29, Table 2-35, 
and Table 2-391. For an MSR listed in Table 2-39 that also appears in the model-specific tables of prior generations, 
Table 2-39 supersedes prior generation tables.
```

### Vol. 4: MSR_PLATFORM_INFO[47:40] is model-specific

```text
Reserved.
47:40
Maximum Efficiency Ratio (R/O) 
This is the minimum ratio (maximum efficiency) that the processor can 
operate, in units of 100MHz.
Package
```

## AMD PPR for Family 17h Model 60h A1, 55922 rev 3.06

Supplied by the orchestrator, sha256 `b48d3cb4c4f22e2ed308f9e0d2bfd5dcca814afcc8ce582066263b93679996c5`.

### CPUID_Fn00000006_EAX and _ECX (PDF pp. 61-62): no HWP; EffFreq = APERF/MPERF

```text
CPUID_Fn00000006_EAX [Thermal and Power Management] (Core::X86::Cpuid::ThermalPwrMgmtEax)
Read-only. Reset: Fixed,0000_0004h. 
_lthree[1:0]_core[3:0]_thread[1:0]; CPUID_Fn00000006_EAX
Bits
Description
31:3 Reserved. 
2
ARAT: always running APIC timer. Read-only. Reset: Fixed,1. 1=Indicates support for APIC timer always 
running feature. 
1:0
Reserved. 
...
CPUID_Fn00000006_ECX [Thermal and Power Management] (Core::X86::Cpuid::ThermalPwrMgmtEcx)
Read-only. Reset: Fixed,0000_0001h. 
61
[AMD Public Use]
=====PAGE 62=====
55922-A1 Rev 3.06 - Sep 28, 2020
PPR for AMD Family 17h Model 60h A1
These values can be over-written by Core::X86::Msr::CPUID_PWR_THERM.
_lthree[1:0]_core[3:0]_thread[1:0]; CPUID_Fn00000006_ECX
Bits
Description
31:1 Reserved. 
0
EffFreq: effective frequency interface. Read-only. Reset: Fixed,1. 1=Indicates presence of 
Core::X86::Msr::MPERF and Core::X86::Msr::APERF. 
```

### MSR0000_00E7, MSR0000_00E8

```text
MSR0000_00E7 [Max Performance Frequency Clock Count] (Core::X86::Msr::MPERF)
Read-write,Volatile. Reset: 0000_0000_0000_0000h. 
_lthree[1:0]_core[3:0]_thread[1:0]; MSR0000_00E7
Bits
Description
63:0 MPERF: maximum core clocks counter. Read-write,Volatile. Reset: 0000_0000_0000_0000h. Incremented by 
hardware at the P0 frequency while the core is in C0. This register does not increment when the core is in the 
stop-grant state. In combination with Core::X86::Msr::APERF, this is used to determine the effective frequency 
of the core. A Read of this MSR in guest mode is affected by Core::X86::Msr::TscRateMsr. This field uses 
software P-state numbering. See Core::X86::Msr::HWCR[EffFreqCntMwait], 2.1.5 [Effective Frequency].
MSR0000_00E8 [Actual Performance Frequency Clock Count] (Core::X86::Msr::APERF)
Read-write,Volatile. Reset: 0000_0000_0000_0000h. 
_lthree[1:0]_core[3:0]_thread[1:0]; MSR0000_00E8
Bits
Description
63:0 APERF: actual core clocks counter. Read-write,Volatile. Reset: 0000_0000_0000_0000h. This register 
increments in proportion to the actual number of core clocks cycles while the core is in C0. The register does not 
increment when the core is in the stop-grant state. See Core::X86::Msr::MPERF.
```

### No MSR0000_0034 anywhere in the PPR: `rg -n "MSR0000_0034" ppr.txt` prints nothing (exit 1).

### Table 1: the revision guide for this model is a reference document (docRevG), not public

```text
docRevG
Revision Guide for AMD Family 17h Models 60h-6Fh Processors
docSATA
```
