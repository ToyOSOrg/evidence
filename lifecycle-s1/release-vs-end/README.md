# A holder's end against its claim's release, QEMU (and the T14 request)

Probe: `probe.patch`, a throwaway commit (`4b673bac0`) on `ed1ec1512`, never
landed. It logs each `Device` hook's duration (`zqprobe: Device hook_ns=…
at=<start ns>`) from `drain_zero_handles`, and for each teardown the moment its
handles were closed and the moment its end became publishable.

Run: `cargo test --test toyos-build -- --nocapture usbd_drives_the_spare`,
exit 0, QEMU 11.1.1 TCG on an arm64 host, two guests (the leave arm and the
control). Log: `usbd_drives_the_spare.log`.

Readings (serial 0, the leave arm), lines 501-506 and 548-552:

- usbd pid 11, killed: handles closed at 5445.399 ms on cpu0, end publishable at
  5449.025 ms on cpu0. Its claim's hook ran on **cpu1**, starting at 5446.600 ms
  and taking 3.872 ms (including the `iommu: irte2 … released` and
  `pcidev: … released from slot 2; reset by nothing` lines), so it ended at
  about 5450.47 ms: **about 1.4 ms after the end was publishable**.
- The fault arm's explicit drop of its claim: hook 0.259 ms on cpu1.
- 1b36:000d (qemu-xhci) advertises no reset, so neither reading includes
  starting a reset. `reset()` only starts one: the settle (≤100 ms FLR, 10 ms
  D3hot) is spun by the next claim in `settle_after_reset`.

T14 request (`t14-request.txt`): the `usbd_drives_the_type_c_controller` row
built from the probe commit. It is staged, not run (the prepare exited 2,
"the machine was not touched"). Its readback gives the verdict on how long a
real function's release takes on the ending path.
