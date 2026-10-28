# PR 1094, round 1 (branch stick-hang at a153c051d)

- `qemu/`: the hand-run smoke of the two staged images on q35 (QEMU 11.1.1, TCG, intel-iommu,
  a second usb-storage stick carrying a scratch-typed GPT made by `mkgpt.py`), command line `run.sh`.
  - `serial-reboot.log`: `scratch_load reboot` makes 64 MiB durable, asks for the reboot, usbd's
    stop resets both connected ports and the controller, the machine reboots.
  - `serial-deadline.log`: `scratch_load` writes until the 40 s boot deadline resets the machine.
  - `serial-flush-defect.log`: the load's first version, which flushed before its writes were
    acknowledged; no flush covered anything, the arena never drained, the job hung at 64 requests.
- `host/`: `cargo run -- --ci host` at the commit's tree less one clippy fix (exit 1, the one red step
  clippy's `precedence` in `tests/metal/src/lib.rs`), then after the fix: clippy on toyos-metal,
  toyos-build and toyos-manifest (exit 0), `cargo test -p toyos-metal --lib` (exit 0, 84 tests),
  the judges' host test (exit 0), the source gate (exit 0) and the issue checks (exit 0).
- `metal/`: the staging at a153c051d (exit 2, staged), its request and the images' hashes. No metal run.
- `bench/`: the T14 cycle protocol and the bench-side scripts it runs over ssh.

Specification facts cited in issues/a-reset-can-leave-a-usb-stick-hung-until-its-power-is-removed.md:
- xHCI 1.2 (May 2019) §5.4.1 HCRST: "Any transaction currently in progress on the USB is immediately
  terminated. A USB reset shall not be driven on USB2 downstream ports, however a Hot or Warm Reset
  shall be initiated on USB3 Root Hub downstream ports." "The effects of this bit ... are similar to
  a Chip Hardware Reset."
- xHCI 1.2 §4.19.4: the xHC "shall automatically enable VBus on all Root Hub ports after a Chip
  Hardware Reset or HCRST."
- xHCI 1.2 §5.4.8 PP: with PPC '0' "each port is hard wired to power, and not affected by this bit."
- USB 3.2 Revision 1.1 (June 2022) §7.4.1: "Rx termination shall always be maintained throughout
  operation except for eSS.Disabled."
- USB 3.2 r1.1 §6.9.3: "Warm Reset is defined to be able to reset a hardware failure of a device,
  such as the LTSSM hanging"; an upstream port detects it "at any link states except SS.Disabled".
- USB 3.2 r1.1 §7.5.1.2.3-4: a peripheral upstream port moves to eSS.Disabled.Error when
  tDisabledCount is 3 (reset only by invalid VBUS or a successful port configuration exchange), and
  leaves it "upon PowerOn reset"; it "shall remain in eSS.Disabled.Error upon detection of USB 2.0
  bus reset."
