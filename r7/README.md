# PR #1131 r7: cause-finding at Linux's tiers, one probe-only disk boot per bench

The boots ran head `8500478e8` (Linux's tiers) plus `patches/`.

- **probe v4:** the driver issues no command of its own, and logs each I/O's
  LBA, length, session, submit stamp and latency.
- **The after-idle trace:** the kernel diary's records inside each sample,
  plus three unmeasured back-to-back samples.

Both boots ended with EXIT=0 and passed their judges. The lid read "closed"
before and after on both benches. `<bench>-split.md` comes from `split.py`.

## (a) The T14: where the first durable write after idle goes

| segment | after idle (samples 0-7) | back to back (8-10) |
|---|---|---|
| host before the first command | ~0.5 ms | 0.1-0.47 ms |
| first write | **3.1-3.25 ms** | 0.02-0.16 ms |
| first Flush | **9.9-10.2 ms** | 0.36-0.43 ms |
| second Flush | **2.25-2.5 ms** | 0.36-0.42 ms |
| gaps with nothing outstanding, in total | ~1.6 ms | ~0.6 ms |

- After-idle p50 17.70 ms, against Linux's 13.06 ms in the same session.
- The drive's wake (first write and first Flush, about 13 ms) matches Linux's
  whole after-idle extra (13.06 - 1.03 = 12.0 ms).
- ToyOS's own share:
  - the commit's second Flush (`Fs::sync` flushes, writes the superblock,
    flushes again), +1.9 ms after a wake;
  - about 1 ms more host time between commands.
- Recorded as `issues/a-data-commit-flushes-the-drive-twice.md`.

## (b) The AMD: no double wait without the driver's own command

- Every logged after-idle sample pays one wait: a first write of 7.5-7.6 ms
  on the device.
- The sample totals match Linux: p50 11.29 against 11.36 ms, worst 11.61
  against 11.67 ms.
- r6's systematic double wait came only in boots where the driver issued its
  own Get Features at each idle arrival (probe v3). Without it, no sample
  shows one. The inference is that the probe's admin command caused it; this
  is one boot.
- Samples 5-10 have no probe lines: the last batch is printed only at a later
  arrival, and none came.
- On G1's like-for-like cost the AMD still reads 8.62 against 7.78 ms. Its
  back-to-back write is faster than Linux's (2.67 against 3.58 ms), while the
  absolute after-idle write is level.

**Instrument caveat (for any later APST measurement).** Asking the drive its
power state (Get Features 02h, admin) at each idle arrival perturbed the
AMD's drive. With it (r6, probe v3), every B boot had one sample that paid
two device waits (17.5-19.3 ms). Without it (r7, probe v4), no sample did.
The spec has an admin command leave a non-operational state in place
(§8.1.17.1), but this drive's answer was not neutral to the I/O that
followed. Measure APST with timing alone, not with power-state queries.
