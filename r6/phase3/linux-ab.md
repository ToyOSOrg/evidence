# T14 phase 3: Linux halves (measurement only)

Each Linux step puts one ToyOS condition onto Linux. If Linux's idle package
power rises from about 1.65 W toward ToyOS's 7.1 W, and its PC2 from about
100 ‰ toward 994 ‰, that condition holds the package in PC2.

Setup is round 2's: AC, panel lit, radios blocked (the script does it),
nothing else running. The binary is phase 2's scout,
`phase2/linux/osbench`, copied to `/var/tmp/osbench-scout`. Its sha256 is
b108a25ce4f57c74cb6c409bee92a9a955f61682afc4f99c8b901119ac486d2f, and it
reports `pp0_mw`/`pp1_mw`. Each step is one `osbench energy` of about
3.5 min, and only its `energy.idle.*` rows are read.

## Boot B first: `nomodeset`

This is the one with the most discriminating power. With i915 not loaded,
Linux's graphics are as ToyOS leaves them: the GOP scan-out under the
firmware's programming, no DMC firmware, no DC5/DC6, no PSR and no driver in
the GT. Boot through the firmware (a real reboot, not kexec, which would hand
over i915's state). Add `nomodeset` to this one boot only, for example:

```text
sudo sed -i 's/^GRUB_CMDLINE_LINUX_DEFAULT="/&nomodeset /' /etc/default/grub && sudo update-grub && sudo reboot
# after the run:
sudo sed -i 's/^GRUB_CMDLINE_LINUX_DEFAULT="nomodeset /GRUB_CMDLINE_LINUX_DEFAULT="/' /etc/default/grub && sudo update-grub && sudo reboot
```

Then run:

```text
sudo systemd-run --unit=ab-nomodeset /var/tmp/ab-remote.sh nomodeset
```

Fetch `/var/tmp/ab-nomodeset/`. Its `.state` files show `/proc/cmdline` and
that i915 is absent.

## Boot A: the normal boot, runtime steps

```text
sudo systemd-run --unit=ab-runtime /var/tmp/ab-remote.sh runtime
```

The steps, each one condition, undone before the next unless noted:

| step | condition | undone |
| --- | --- | --- |
| A0-base | round 2's setup | |
| A1-nvme-apst-off | NVMe APST off (`pm_qos_latency_tolerance_us` = 0), ToyOS's state | yes |
| A2-nvme-aspm-off | NVMe link ASPM L1 off (`link/l1_aspm` = 0) | yes |
| A3-i219-unbound | e1000e unbound: the I219 as firmware left it, the scout boot's base | rebound |
| A4-psr-off | PSR disabled (`i915_edp_psr_debug` = 0x1) | A5 |
| A5-psr-default | PSR back to the driver default | |
| A6-display-off | fbcon powered down (`fb0/blank` = 4) | unblanked |

A3 takes ssh down for its 3.5 minutes. The unit rebinds e1000e afterwards,
and the link renegotiates.

Fetch `/var/tmp/ab-runtime/`:

- `<step>.txt`: osbench's rows.
- `<step>.state`: taken before the step, and only from what wakes no device: APST, and the PMC's `package_cstate_show` (PC8-PC10, which our rows cannot read on Tiger Lake) and S0ix counters.
- `<step>-after.{state,lspci,hex}`: taken after the step. These add `ltr_show`, i915's PSR/DMC/display/power-domain status, the ASPM sysfs, `lspci -vvv` and the config space of 00:06.0, 04:00.0 and 00:1f.6.

Reading config space and i915 debugfs resumes the devices they read, so they
are taken only after each step's measurement.

What each step answers:

- **B0**: the whole iGPU state ToyOS leaves.
- **A1, A2**: the NVMe's idle power state and link.
- **A3**: the I219 driverless.
- **A4/A5**: PSR's share, now with status shown.
- **A6**: the display off on Linux, the counterpart of the ToyOS scout's planes-off and transcoder-off steps.
