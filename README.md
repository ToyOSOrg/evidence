# pr-1086: the T14's iGPU fault in the VT-d hand-over

Branch `igpu-fault` of ToyOSOrg/ToyOS. Logs are full command output. Each command's exit code is its log's last line (`exit=N`). Paths are masked.

| file | command | revision | exit |
|---|---|---|---|
| host/ci-host.log | `cargo run -- --ci host` | rebased tree before `vtd_firmware_left` was added (kernel changes identical to 30a70716f) | 0 |
| host/ci-host-lint.log | `cargo run -- --ci host lint` | 30a70716f | 0 |
| qemu/vtd_firmware_left.log | `cargo test --test toyos-build -- vtd_firmware_left` | 30a70716f | 0 |
| controls/vtd_firmware_left-mutated.log | the same, with controls/vtd_firmware_left-mutation.patch applied (`in_flight` forced to `Identical`, cycles armed); tree restored after | 30a70716f + patch | 1 (expected red; also shows the switch under translation and 400 cycles on QEMU's unit) |
| controls/iommu_firmware_left-judge-on-prefix-readback.log | `cargo test --test toyos-build -- --metal --metal-readback <copy of a 576bebf3a T14 shared-debug readback> iommu_firmware_left` | 30a70716f judging a pre-fix boot | expected red: "unit0 still took translation off" |
| t14/metal-prepare.log | `--metal --metal-readback <dir> iommu_handover_cycles boot:shared-debug` (staging only; exit 2 is the harness's staged status) | 30a70716f | 2 |
| t14/fault-boot-excerpt.log | IOMMU lines of the halted T14 shared-debug boot at 7ef0a48c8 (orchestrator runner log) | 7ef0a48c8 | halted |
| t14/boot-counts.txt | per orchestrator T14 log: unit0 translating lines, cycled hand-overs, iGPU fault lines (to 2026-10-28) | — | — |

Totals from boot-counts: 787 boots with one off-to-on transition on unit0 and no iGPU fault; 46 cycled (`iommu-firmware-left`) boots with one fault.

## r2 (review r1)

PR head 5fb75fc8b, with the measurement code removed. Measurement branch `igpu-fault-measure` at e3b1562e7, which is that head plus the reproducer, with switches run before off-on.

| file | command | revision | exit |
|---|---|---|---|
| r2/ci-host-lint-head.log | `cargo run -- --ci host lint` | tree of 5fb75fc8b, before its commit | 0 |
| r2/vtd_firmware_left-head.log | `cargo test --test toyos-build -- vtd_firmware_left` | 5fb75fc8b | 0 |
| r2/ci-host-lint-measure.log | `cargo run -- --ci host lint` | tree of e3b1562e7, before its commit | 0 |
| r2/metal-prepare-measure.log | `--metal --metal-readback <dir> iommu_handover_cycles` (staging) | e3b1562e7 | 2 (staged) |
| r2/metal-prepare-head.log | `--metal --metal-readback <dir> boot:shared-debug` (staging) | 5fb75fc8b | 2 (staged) |

The first round's `host/` logs stand for unchanged host code: r2 changes only kernel `vtd/`, issues and the removal of test-harness rows, and lint compiles all of it. The r1 control logs remain valid: the decision function and the judge they exercise are unchanged in shape.

## r2 on the T14 (chain-igpu2)

`shared-debug` at 5fb75fc8b was booted 3 times; every boot returned rc=0.

| file | content |
|---|---|
| r2/t14/judge-shared-debug-N.log | `--metal --metal-readback <dir> boot:shared-debug`, exit 1 on each |
| r2/t14/shared-debug-N-iommu-lines.log | the boot's kernel `iommu` lines |

What the boots show:
- All 12 registered rows pass on every boot, including `iommu_firmware_left` ("4 of them keeping translation on").
- Every unit logs "it stays on while this kernel's root replaces firmware's", and no boot has a `DMA FAULT`.
- Each judge's exit 1 comes from 5 shared members. `test_rs_handle_lifetime` is killed at about 60 s, and the 4 members after it never run.
- The same 5 fail identically on main 576bebf3a, judged by the handles agent at 08:34 and 08:35 today, so they do not come from this branch.

Three boots without a fault are consistent with the switch under live scanout. They are too few to establish it at the 1-in-46 rate seen before.

The `iommu-cycles` boots did not run: main's flasher has no FLASHABLE row for the measurement actuator. They are re-queued as chain-igpu3.

## Errata check

r2/errata/631123-034-titles.txt lists the erratum titles (the document itself is Intel's and not redistributed here) of Intel's 11th Generation Intel Core Processor Specification Update, 631123-034 (April 2026), fetched from https://cdrdv2.intel.com/v1/dl/getContent/631123. Errata TGL001 to TGL075: none concerns VT-d, DMA remapping or iGPU DMA translation. TGL004 (posted-interrupt descriptors in PRMRR) is the nearest and does not apply.

## r2 measurement on the T14 (chain-igpu3): iommu-handover-cycles

Measurement branch `igpu-fault-measure` at e3b1562e7 (never lands), booted 3 times. Each boot completed (`Boot: complete`). Boots 1 and 2 were read from the log partitions saved before the following flash; boot 3 from its streamed serial and run log. r2/t14-cycles/boot-N-kernel-iommu-lines.log holds each boot's kernel `iommu` lines. The run logs themselves are not published, since they carry host and network lines.

| boot | switch: cycles with a fault | off-on: cycles with a fault | off-on records | soonest record after the transition |
|---|---|---|---|---|
| 1 | 0 / 200 | 9 / 200 | 41 | 551 837 ns |
| 2 | 0 / 200 | 6 / 200 | 15 | 546 142 ns |
| 3 | 0 / 200 | 7 / 200 | 38 | 554 510 ns |
| all | **0 / 600** | **22 / 600** | 94 | |

- **Where the faults are:** every record is unit0, stream 00:02.0 (the iGPU), a read, reason 6h. Every address is inside the firmware framebuffer in data stolen memory: the host bridge reads BDSM=0x9c800000, BGSM=0x9c000000 and TOLUD=0xa0800000, and the GOP framebuffer is 0x7e9000 bytes.
- **The tables were intact:** each printed walk reads a present root entry, a present context entry, and second-stage entries down to a read-write 2 MiB leaf (`0x9c?00083`). The unit therefore faulted against intact tables.
- **When:** faults land 546 to 598 µs after translation comes back on (a few at about 1.23 ms).
- **Odds:** the probability that the 22 faulted cycles all fall in the off-on phase by chance, with 600 cycles in each phase, is about 2^-22.
- **Errata:** no documented erratum covers this (r2/errata).
