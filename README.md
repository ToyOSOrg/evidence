# PR #1062: the VM's console is a userland driver's

Branch head measured: `7280e0970` (ToyOS `wt/virtio-console-userland`). Host: Apple M4 Pro, 14 cores, shared; QEMU 11.1.1. Paths are masked.

- `ci/ci2-host-green.log` — `cargo run -- --ci host` at `7280e0970`: exit 0, 103 of 103 steps green.
  `ci/ci1-aarch64-clippy-red.log` — the run before, on the uncommitted tree: aarch64 kernel clippy red on a deleted `Mmio::size`, fixed in `6ecb8caab`.
- `guest/guest-batch-7280e0970.log` — the eight q35 TCG rows at `7280e0970`: exit 0, 8 of 8.
  `guest/console-sequence-verbose.log` — one verbose boot of the restore test (uncommitted tree before `6ecb8caab`, same console code): the console's driver declining the clipboard's function, carrying the log, the UART's quiet and restore lines.
- `mutations/` — negative controls, each a checked patch applied, run and reverted:
  `uartmerge` (harness stops publishing UART lines): both new tests red;
  `gone` (logkeeper never tells the kernel its carrier went): the restore test red;
  `fatal` (no take-back before `FATAL_HALT`'s record): 3 of 3 still green — `halt_all_cpus` takes it back microseconds later, so that test does not establish the race.
- `capture/firmware-writes-nothing-on-the-port.log` — the harness's firmware split disabled (throwaway `RAWCON`): the port's first line is the kernel's first record.
  `capture/capselftest-{q35,virt}.log` — `pci-cap-selftest` armed: `pci cap selftest 6/6`, `pci cap split 13/13`.
- `stall/` — the stdout reader stopped 20 s after 20 KB, twice (`stall.patch` on `after.patch`): ready reached, 380 of 380 flood records once each, no torn line.
- `measure/` — console cost per byte. `apply.py <tree> before|after` is the throwaway flood and arrival timestamps (`before.patch` on `origin/main` `3a19907ab`, `after.patch` on `6ecb8caab`); `hvf-before.py`/`hvf-after.py` give `virt` the console function; `rate.py` computes `rates.txt`. Five runs per cell, exit 0 each.
- `metal/` — the T14's `shared-debug` boot at `7280e0970`, run by the orchestrator from `request.txt`: `pci_capability_walk` PASS (`judge-v.log`, verdict `passed`; `kernel.log` says `pci cap selftest 6/6`). The readback's text files only; partition GUIDs and the vendor, product and BIOS strings are masked, and the stick and log partition images are not published.
