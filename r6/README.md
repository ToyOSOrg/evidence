# pr-1137 r6: rebased onto main c81fc83eb

r5's head (`7e5ee812c`) is superseded: main moved to #1116 and #1149 before it was pushed.

Head `adc35d850295b99d665132afb5cfe8b7ef82b646`, three commits on `c81fc83eb`:
- the change;
- review r2's fixes;
- `#1137 r3`, which carries three things:
  - #1062 took syscall 160 and #1116 took 161–163, so the window is 164, with 166 profile bins;
  - #1149's benchcase tgl-display row, "as images/system.toml runs it", gets the same `firmware` grant;
  - the display track's PSR restart line links the durable brief.

The checks ran at this head, on the macOS host (aarch64), with an x86_64 guest:

| Check | Command | Exit | Log |
|---|---|---|---|
| host CI | `cargo run -- --ci host` | 0 (109 steps) | `ci-host.log` |
| QEMU | `cargo test --test toyos-build -- bar_map_again` | 0, PASS, all five lines | `qemu-bar_map_again.log` |

The first host run at this head was cut short by a full shared disk: ENOSPC writing target/ during a control, so it established nothing (`ci-host-enospc.log`). Space was freed, and the same command was rerun.

**Reused, and why it holds:** the T14 boot of `2831e6e52` (r4: both rows PASS, OVER 02010000, MBOX 1d) and r3's move-revoke control.
- Against r2 of `2831e6e52`, the change's diff differs only in the syscall number, the profile size, the restart line and benchcase's row.
- The window, the revocation, tgl-display and metalcase are the same code.
