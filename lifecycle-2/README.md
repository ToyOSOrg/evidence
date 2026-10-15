# Lifecycle stage 2 (ToyOS #934): functions arrive and leave

- `slot-qemu/`: QEMU 11.1.1 q35 + OVMF, an empty `pcie-root-port`, read from
  the UEFI shell's `mm` with no ToyOS involved (`shell2.py`, `native2.log`).
  The port: no MSI, one MSI-X entry, Interrupt Message Number 0; Slot
  Capabilities `0x001a007b` (button, power controller, both indicators,
  surprise, hot-plug capable, command completion); the slot powered off by
  OVMF; a plugged function's config space all-ones until power is on.
  Passive guest: `device_add` raises button + presence (`0x49`), `device_del`
  completes at once. Active guest: `device_del` presses the button and the
  device stays until the guest powers the slot off. The run was stopped after
  the removal steps (exit 143 line); the re-add steps were not read.
  `native.log` is an earlier pass with the wrong port address.
- `hotplug-row/`: `a_function_arrives_and_leaves` on `Profile::HeadlessHotplugPort`
  at ToyOS a6ab756ff with `stand-in-grant.patch`, which declares one host
  bridge granting `0x1f` in place of the apertures track's stage B, which
  carries the real `_OSC` grant and had not landed. `controls.sh` runs the
  green row and each mutation on top of it, restoring the tree after each:
  `mutation-gone-unanswered` (a claim of a departed arrival answers as if
  present) reds with no `DEVICE_DELETED` within 240 s, since the holder never
  ends and the slot is never powered off; `mutation-arrival-reused` (the
  arrival counter not advanced) reds with "arrived as 12, not after 12".
- `claim-rows/`: `usbd_drives_the_spare`, `bar_map_again`,
  `bar_map_behind_a_bridge`, `a_drives_row_holds_one_process_per_function`
  at a6ab756ff, no patch: all four pass.

Paths are masked: `$WORK` is the worktree's parent, `$SCRATCH` the job's scratch.
