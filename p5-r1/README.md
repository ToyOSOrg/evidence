# ToyOSOrg/ToyOS#1122 round 1: P5 at ad046737b

Home and worktree paths are masked. Guest addresses and MACs are QEMU's user
network's own.

| Log | Command | Revision | Exit |
|---|---|---|---|
| ci-host-1.log | `cargo run -- --ci host` | 44007afd5 on origin/main 49559ddb2 | 1: one red step, the guest libraries: `files.rs`'s count of stream refusals (7 where AddressGone makes 8) |
| guest-libs.log | that step's `cargo test -p toyos -p toyos-window -p toyos-font -p filepicker-api -p logkeeper-api -p toyos-pci-claim` | ad046737b (the count fixed) | 0; 205 tests |
| node-3.log | `cargo test -p toyos-net-node --no-fail-fast` | 81e73d514 (the node commit, before rebase) | 0; 181 tests |
| guest-1.log | the six network guest tests | 6767bd973 | 1: the failover job had no `log` port |
| guest-2.log | the failover test | 6767bd973 + the job waiting on inspect | 1: the first link never read down (virtio-net reported no link) |
| guest-3.log | the failover test | 44007afd5's tree before commit | 0 |
| guest-4.log | `cargo test --test toyos-build -- traffic_leaves_by_the_second_link_while_the_first_is_down netstack_holders_exported_to_children a_link_ends_under_a_held_stream_and_comes_back udp_receive_times_out a_virtio_function_without_access_platform_is_refused iommu_virtio_platform` | 44007afd5's tree | 0; 6 passed |
| control-rank.log | ip, shard and node two-link tests with control-rank.patch (rank ignored) | 44007afd5's tree + patch | 101: the ip rank tests and four shard link tests red |
| control-lost.log | shard links and node streams tests with control-lost.patch (a lost address's flows left) | same + patch | 101: both lost-address tests red |
| control-mdns.log | node links test with control-mdns.patch (mDNS not sent per link) | same + patch | 101: the per-link name test red |
| control-down.log | the failover guest test with control-down.patch (a down link stays eligible) | same + patch, image rebuilt | 1: the job's datagrams refused with the first link down |

Each control patch was applied, built and run, and the file restored, in one
command; the image was rebuilt from the restored tree before guest-4.

guest-4 and the controls ran before the rebase onto 49559ddb2 and the
files.rs count fix; neither touches netstack, the drivers or the harness.
