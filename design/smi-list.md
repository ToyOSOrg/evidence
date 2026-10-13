# MSR_SMI_COUNT (34H): which DisplayFamily_DisplayModel values SDM 325462-093 Vol. 4 gives it

Text from the same extraction as `sources.md` (line numbers are of `vol4.txt`, the SDM extract from its line 309400 on).

## The tables that carry 34H

`rg -n "^Register Address: 34H" vol4.txt` prints exactly six lines, and the table each sits in is the last `Table 2-N.` heading before it:

```text
9588: Table 2-6.   MSRs Common to Intel Atom® Processors (Silvermont and Newer Microarchitectures) 
13554: Table 2-15.  MSRs in Processors Based on Nehalem Microarchitecture
17335: Table 2-20.  MSRs Supported by Intel® Processors Based on Sandy Bridge Microarchitecture
35013: Table 2-56.  Additional MSRs Supported by the Intel® Xeon® 6 P-Core Processors 
36419: Table 2-57.  Additional MSRs Supported by the Intel® Xeon® 6 E-Core Processors 
38198: Table 2-61.  Selected MSRs Supported by Intel® Xeon Phi™ Processors with a CPUID Signature 
```

## Each section that names a model and a table above

### lines 9484-9493

```text
2.4 
MSRS IN INTEL PROCESSORS BASED ON SILVERMONT 
MICROARCHITECTURE
Table 2-6 lists model-specific registers (MSRs) common to Intel processors based on the Silvermont microarchitec-
ture. These processors have a CPUID Signature DisplayFamily_DisplayModel value of 06_37H, 06_4AH, 06_4DH, 
06_5AH, or 06_5DH; see Table 2-1. The MSRs listed in Table 2-6 are also common to processors based on the 
Airmont microarchitecture and newer microarchitectures for next generation Intel Atom processors.
Table 2-7 lists MSRs common to processors based on the Silvermont and Airmont microarchitectures, but not 
newer microarchitectures.
Table 2-8, Table 2-9, and Table 2-10 lists MSRs that are model-specific across processors based on the Silvermont 
```

### lines 10898-10902

```text
2.4.2  
MSRs in Intel Atom® Processors Based on Airmont Microarchitecture
Intel Atom processor X7-Z8000 and X5-Z8000 series are based on the Airmont microarchitecture. These proces-
sors support MSRs listed in Table 2-6, Table 2-7, Table 2-8, and Table 2-11. These processors have a CPUID 
Signature DisplayFamily_DisplayModel value of 06_4CH; see Table 2-1. 
```

### lines 11039-11043

```text
2.5 
MSRS IN INTEL ATOM® PROCESSORS BASED ON GOLDMONT 
MICROARCHITECTURE
Intel Atom processors based on the Goldmont microarchitecture support MSRs listed in Table 2-6 and Table 2-12. 
These processors have a CPUID Signature DisplayFamily_DisplayModel value of 06_5CH; see Table 2-1. 
```

### lines 12996-13002

```text
2.6 
MSRS IN INTEL ATOM® PROCESSORS BASED ON GOLDMONT PLUS 
MICROARCHITECTURE
Intel Atom processors based on the Goldmont Plus microarchitecture support MSRs listed in Table 2-6, Table 2-12, 
and Table 2-13. These processors have a CPUID Signature DisplayFamily_DisplayModel value of 06_7AH; see Table 
2-1. For an MSR listed in Table 2-13 that also appears in the model-specific tables of prior generations, Table 2-13 
supersedes prior generation tables.
```

### lines 13369-13375

```text
2.7 
MSRS IN INTEL ATOM® PROCESSORS BASED ON TREMONT 
MICROARCHITECTURE
Processors based on the Tremont microarchitecture support MSRs listed in Table 2-6, Table 2-12, Table 2-13, and 
Table 2-14. These processors have a CPUID Signature DisplayFamily_DisplayModel value of 06_86H, 06_96H, or 
06_9CH; see Table 2-1. For an MSR listed in Table 2-14 that also appears in the model-specific tables of prior 
generations, Table 2-14 supersedes prior generation tables.
```

### lines 13437-13441

```text
2.8 
MSRS IN PROCESSORS BASED ON NEHALEM MICROARCHITECTURE
Table 2-15 lists model-specific registers (MSRs) that are common for Nehalem microarchitecture. These include the 
Intel Core i7 and i5 processor family. These processors have a CPUID Signature DisplayFamily_DisplayModel value 
of 06_1AH, 06_1EH, 06_1FH, or 06_2EH; see Table 2-1. Additional MSRs specific to processors with a CPUID 
```

### lines 17002-17007

```text
2.9 
MSRS IN THE INTEL® XEON® PROCESSOR 5600 SERIES BASED ON 
WESTMERE MICROARCHITECTURE
The Intel® Xeon® Processor 5600 Series is based on Westmere microarchitecture and supports the MSR interfaces 
listed in Table 2-15, Table 2-16, plus additional MSRs listed in Table 2-18. These MSRs apply to the Intel Core i7, i5, 
and i3 processor family with a CPUID Signature DisplayFamily_DisplayModel value of 06_25H or 06_2CH; see Table 
```

### lines 17072-17077

```text
2.10 
MSRS IN THE INTEL® XEON® PROCESSOR E7 FAMILY BASED ON WESTMERE 
MICROARCHITECTURE
The Intel® Xeon® Processor E7 Family is based on the Westmere microarchitecture and supports the MSR inter-
faces listed in Table 2-15 (except MSR address 1ADH), Table 2-16, plus additional MSRs listed in Table 2-19. These 
processors have a CPUID Signature DisplayFamily_DisplayModel value of 06_2FH.
```

### lines 17297-17302

```text
2.11 
MSRS IN THE INTEL® PROCESSOR FAMILY BASED ON SANDY BRIDGE 
MICROARCHITECTURE
Table 2-20 lists model-specific registers (MSRs) that are common to the Intel® processor family based on Sandy 
Bridge microarchitecture. These processors have a CPUID Signature DisplayFamily_DisplayModel value of 06_2AH 
or 06_2DH; see Table 2-1. Additional MSRs specific to processors with a CPUID Signature 
```

### lines 20359-20364

```text
2.12 
MSRS IN THE 3RD GENERATION INTEL® CORE™ PROCESSOR FAMILY BASED 
ON IVY BRIDGE MICROARCHITECTURE
The 3rd generation Intel® Core™ processor family and the Intel® Xeon® processor E3-1200v2 product family 
based on Ivy Bridge microarchitecture support the MSR interfaces listed in Table 2-20, Table 2-21, Table 2-22, and 
Table 2-25. These processors have a CPUID Signature DisplayFamily_DisplayModel value of 06_3AH. 
```

### lines 20569-20575

```text
2.12.1  
MSRs in the Intel® Xeon® Processor E5 v2 Product Family Based on Ivy Bridge-E 
Microarchitecture
Table 2-26 lists model-specific registers (MSRs) that are specific to the Intel® Xeon® Processor E5 v2 Product 
Family (based on Ivy Bridge-E microarchitecture). These processors have a CPUID Signature 
DisplayFamily_DisplayModel value of 06_3EH; see Table 2-1. These processors supports the MSR interfaces listed 
in Table 2-20 and Table 2-26. 
```

### lines 21468-21472

```text
2.12.2  
Additional MSRs Supported by the Intel® Xeon® Processor E7 v2 Family
The Intel® Xeon® processor E7 v2 family (based on Ivy Bridge-E microarchitecture) with a CPUID Signature 
DisplayFamily_DisplayModel value of 06_3EH supports the MSR interfaces listed in Table 2-20, Table 2-26, and 
Table 2-27. 
```

### lines 22100-22106

```text
2.13 
MSRS IN THE 4TH GENERATION INTEL® CORE™ PROCESSORS BASED ON 
HASWELL MICROARCHITECTURE
The 4th generation Intel® Core™ processor family and the Intel® Xeon® processor E3-1200v3 product family 
(based on Haswell microarchitecture), with a CPUID Signature DisplayFamily_DisplayModel value of 06_3CH, 
06_45H, or 06_46H, support the MSR interfaces listed in Table 2-20, Table 2-21, Table 2-22, and Table 2-29. For 
an MSR listed in Table 2-20 that also appears in Table 2-29, Table 2-29 supersedes Table 2-20.
```

### lines 23376-23383

```text
2.14 
MSRS IN THE INTEL® XEON® PROCESSOR E5 V3 AND E7 V3 PRODUCT 
FAMILY
The Intel® Xeon® processor E5 v3 family and the Intel® Xeon® processor E7 v3 family are based on Haswell-E 
microarchitecture (CPUID Signature DisplayFamily_DisplayModel value of 06_3F). These processors support the 
MSR interfaces listed in Table 2-20, Table 2-29, and Table 2-32. 
59:0
Package C9 Residency Counter (R/O)
```

### lines 25571-25580

```text
2.15 
MSRS IN THE INTEL® CORE™ M PROCESSORS AND THE 5TH GENERATION 
INTEL® CORE™ PROCESSORS
The Intel® Core™ M-5xxx processors, 5th generation Intel® Core™ Processors, and the Intel® Xeon® Processor 
E3-1200 v4 family are based on Broadwell microarchitecture. The Intel® Core™ M-5xxx processors and 5th gener-
ation Intel® Core™ Processors have a CPUID Signature DisplayFamily_DisplayModel value of 06_3DH. The Intel® 
Xeon® Processor E3-1200 v4 family and 5th generation Intel® Core™ Processors have a CPUID Signature 
DisplayFamily_DisplayModel value of 06_47H. Processors with a CPUID Signature DisplayFamily_DisplayModel 
value of 06_3DH or 06_47H support the MSR interfaces listed in Table 2-20, Table 2-21, Table 2-22, Table 2-25, 
Table 2-29, Table 2-30, Table 2-34, and Table 2-35. For an MSR listed in Table 2-35 that also appears in the model-
```

### lines 26697-26702

```text
2.16.1  
Additional MSRs Supported in the Intel® Xeon® Processor D Product Family
The MSRs listed in Table 2-37 are available to Intel® Xeon® Processor D Product Family (CPUID Signature 
DisplayFamily_DisplayModel value of 06_56H). The Intel® Xeon® processor D product family is based on Broadwell 
microarchitecture and supports the MSR interfaces listed in Table 2-20, Table 2-29, Table 2-34, Table 2-36, and 
Table 2-37. 
```

### lines 26919-26924

```text
2.16.2  
Additional MSRs Supported in Intel® Xeon® Processors E5 v4 and E7 v4 Families
The MSRs listed in Table 2-37 are available to the Intel® Xeon® Processor E5 v4 and E7 v4 Families (CPUID 
Signature DisplayFamily_DisplayModel value of 06_4FH). The Intel® Xeon® processor E5 v4 family is based on 
Broadwell microarchitecture and supports the MSR interfaces listed in Table 2-20, Table 2-21, Table 2-29, Table 
2-34, Table 2-36, and Table 2-38. 
```

### lines 27495-27553

```text
2.17 
MSRS IN THE 6TH—13TH GENERATION INTEL® CORE™ PROCESSORS, 
1ST—5TH GENERATION INTEL® XEON® SCALABLE PROCESSOR FAMILIES, 
INTEL® CORE™ ULTRA 7 PROCESSORS, 8TH GENERATION INTEL® CORE™ I3 
PROCESSORS, INTEL® XEON® E PROCESSORS, INTEL® XEON® 6 P-CORE 
PROCESSORS, INTEL® XEON® 6 E-CORE PROCESSORS, AND INTEL® SERIES 2 
CORE™ ULTRA PROCESSORS
6th generation Intel® Core™ processors are based on Skylake microarchitecture and have a CPUID Signature 
DisplayFamily_DisplayModel value of 06_4EH or 06_5EH. 
The Intel® Xeon® Scalable Processor Family based on the Skylake microarchitecture, the 2nd generation Intel® 
Xeon® Scalable Processor Family based on the Cascade Lake product, and the 3rd generation Intel® Xeon® Scal-
able Processor Family based on the Cooper Lake product all have a CPUID Signature DisplayFamily_DisplayModel 
value of 06_55H. 
7th generation Intel® Core™ processors are based on the Kaby Lake microarchitecture, 8th generation and 9th 
generation Intel® Core™ processors, and Intel® Xeon® E processors are based on Coffee Lake microarchitecture; 
these processors have a CPUID Signature DisplayFamily_DisplayModel value of 06_8EH or 06_9EH. 
8th generation Intel® Core™ i3 processors are based on Cannon Lake microarchitecture and have a CPUID Signa-
ture DisplayFamily_DisplayModel value of 06_66H. 
10th generation Intel® Core™ processors are based on Comet Lake microarchitecture (with a CPUID Signature 
DisplayFamily_DisplayModel value of 06_A5H or 06_A6H) and Ice Lake microarchitecture (with a CPUID Signature 
DisplayFamily_DisplayModel value of 06_7EH). 
11th generation Intel® Core™ processors are based on Tiger Lake microarchitecture and have a CPUID Signature 
DisplayFamily_DisplayModel value of 06_8CH or 06_8DH.
The 3rd generation Intel® Xeon® Scalable Processor Family is based on Ice Lake microarchitecture and has a 
CPUID Signature DisplayFamily_DisplayModel value of 06_6AH or 06_6CH.
12th generation Intel® Core™ processors supporting the Alder Lake performance hybrid architecture have a CPUID 
Signature DisplayFamily_DisplayModel value of 06_97H or 06_9AH.
13th generation Intel® Core™ processors supporting the Raptor Lake performance hybrid architecture have a 
CPUID Signature DisplayFamily_DisplayModel value of 06_BAH, 06_B7H, or 06_BFH.
The 4th generation Intel® Xeon® Scalable Processor Family is based on Sapphire Rapids microarchitecture and has 
a CPUID Signature DisplayFamily_DisplayModel value of 06_8FH.
The 5th generation Intel® Xeon® Scalable Processor Family is based on Emerald Rapids microarchitecture and has 
a CPUID Signature DisplayFamily_DisplayModel value of 06_CFH.
The Intel® Core™ Ultra 7 processors supporting the Meteor Lake hybrid architecture have a CPUID Signature 
DisplayFamily_DisplayModel value of 06_AAH.
The Intel® Xeon® 6 P-core processor is based on the Granite Rapids microarchitecture and has a CPUID Signature 
DisplayFamily_DisplayModel value of 06_ADH or 06_AEH.
The Intel® Xeon® 6 E-core processor is based on the Sierra Forest microarchitecture and has a CPUID Signature 
DisplayFamily_DisplayModel value of 06_AFH.
The Intel® Series 2 Core™ Ultra processors supporting the Lunar Lake performance hybrid architecture have a 
CPUID Signature DisplayFamily_DisplayModel value of 06_BDH.
NOTES:
1. An override configuration lower than the factory-set configuration is always supported. An override configuration higher than the fac-
tory-set configuration is dependent on features specific to the processor and the platform.
=====PAGE 5098=====
2-360 Vol. 4
MODEL-SPECIFIC REGISTERS (MSRS)
These processors support the MSR interfaces listed in Table 2-20, Table 2-21, Table 2-25, Table 2-29, Table 2-35, 
and Table 2-391. For an MSR listed in Table 2-39 that also appears in the model-specific tables of prior generations, 
Table 2-39 supersedes prior generation tables.
Tables 2-40 through 2-60 list additional supported MSR interfaces introduced in specific processors; see each table 
for additional details.
The notation of “Platform” in the Scope column (with respect to MSR_PLATFORM_ENERGY_COUNTER and 
MSR_PLATFORM_POWER_LIMIT) is limited to the power-delivery domain and the specifics of the power delivery 
integration may vary by platform vendor’s implementation.
1.
MSRs at the following addresses are not supported in the 12th generation Intel Core processor E-core: 3F7H. MSRs at the following 
addresses are not supported in the 12th generation Intel Core processor E-core or P-core: 652H, 653H, 655H, 656H, DB0H, DB1H, 
DB2H, and D90H. 
```

### lines 34956-34960

```text
2.17.10  MSRs Introduced in the Intel® Xeon® 6 P-Core Processors
Table 2-56 lists additional MSRs for the Intel Xeon 6 P-core processors. Intel Xeon 6 P-core processors have a 
CPUID Signature DisplayFamily_DisplayModel value of 06_ADH or 06_AEH. 
For an MSR listed in Table 2-56 that also appears in the model-specific tables of prior generations, Table 2-56 
supersedes prior generation tables.
```

### lines 36365-36369

```text
2.17.11  MSRs Introduced in the Intel® Xeon® 6 E-Core Processors
Table 2-57 lists additional MSRs for the Intel Xeon 6 E-core processors. Intel Xeon 6 E-core processors have a 
CPUID Signature DisplayFamily_DisplayModel value of 06_AFH. 
For an MSR listed in Table 2-57 that also appears in the model-specific tables of prior generations, Table 2-57 
supersedes prior generation tables.
```

### lines 38157-38164

```text
2.18 
MSRS IN THE INTEL® XEON PHI™ PROCESSOR 3200/5200/7200 SERIES 
AND THE INTEL® XEON PHI™ PROCESSOR 7215/7285/7295 SERIES
The Intel® Xeon Phi™ processor 3200, 5200, 7200 series, with a CPUID Signature DisplayFamily_DisplayModel 
value of 06_57H, supports the MSR interfaces listed in Table 2-61. These processors are based on the Knights 
Landing microarchitecture. The Intel® Xeon Phi™ processor 7215, 7285, 7295 series, with a CPUID Signature 
DisplayFamily_DisplayModel value of 06_85H, supports the MSR interfaces listed in Table 2-61 and Table 2-62. 
These processors are based on the Knights Mill microarchitecture. Some MSRs are shared between a pair of 
```

## The list

Family 6 (Intel), DisplayModel in hex, with the table that gives each one 34H:

| table | DisplayModel |
|---|---|
| 2-6 (§2.4, §2.4.2, §2.5, §2.6, §2.7) | 37, 4A, 4D, 5A, 5D, 4C, 5C, 7A, 86, 96, 9C |
| 2-15 (§2.8, §2.9, §2.10) | 1A, 1E, 1F, 2E, 25, 2C, 2F |
| 2-20 (§2.11-§2.17) | 2A, 2D, 3A, 3E, 3C, 45, 46, 3F, 3D, 47, 4F, 56, 4E, 5E, 55, 8E, 9E, 66, A5, A6, 7E, 8C, 8D, 6A, 6C, 97, 9A, BA, B7, BF, 8F, CF, AA, AD, AE, AF, BD |
| 2-61 (§2.18) | 57, 85 |

Table 2-56 (AD, AE) and 2-57 (AF) carry 34H for models §2.17 already lists.

**Not admitted**: Table 2-1 names ten models that no Vol. 4 section names as supporting a table above: 06_5F, 06_A7, 06_BE, 06_B6, 06_B5, 06_C5, 06_C6, 06_CC, 06_D5 and 06_DD. `rg -n "06_<M>H" vol4.txt` finds each only in Table 2-1 (lines 46-225; 06_A7H at line 74). §2.4 says Table 2-6 is "also common to … newer microarchitectures for next generation Intel Atom processors", but it names no model. ToyOS's rule admits a model only where a section names it, because a wrong admission is a `#GP` at bring-up while a wrong omission loses only the SMI count.

## Against the list the kernel admits at `abc2bfc15`

`kernel/cpuvuln/src/table.rs`'s `counts_smis`, with its constants resolved, against the 57 above:

- **lost** (admitted today, named by no Vol. 4 section): 06_5F, 06_75, 06_7D, 06_A7, 06_AC, 06_BE. 06_75, 06_7D and 06_AC occur nowhere in Vol. 4.
- **gained** (named by a Vol. 4 section, not admitted today): 06_4A, 06_5A, 06_5D, 06_66, 06_AF, 06_BD.
