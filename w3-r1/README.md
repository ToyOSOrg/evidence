# ToyOSOrg/ToyOS#1115 round 1: W3 at 26c6ae4ff

Home and worktree paths are masked.

| Log | Command | Revision | Exit |
|---|---|---|---|
| firmware-hashes.log | `shasum -a 256` of the committed files and licence | 26c6ae4ff | 0; the specification's four digests |
| w3-ci-host-1.log | `cargo run -- --ci host` | the tree before the sourcegate change (uncommitted) | 1; one red step: `sourcegate::tests::no_tracked_file_identifies_a_machine_or_its_network`, a dotted-quad string in the AX200 file |
| w3-ci-host-2.log | `cargo run -- --ci host` | 26c6ae4ff on origin/main 0c7e62ca7 | 0; 105 steps |
| w3-control-device-power.log | `cargo test -p toyos-ax2xx` with w3-mut-device-power.patch | 26c6ae4ff's crate + patch | 101; `every_message_the_driver_exchanges_is_declared_at_a_version_typed_here` red |
| w3-control-scan-forms.log | `cargo test -p toyos-ax2xx` with w3-mut-scan-forms.patch | 26c6ae4ff's crate + patch | 101; `a_scan_channel_carries_its_band_where_the_declared_version_puts_it` red |

The two controls ran on the crate's files as 26c6ae4ff commits them, before
that commit was made, and each patch was restored in the same command.
