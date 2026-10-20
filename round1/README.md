PR #965 round 1. Host: macOS aarch64. Paths masked: <tree> worktree, <scratch> scratch dir, ~ home, <tmp> temp.

| log | command | tree | exit |
|---|---|---|---|
| ci-host.log | `cargo run -- --ci host` (87 steps) | 6699efb9b | 0 |
| guest.log | `cargo test --test toyos-build -- nvme_disk_boots the_opening_exchange_with_qemus_agent_completes the_compositor_drives_the_virtio_gpu usb_keyboard_rollover console_image_boots` (QEMU x86-64) | 6699efb9b | 0 |
| build-x86_64.log, build-aarch64.log | `cargo run -- --build-only --arch <a>` | 10b6bd5d4's code (working tree before the commit; 6699efb9b differs by one Display string in lib/virtio) | 0, 0 |
| controls.log, controls.sh | six mutations, each applied, built, tested red, restored | 10b6bd5d4 | each test run 101 (red), script 0 |
| controls-maxdata-full.log | the vdagent MAX_DATA mutation rerun unabridged | 10b6bd5d4 | red |
| pr2-unit.log | `cargo test -p toyos-blockring -p toyos-vdagent -p toyos-virtio -p toyos-transport --lib` | WIP before squash, same crate sources as 10b6bd5d4 | 0 |
| ci-host-red-stale-artifacts.log | first host CI after the controls | 10b6bd5d4 | 1: the controls script restored files by `mv`, keeping their old mtime, so cargo reused mutated artifacts (inflight's two reds are the `inflight-seq` mutation); the netstack red was real (a Display prefix netstack's test matches) and is fixed in 6699efb9b |
| metal-prep.log, metal-request.txt | `cargo test --test toyos-build -- --metal --metal-readback <dir> pci_capability_walk trace_record_cost abuse_thread_name stream_handles` | 6699efb9b | 2 (staged; no machine touched) |
