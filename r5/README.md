# PR #1053, round 5: review r1's fixes

## The tables, corrected (replacing r4's for the T14 and r3's for the AMD bench)

compare-t14.md and compare-amd.md come from the same inputs as r3 and r4, by compare.py. A row whose two sides
do not do the same work now says why in its "ToyOS ahead" cell, instead of a verdict:
- `crunch.all.*`
- `persist.*`
- `mem.memcpy.*` and `mem.bw.*`: Linux's buffers are 131,072 KiB of huge pages, ToyOS's 4 KiB pages.
- `mem.first_touch.2m` and `mem.map_touch_unmap.2m`
- `mem.realloc_grow.*`
- `mem.malloc_churn.1048576.*`
- `time.yield`

## What r4 said wrongly

**Single-thread crunch on the T14.**
- The clock ceilings differ. ToyOS's T14 tops out at 3,788-3,789 MHz in every `mhz` and `cpu.clock` line of
  its boots. Linux's reaches 4,189-4,190 MHz.
- That is a ratio of 1.106, which accounts for most of ToyOS's 1.10-1.17x on deflate, sha256 and matmul.
  It is a clock difference, not a code difference.
- The AMD bench's ceilings match: 4,291 MHz on both systems.

**All-core on the T14.**
- After the same slices, ToyOS read about 3,789 MHz and Linux 1.7-1.9 GHz.
- r4's "a heat it cannot see" was speculation. The recorded explanation is
  `issues/the-t14s-thermal-modes-do-not-move-its-package-power-limits.md`: ToyOS refuses the firmware's PL1
  and PL2 writes, so the package runs under the limits boot left.
- Those rows are each system's power policy, not a comparison, and they are now marked so.

**The all-core phase without a temperature no longer runs.**
- From this head, a ToyOS crunch reads no temperature, so it runs the one-thread phase alone and reports
  every `crunch.all.*` row `unmeasured`.
- The kernel sampler in `issues/the-kernel-owns-cpu-performance-state.md` is the recorded way to change that.
- The T14 all-core figures above, from ada5bf21c, are kept only as the evidence that boot produced.

## Checks at 12d0ebaa3

| check | command | exit | log |
|---|---|---|---|
| host checks | `cargo run -- --ci host` at 12d0ebaa3 | 0, 103 steps | logs/ci-host-4.log |
| UDP receive timeouts, the 500 us one included | `cargo test --test toyos-build -- udp_receive_times_out` | 0 | logs/guest-udp-timeout-2.log |
| control m4: the clamp reverted to truncation (controls/) | the same | 1, `STALLED` on the 500 us receive | logs/control-m4-truncate-sub-ms-timeout.log |
| the crunch group alone, QEMU TCG (an uncommitted case of benchcase with only `osbench_crunch`) | `cargo run -- --build-only`, then qemu-system-x86_64 | 0, 0 | logs/build-crunch-smoke.log, logs/qemu-crunch-serial.txt |

- The crunch run measured `crunch.single.*`, reported each `crunch.all.*` as
  `unmeasured=no_package_temperature_to_stop_the_all-core_phase_at`, and exited 0.
- The UDP test and the control ran on the uncommitted tree that 12d0ebaa3 then committed unchanged. The
  control's patch was reverted before the commit.
