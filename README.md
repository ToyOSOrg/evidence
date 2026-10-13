# PR #914: the AMD microcode scout

Paths are masked as `<dev>`, `<scratchpad>`, `<home>` and `<tmp>`.

## host/ (commands run in the PR's worktree)

| File | Command | Revision | Exit |
|---|---|---|---|
| `pure-tests.log` | `cargo test -p kernel --lib amducode` | `f7a07b1db` tree | 0 |
| `mutation-m0.patch`, `mutation-m0.log` | the same, with M0's stop weakened from `>=` to `>` | `542ec3e9c` tree + patch | 101: `a_cpu_at_or_above_the_patch_stops_the_ladder_before_any_write` FAILED |
| `pure-tests-restored.log` | the same, patch removed | `542ec3e9c` tree | 0 |
| `ci-host.log` | `cargo run -- --ci host` | `542ec3e9c` | 1. One step was red: the source gate read the SMBIOS fixture `1.0.0.7` as a public IPv4 address. `f7a07b1db` fixes it. The control steps' expected reds (loom, sim) are the controls'. |
| `build-lib-tests.log` | `cargo test --lib`, the step that was red | `f7a07b1db` tree | 0 |
| `clippy-x86-boot-actuators.log` | `cargo clippy -p kernel --target x86_64-unknown-none --features boot-actuators -- -D warnings` | `f7a07b1db` tree | 0 |
| `clippy-kernel-lib.log` | `cargo clippy -p kernel --lib --tests --features sched-check -- -D warnings` | `f7a07b1db` tree | 0 |

## qemu/ (exploratory: TCG, `qemu-system-x86_64` via `run.sh`, `-cpu EPYC` = 0x00800f12, `-smp sockets=1,cores=2,threads=2`)

The image is `cargo run -- --build-only --kernel-param amd-ucode-scout`. TCG has no TopologyExtensions and ignores writes to 0x8b and 0xc0010020, so these runs test the instrument's machinery and say nothing about AMD's loader.

| Serial | Tree | What it shows |
|---|---|---|
| `epyc-head.serial` | `f7a07b1db` | M10 is read (SMBIOS 2.8 from OVMF). The scout stops at `cpu0 names no core`, the APs leave the station, and all of them join the scheduler |
| `epyc-full2.serial` | `542ec3e9c` + `epyc-full2.patch` (CoreId from the APIC ID; M1's stop relaxed) | the whole ladder through M6 and `done` across 4 CPUs: the station, the boxed scratch pages page-aligned, in-place at page offset 0x6fc for this part's block, the 2 s halt and the kick wake |
| `epyc-gp.serial` | pre-`542ec3e9c` tree + the CoreId patch + the guard step's MSR set to 0x804 on cpu0 | the BSP's guarded `wrmsr` to a reserved x2APIC MSR reads `gp 0x0` and the boot carries on (the line still says 0x8b, because only the MSR number was patched) |
| `epyc-gp-ap.serial` | the same tree + `epyc-gp-ap.patch` (the station's WriteLevel writes 0x804 on cpu1) | the AP's guarded write through its station reads `gp 0x0` (attributed to cpu0 in the line by the patch) and cpu1 later joins the scheduler |
| `epyc-idle.serial` | pre-`542ec3e9c` tree + `epyc-idle.patch` | an idle period before M0: every AP halts, is kicked, and answers its level |

## metal/

`request.txt` is the staged boot, from `cargo test --test toyos-build -- --metal --metal-readback <scratchpad>/agents/amd-ucode-scout/metal/amducode amd_ucode_scout` at `f7a07b1db` (`stage.log`, exit 2 = staged). `image.sha256` holds the image's digest. The staging set no `--metal-host`. The AMD bench's boot adds `--host <user>@<amd-bench>` to the invocation.
