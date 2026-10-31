# ToyOSOrg/ToyOS#1122 round 2: review r1, at d328d2521

d328d2521 is on origin/main 24a538c88. Home and worktree paths are masked;
guest addresses and MACs are QEMU's user network's. Each revision below is
the commit the run's tree was.

| Log | Command | Revision | Exit |
|---|---|---|---|
| r2-tests.log | `cargo test --no-fail-fast` of ip, udp, tcp, shard, testnet, dhcp, node, virtio, link | 542f85ed4's tree before the shard advice test (pre-rebase) | 0; 1155 tests |
| control-advise-ip.log | ip rank tests with control-advise-ip.patch (`advise` looks up with `Source::Any`) | same + patch | 101: the advice test red |
| control-advise.log | shard links tests with control-advise.patch (the shard advises with `Source::Any`) | 542f85ed4's tree with the shard advice test + patch | 101: the shard advice test red |
| control-udpfail.log | shard links tests with control-udpfail.patch (a failure drops every interface's waiters) | pre-rebase tree + patch | 101: the per-link failure test red |
| control-stuck.log | ip rank tests with control-stuck.patch (one shared bound) | same + patch | 101: the stuck-link test red |
| control-otherlink.log | node links tests with control-otherlink.patch (another link's reply reaches this client) | same + patch | 101: the bridged-LAN test red |
| control-sticky.log | node links tests with control-sticky.patch (asked falls to rank with no link up) | same + patch | 101: the asked-link test red |
| guest-r2.log | the six network guest tests | 542f85ed4 | 1: QEMU refused two guestfwds on one port (the restrict=on attempt) |
| guest-r2b.log | the failover test | 542f85ed4 + distinct peer ports | 1: with restrict=on the job's datagram had no route (`NotConnected`) |
| guest-r2c.log | the failover test | 16cf73728 (restrict=on reverted) | 0 |
| guest-r2d.log | the six network guest tests and main's `a_client_killed_mid_connect_gives_its_place_back` | a3a2e18ef (rebased on 24a538c88) | 1: main's new job read the old `net.lease.held` |
| guest-r2e.log | `a_client_killed_mid_connect_gives_its_place_back` | d328d2521 | 0 |
| ci-host-r2b.log | `cargo run -- --ci host` | d328d2521 | 0; 107 steps |
| metal-judge.log | `cargo test --test toyos-build -- --metal --metal-readback <dir> i219_carries_netstacks_link i219_leaves_ulp_unarmed` on the orchestrator's T14 readback | boot of ad046737b, judged by d328d2521's tree | 0; both rows PASS |
| metal-verdict.txt | the readback's verdict | the boot at ad046737b | passed |

Each control patch was applied, run and restored in one command. guest-r2d's
six passing tests ran on an image of a3a2e18ef; d328d2521 changes only
netstack_connect_killed's job, which guest-r2e ran. The raw T14 readback
(boot, kernel and loader logs, the log partition) is not published; the
judge reads it, and its output carries no MAC, address or serial.
