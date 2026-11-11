# pr-1243 r3: the T14 pinned and the MMIO rule corrected, ToyOS ab39884e2 (the head)

| File | Command | Revision | Exit |
|---|---|---|---|
| `host/a-r3.log` | `cargo test -p kernel --lib mitigation`; `cargo test --test toyos-checks`; clippy on the kernel (host lib and tests with `sched-check`, `x86_64-unknown-none` default and with `boot-actuators,test-actuators`) and on `toyos-build --all-targets`, adopted lints and `-D warnings`; then every control | ab39884e2 | 0 each: 18 and 46 passed; each control 101 |
| `host/stage.log`, `metal/request.txt` | `cargo test --test toyos-build -- --metal --metal-readback <scratch>/metal-a3 mitigations microcode` | ab39884e2 | 2 = staged, nothing measured; one `metalcase` image for the T14 and the AMD bench |
| `metal/t14-metalcase-3b07ea1dd-lines.log` | the T14's `metalcase` readback at 3b07ea1dd, its `microcode:`, `mitigations:`, `SMP:` and `topo:` lines only | 3b07ea1dd | verdict `passed`; its cpu0 words line, but `microcode=`, is the T14's pinned words. cpu0 and cpu4 share core 0, so the new `smt` agrees with the old |

Controls, each applied with `git apply`, tested, reversed with `git apply -R`; the tree's diff digest is the same before and after. Each builds and fails (101):

| Control | Pure tests | Bench test (`<name>-bench.log`) | Judge test |
|---|---|---|---|
| `drop-amd-g2` | 5 fail | the AMD bench's `spectre_v1` | |
| `amd-family-17h-dropped` | 2 fail | the AMD bench's `retbleed` | |
| `intel-row-dropped` (the record's mutation) | 2 fail | the T14's `indirect_target_selection` | |
| `stibp-with-enhanced-ibrs` (R1) | 2 fail | the T14's `spectre_v2` | |
| `policy-unmarked` (R2) | 2 fail | the AMD bench's `retbleed` | |
| `mmio-verw-wherever-listed` (the old MMIO rule) | 5 fail | the T14's `mmio_stale_data` | |
| `judge-reads-cpu0-alone` (R6) | | | "a later CPU's LFENCE bit read clear was accepted" |
| `judge-holds-no-pin` | | | "a misread the lines agree with was accepted" |
| `judge-skips-the-kernels-lfence` | | | "cpu0's LFENCE bit read clear was accepted" |

Host paths, user and host names are masked.
