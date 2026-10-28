# PR #1083, round 1

Host: an aarch64 Mac (macOS), QEMU 11.1.1, x86-64 guest under TCG, `netcase.toml`, test alone. Head is `bde3e08ba`; base is `origin/main` `b0164b262`. Paths, user, LAN address and MACs masked.

- `logs/base-plain-stall.log`: the unmodified test at base, first run: the race stalls after the first part's line and the mDNS claim. It was stopped by PID once the peer's thread was seen to have ended (no sockets left in the harness), so the run has no verdict line.
- `logs/base-loop-run1.log`, `logs/base-loop-run2-pcap.log`: base plus `patches/instr-1.patch` (40 race rounds per boot, step lines in guest and peer); run 2 also with `patches/instr-2.patch` (QEMU `filter-dump`). Run 1 stalls in round 7 and run 2 in round 4, each at the mDNS claim. Run 2 was ended by killing QEMU, so the peer's result prints: `a racer's connect: Connection reset by peer (os error 54)`.
- `logs/base-loop-run2.pcap.txt`: that boot's wire. Round 3 has two SYNs to 7070 (62866, 62867); round 4 has one (62868), followed by the peer's FIN as its thread ended.
- `host/maxqlen.out`: `netstat -Lan` on QEMU 11.1.1's `hostfwd` listener: maxqlen 1.
- `host/stopped.out` (`stopped.py`): with QEMU running, two connects both connect. With QEMU suspended (SIGSTOP), so that slirp accepts nothing, the first sits unaccepted (`1/0/1`) and the second is reset (error 54).
- `host/backlog.out` (`backlog.py`): a macOS listener with backlog 1 that never accepts resets every connect after the first. With backlog 8, none.
- `logs/ci-host.log`: `cargo run -- --ci host` at `bde3e08ba`'s tree before commit, exit 0, 104 steps green.
- `soak/head-1..40.log`: the committed test alone at `bde3e08ba` (`patches/soak.sh`, three streams), 40/40 exit 0. Run without `--nocapture`, so these logs do not show where the claim fell.
- `soak/headloop-1..12.log`: `bde3e08ba` plus `patches/instr-head.patch` (the same 40-round loop on the fixed harness), `--nocapture`, three streams: 12/12 exit 0, 480 races; the mDNS claim fell inside the rounds in 10 of 12 boots.
- `soak/baseloop-1..6.log`: the whole change reverted onto base plus `patches/instr-base-control.patch` (instr-1 with a 30 s job ceiling), same session and setup: 6/6 fail. Four peers ended with ECONNRESET on connect. Two ended with `Invalid argument (os error 22)` from the unlabeled `set_read_timeout` straight after a connect; that this is the same reset is an inference (macOS answers setsockopt on a reset socket with EINVAL), not measured.
