# pr-1150 r3: round 2's metal read, and what it found

- `ab2-table.txt`, `judge2.py`: round 2's metal A/B judged by its rules (`r2/ab2-rules.md`).
  - Base a0e8f1333; b4096 0d0a03065; b1024 the same head with `BOUNCE` = 1024. T14 and AMD,
    7 boots each, all passed.
  - T14 hot rows still regress: `pipe.throughput.64`..`4096` −8 to −15%; `ipc.reqrep.8`,
    `reqrep.4096` and `reqrep_handle.8` +8 to +16%.
  - AMD: `pipe.throughput.64` −35% and `1024` −24%.
  - The gate holds on both benches: testcases 14/14 exit 0, no gate panic, no kernel panic.
- `ab2-futex.txt`: from each boot's exit line, the pipe benchmark process's
  `FUTEX_WAIT` count. Main makes 125-205 per run; the head 17,000-161,000. The SDK's
  descriptor-table lock (`sdk/toyos/src/fd.rs`, taken twice by every descriptor call) is
  a futex lock that slept at the first collision. The two benchmark threads, no longer
  serialized under the kernel's process lock, met on it.
- `disasm-pipe-write-before.txt`: `PipeRef::write` at 0d0a03065. A `memcpy` of 0x1008
  bytes moves the whole `Bounce` after `read_raw`; `sys_message_send` has the same.
  Fixed in 49ba94a74, whose rebuilt kernel has neither copy.
- `control-N8-spin-takes-a-held-lock.log`: the new `contenders_for_a_lock_each_hold_it_alone`
  test, red (rc=101) when a spinner takes a held lock. Reverted.
- `host-4.log.gz`: `cargo run -- --ci host` at d206fddff, rc=1. Its one red step was clippy:
  an import unused in the SDK's test build.
- `host-5.log.gz`, `host-5.rev`: `cargo run -- --ci host` at 5572386b8, which fixes it.
  rc=0, 109 steps green.
- `members-3*`, `ccheck-3.log`: the testcases boot under QEMU x86_64 via `--debug` at
  5572386b8. 230 of 238 exit 0; the other 8 need `SYS_DEBUG`, as before. The C corpus is
  143 of 143. No gate panic.
- `ab3-*`, `stage3.sh`, `stage3.log.gz`: round 3's metal, staged and not run. The rules
  were set before any boot.
