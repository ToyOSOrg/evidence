# r5: #1077's metal A/B at 342ecc142 read, then the fix and rebase at 549f1c44d

Boots run by the orchestrator. The T14 ran 8 netbenchcase boots (4 base on 190f3b164, 4 head, interleaved) with the AMD bench's Linux as osbench-peer, then 8 benchcase boots. The AMD bench ran 8 benchcase boots. Each bench ran one head testcases boot. All 26 boots exited 0. Readbacks are kept with the orchestrator; they are not published because the kernel logs name the card's MAC.

- **netbenchcase-342ecc142.txt**: every one of the 8 boots refused the lan group with `no netstack link holds 10.0.2.15` (std's literal local address, issues/getsockname-answers-an-address-nobody-asked-netstack-for.md, PR #1147). No lan row was measured.
- **benchcase-ab-342ecc142.txt**: `python3 -I ab.py <bench>/benchcase`, which gives per-row p50 medians, the exact two-sided Mann-Whitney p over 4 against 4, and the direction. The syscall-heavy rows resolved worse at head on both benches: 15 fs.* rows and pipe.throughput.{64,256} on the T14, and 18 fs.* rows and 3 pipe rows on the AMD bench. Examples: fs.mem.fstat +7.0% (T14) and +15.4% (AMD), fs.disk.pread_4k +6.1% (T14).
- **pmm_accounting**: passed on both benches.
- **logs/host.log** (`cargo run -- --ci host`, exit 0, 111 steps) and **logs/qemu.log** (`shm_commit_alone stream_holders kernel_objects_refused_alone netstack_holders_exported_to_children`, exit 0, 4 of 4) are at 549f1c44d: the allows fix, rebased onto main 058bea2d3.
