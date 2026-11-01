# PR #1062 rebased onto ece8ef4e6 as caf414e4a

- `ci5-host-caf414e4a.log`: `cargo run -- --ci host`, exit 0, 108/108.
- Conflicts were wlan/wifi rows and the HELD_ALONE list (both kept). `SYS_CONSOLE_CARRIED` stays 160: main tops out at 159 (`SYS_MESSAGE_RECV`), bins 162.

Masked: home and temp paths, user name, CPU model.
