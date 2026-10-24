# PR #1053, round 3: the T14's `lan` kill, and ToyOS against Linux

## The T14's `osbench lan`, killed at the list bound (fixed in ada5bf21c)

ToyOS boot of f644cefae on the T14, no peer on the link (toyos/t14-lan-kill.txt):
- The job started at 229.9 s and was killed at 551.3 s, by the runner's 540 s list bound. Its discovery is
  bounded at 60 s.
- It made 31 syscalls in 321 s of wall time, so one call never returned.
- Linux's run of the same binary refused the group cleanly at 60 s.

**The defect is ToyOS's (std and netstack), not osbench's.**
- `osbench_lan::discover` sets a 1 s read timeout and calls `recv_from`.
- ToyOS std's `UdpSocket` stored the timeout and `recv_from` never read it. It sends netstack a
  `UdpRecvFrom` request, which netstack parks until a datagram arrives, and the client waits on the answer
  with no bound. This is `issues/std-udp-socket-ignores-its-timeouts.md` (closed by the fix).

**The fix: the request carries `timeout_ms`, and netstack answers `TimedOut` at it.**
- netstack keeps each waiting receive's deadline and wakes for the soonest one.
- A client that gave up on its own would race netstack's delivery into the socket's pipe, so netstack owns
  the deadline.
- std passes its read timeout. libc keeps no `SO_RCVTIMEO` and passes 0, as before.

**Tests:**
- New QEMU test `udp_receive_times_out` on `tests/images/netcase.toml`: two receives under a 300 ms
  timeout with nothing sent each end `TimedOut` after at least 300 ms. The second shows netstack released the
  first wait. Command `cargo test --test toyos-build -- udp_receive_times_out`: exit 0
  (logs/guest-udp-timeout-1.log).
- Control m3 (controls/m3-netstack-no-receive-deadline.patch), netstack's `TimedOut` answer removed: exit 1,
  `STALLED` at the hang ceiling (logs/control-m3-netstack-no-receive-deadline.log). Patch restored in the
  same run.
- No metal boot of ada5bf21c yet.

## ToyOS against Linux: compare-t14.md, compare-amd.md

**Inputs:**
- Linux: the three unprivileged `all` runs of r2. ToyOS: one benchcase boot per bench at f644cefae, its
  `osbench v=2 os=toyos` lines only (toyos/*.txt). The kernel logs are not published: they carry the
  machines' network identifiers.
- The table generator is tools/compare.py.

**Columns:**
- Linux median p50, and its run-to-run spread over the three runs.
- ToyOS p50, from one run, so no run-to-run spread.
- Each side's within-run (p90 - p50) / p50.
- ToyOS / Linux, and whether ToyOS is ahead for the unit: lower is better for times, higher for rates.

**Sections:**
- The rows both measured under one name.
- Linux's `/dev/shm` beside ToyOS's `/tmp` and `/home`.
- ToyOS's wakes and sleeps beside Linux's at 1 ns timer slack: ToyOS has no slack, and Linux's default
  50 us pads every sleep.
- ToyOS's unsupported rows.
- Every row not compared, with why.

**Not compared yet:**
- `lan.*`: no wired peer on either system. The AMD bench has no card ToyOS drives.
- `nvme.*` and `energy.*`: Linux needs root. ToyOS reports both unsupported.
- The T14 ToyOS `crunch` and `persist` groups, which the boot never reached after the kill.

**Rows that are not like for like, to read with care:**
- `time.yield`: ToyOS std's `yield_now` is a spin hint with no syscall; Linux's is `sched_yield`.
- `mem.first_touch.2m` and `mem.map_touch_unmap.2m`: Linux's madvise gives 2 MiB pages, each fault zeroing
  2 MiB. ToyOS maps 4 KiB pages, so the same stride touches one 4 KiB page per 2 MiB.
- `mem.realloc_grow.*`: Linux's `realloc` answers a 128-to-256 MiB doubling in about 30 ns, which only moving
  the pages and copying nothing does. ToyOS takes 59-82 ms, a copy. This is inferred from the times; musl's
  source was not read.
- `mem.malloc_churn.1048576.*`: Linux's 96-172 k pairs a second for a 1 MiB block reads as a mapping per
  block, where ToyOS's dlmalloc reuses them. This is also inferred from the rates.
- `process.spawn_wait`, `proc.posix_spawn_wait.std`, `work.build_shaped.*`: about 12 ms a spawn on ToyOS on
  both benches, against `proc.spawn_wait.tiny`'s 52-83 us. Read as std's `Command` path on ToyOS, not the
  kernel's spawn; not investigated here.
- `cpu.chunk` reads each system's clock ramp out of idle, not its settled clock
  (`issues/osbench-times-cpus-leaving-idle-and-not-their-settled-clock.md`). Linux on the AMD bench runs
  schedutil with acpi-cpufreq, and its rows are the noisiest (r2/README.md).

## Checks at ada5bf21c

- `cargo run -- --ci host`: exit 0, 103 steps green (logs/ci-host-3.log).
- The T14 image restaged at ada5bf21c (`--metal-readback`, exit 2 = staged, machine untouched;
  toyos/image-t14-ada5bf21c.sha256). Without a peer its `lan` should now refuse at 60 s, and `crunch` and
  `persist` should run. That is unverified on metal.
