# PR #920: the AMD microcode loader

Paths are masked as `<dev>`, `<scratchpad>`, `<home>` and `<tmp>`. Revisions are the branch `toyos-amd-ucode`'s: `aa02ec8c2` (the loader) and `d67010aa5` (a module-header citation and three test lints clippy denied; no code the loader runs).

## host/

| File | Command | Revision | Exit |
|---|---|---|---|
| `pure-tests.log` | `cargo test -p toyos-microcode` (42 tests: Intel's and AMD's against their real files and built cases) | `d67010aa5` | 0 |
| `checks-microcode.log` | `cargo test --test toyos-checks microcode` (the metal judge against both benches' lines and 10 refused machines) | `d67010aa5` | 0 |
| `ci-host-1-red.log` | `cargo run -- --ci host` | `aa02ec8c2` | 1: the clippy step, three lints in test code (`manual_is_multiple_of` twice, `identity_op`); the other 76 steps green |
| `ci-host-2.log` | `cargo run -- --ci host` | `d67010aa5` | 0: 77 steps green |
| `mutations/` | each `m*.patch` applied with `git apply`, `cargo test -p toyos-microcode`, reverted with `git apply -R` in the same run; `summary.txt` is the run's record, one line each | `aa02ec8c2` tree + patch | 101 for all ten, no compile error; each fails the tests named in `summary.txt`. `amd.rs`'s code is unchanged at `d67010aa5`. |

## qemu/ (TCG, `qemu64`, which reports AuthenticAMD and the hypervisor bit)

| File | Command | Tree | What it shows |
|---|---|---|---|
| `console_image_boots.log` | `cargo test --test toyos-build -- console_image_boots --nocapture` | `aa02ec8c2` content | exit 0. Every CPU takes the AMD path, reads MSR 0x8B (`found 0x1000065`) and stops at `a hypervisor owns this CPU's microcode` |
| `qemu-a-gp-at-the-write.patch`, `guard-a-gp-at-the-write.log` | the same, with the patch: the hypervisor bit masked, the bench's signature substituted, and the `wrmsr` replaced by a load from a non-canonical address at the same label, so the guarded write raises `#GP(0)` | `aa02ec8c2` + patch | exit 0. cpu0 (firmware's IDT before) and cpu1 (the kernel's) each say `refused 0x860010d with #GP(0x0) running 0x1000065`, and the boot completes through the kernel's own vectors after |
| `qemu-b-gp-before-the-write.patch`, `guard-b-gp-before-the-write.log` | the same, with the fault one instruction before the label | `aa02ec8c2` + patch | exit 1, the expected red: the guest resets at the BSP's load three times over and never prints a microcode line. The gate recovers only the write's own `#GP` |

## metal/ (staged, not run)

`request.txt` names three boots in two readback directories: the T14's `metalcase` (`stage-t14.log`) and the AMD bench's `metalcase` and `microcode-amd-flip` (`stage-amd-bench.log`), each `cargo test --test toyos-build -- --metal --metal-readback <dir> microcode` at `d67010aa5`, exit 2 = staged. The AMD bench's staging and judging apply `stage-microcode-amd-flip.patch`, which registers the flip boot as a second row; it is not committed. `image.sha256` holds the images' digests.
