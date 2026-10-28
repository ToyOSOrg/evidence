# pr-1073 r4: the B4 boots, the osbench capability defect, review r3

- `readback-notes/`: the osbench lines from the B4 benchcase boots at `d286dddf3`. `run4-out.txt` sets them beside r3's two A* boots.
- **The B4 readings:**
  - T14: deflate 54.63 ms; `cpu.clock` reaches 4189 at 10 of 17 group starts.
  - AMD: deflate 66.66 ms, on CPU 10 at 4240 MHz, with every other CPU idle. This run is why the deflate finding no longer blames CPU 4.
- `logs/judge4-{t14,amd}.log`: the harness judge (`cargo test --test toyos-build -- --metal --metal-readback <dir> osbench hda_tone acpi_tables_loaded`) over the B4 readbacks.
  - It exits 1 on both benches: `osbench_identity` exited 1.
  - `hda_tone`, `hda_tone_resampled` and `acpi_tables_loaded` pass.
- `logs/qemu-osbench-{fixed,defect}.log`: the new QEMU test `osbench_capability_groups_exit_0`.
  - At `49a98e31e` it exits 0.
  - With the fix reverted (`mutations/fix-reverted.patch`) it exits 1: identity exit=1, fair exit=1.
- `mutations/`: `learn-arms-swapped` exits 101 with its test red.
- `logs/ci-host-9.log`: `cargo run -- --ci host` at `d60d727aa`, exit 0, 104 steps.
- `t14-2-B3-boot-groups-timed.txt`: kernel-log lines with their seconds since boot. Their source is the four groups that run while acpiserver loads its tables.
- `request-r5.txt` stages two images:
  - B5 benchcase at `d60d727aa`;
  - the A* testcases control, the same revision with `control-c1-only.patch`.

Paths are masked.
