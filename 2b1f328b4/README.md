Evidence for ToyOSOrg/ToyOS#943 at head 2b1f328b4cebb850defe45cf4772b8cf06a50b29 (base 979d4c539), macOS aarch64 host. Paths masked as $WORKTREE, $SCRATCH, $HOME.

- libc-copies.log: `cargo test -p toyos-libc-copies`, exit 0.
- negative-control.patch / negative-control.log: `#` skipped again; `cargo test -p toyos-libc-copies printf_conversions`, exit 101; reverted after.
- host-probe.rs / host-probe-output.txt: the committed table run through macOS snprintf (a cross-check, not the oracle).
- ci-host.log / ci-host.exit: `cargo run -- --ci host`, exit 0.
- build-only.log / build-only.exit: `cargo run -- --build-only`, exit 0.
- metal-readback.log: `--metal --metal-readback` staging, exit 2 (staged, no machine touched).
