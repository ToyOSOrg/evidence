# PR #923 — microcode as a file per CPU on ROOT

Branch head `6d3d7a1e0` (merge of `origin/main` f0a987bc6, which includes #922) over `1e79a1309`.
Paths are masked: `<home>`, `<dev>`, `<scratch>`.

## Host
- `host/ci-host-1.log`: `cargo run -- --ci host` at `1e79a1309`, exit 0, 77 steps green.
- `host/ci-host-2.log`: the same at `6d3d7a1e0`, exit 0, 77 steps green.
- `host/build-only-1.log`, `host/build-only-2.log`: `cargo run -- --build-only` at each, exit 0; the
  release image adds `share/microcode/amd/17-60-01` (3200 bytes) and `share/microcode/intel/06-8c-01/80` (112640 bytes).

## QEMU (ad hoc, not a committed test; QEMU 11.1.1 TCG on an AArch64 macOS host)
`qemu/run.sh` boots the `--build-only` image at `1e79a1309` with a chosen `-cpu`; serial logs:
- `qemu/amd-serial.log`: `qemu64,...,family=23,model=96,stepping=1,-hypervisor` (the AMD bench's 0x860f01).
  The loader finds `amd/17-60-01` and hands 3200 bytes; both CPUs write it through the guarded write; TCG
  ignores the MSR write, so each reads back QEMU's 0x1000065 and says `refused 0x860010d`; the boot reaches userland.
- `qemu/intel-serial.log`: `vendor=GenuineIntel,family=6,model=140,stepping=1,-hypervisor`. TCG reads
  `IA32_PLATFORM_ID` as 0, so the loader looks for `intel/06-8c-01/01`, finds none, and every CPU says
  `the loader handed no patch`; the boot goes on.
- `qemu/guest-serial.log`: the harness's own `qemu64` (hypervisor bit set): loader and every CPU say a
  hypervisor owns the microcode.

## Metal (staged, not run)
- `metal/request-microcode.txt`: the `microcode` row's `metalcase` image, for the T14 and the AMD bench.
- `metal/request-microcode-amd-flip.txt`: the AMD bench alone, staged with the uncommitted
  `metal/stage-microcode-amd-flip.patch` registering the control as a row.
- `host/stage-*.log`: the staging runs, exit 2 (staged, by design).
