# pr-1243 r2: review round 1, ToyOS a2350e613 (rebased on main 6d4b7e4ce)

| File | Command | Revision | Exit |
|---|---|---|---|
| `host/a-r2.log` | `cargo test -p kernel --lib mitigation`; `cargo test --test toyos-checks`; clippy on the kernel (host lib and tests with `sched-check`, `x86_64-unknown-none` default and with `boot-actuators,test-actuators`) and on `toyos-build --all-targets`, adopted lints and `-D warnings`; then eleven controls | 3ab7ae2ca (round 1 before the pin case was strengthened, the reword and the rebase) | 0 each; each control 101 |
| `host/a-r2b.log` | `cargo test --test toyos-checks`; clippy on `toyos-build`; the three judge controls again | 94e691a36 (the pin case strengthened) | 0, 46 passed; each control 101 for its own reason |
| `host/a-r2c.log` | every targeted check again | a2350e613, the rebased head | 0 each: 18 and 46 passed |
| `host/stage.log`, `metal/request.txt` | `cargo test --test toyos-build -- --metal --metal-readback <scratch>/metal-a2 mitigations microcode` | a2350e613 | 2 = staged, nothing measured |
| `metal/amd-metalcase-3b07ea1dd-lines.log` | the AMD bench's `metalcase` readback at 3b07ea1dd, its `microcode:`, `mitigations:`, `SMP:` and `topo:` lines only | 3b07ea1dd | verdict `passed`; the words pinned in `MITIGATION_BENCHES` are its cpu0 words line but `microcode=` |

Controls (`control/<name>.patch` applied with `git apply`, tested, reversed with `git apply -R`; the working tree's diff digest is the same before and after):

| Control | Test | Result |
|---|---|---|
| `drop-amd-g2` | pure tests; the bench test (`-bench.log`) | 101: 5 pure tests; the bench test |
| `amd-family-17h-dropped` | pure tests; the bench test | 101: 2 pure tests; the bench test |
| `intel-row-dropped` | pure tests | 101: 4 pure tests |
| `stibp-with-enhanced-ibrs` (R1) | pure tests | 101: the 806C1 and 806F8 tests |
| `policy-unmarked` (R2) | pure tests; the bench test | 101: 2 pure tests; the bench test |
| `judge-reads-cpu0-alone` (R6) | `mitigations_verdict` | 101: "a later CPU's LFENCE bit read clear was accepted" |
| `judge-holds-no-pin` | `mitigations_verdict` | 101: "a misread the lines agree with was accepted" |
| `judge-skips-the-kernels-lfence` | `mitigations_verdict` | 101: "cpu0's LFENCE bit read clear was accepted" |

The kernel controls ran at 3ab7ae2ca and the judge controls at 94e691a36; neither file they mutate changed after, but for the rebase onto main, which touched neither function.
Host paths, user and host names are masked.
