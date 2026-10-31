# #1121 review round 1, head 2ee4db1e3 (C1 40f5cc88a, C2 2ee4db1e3)

| log | what | tree | exit |
|---|---|---|---|
| ci.log | `cargo run -- --ci host` | d878eb102 | 0, 107/107 |
| sdk-test.log | `cargo test -p toyos --lib ipc::` | d878eb102's tree | 0, 10 passed |
| control-b1.log | blocker 1's mapping reverted, then restored | same | 101: the new test red |
| remote/debug-results.txt | x86-64 QEMU `--debug` shared boot on the runner, all 79 shared members (`remote/members.txt`) | d878eb102 | 72 exit 0; 6 actuator members exit 101 for want of `SYS_DEBUG` (non-actuator kernel); `abuse_connect_flood` 101 (a plain write on a connection; fixed) |
| remote/debug-results-2.txt | the same boot: `abuse_connect_flood`, `messages_are_whole` | 2ee4db1e3 | both 0 |
| remote/remote-filtered.out | `memory_floor_holds_the_controls libc_children usbd_drives_the_spare` | d878eb102 | 1: `libc_children` red at `tty_interrupt` |
| remote/remote-base-libc.out | `libc_children` | 4fc78ac97 (phase 2's parent) | 1: the same stall |
| remote/remote-1108-libc.out | `libc_children` | 18060b521 (#1108) | 0 |
| remote/remote-main-libc.out | `libc_children` | f45dc5e3b (main) | 0 |
| metal-judged/ | the A/B table, the profile split, per-boot rows and verdicts, extracted from the readbacks | images at 4fc78ac97, 245f7b9af, 2269ea100 | every boot passed |

The `--debug` boot's kernel waits for a debugger: `remote/release-gate.sh`
clears its gate through QEMU's GDB stub (the first boot was released by hand
the same way, `gate` not logged). Readbacks are not published raw: they name
the machines; the table, rows and notes are extracted from them by
`metal-judged/ab.py` and grep.
