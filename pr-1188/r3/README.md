# PR 1188, round 3: review r1's text fixes and deletions

- `ci-host.log`: `cargo run -- --ci host` at 83ddb42f4, exit 0. The round
  changes text and deletes dead checks and tests only, so no image build and
  no guest or metal rerun.
- `metal-judge-t14.log`: the harness's judges over the T14 `testcases`
  boot at f6dc7d0ff (the orchestrator's run). Three rows pass:
  `claim_reuses_its_remapping_entry`, `domains_map_clear_of_the_host_bridges`
  and `usbd_drives_the_type_c_controller`.
  `i219_messages_on_its_msi_vector` fails at its last step: "no frame
  arrived on a message under traffic".
- `t14-kernel-excerpt.log`: why that failure is not this branch's.
  - The boot has no `DMA FAULT` line.
  - Every forced cause was delivered on the claim's MSI, unmasked and masked.
  - Transmit wrote back 65 descriptors through grants in the new window.
  - The MAC's own receive counters, which count frames before any DMA, saw 0
    frames on the wire.
  A placement defect would show frames the MAC took with no descriptor
  written back, or a fault. This shows a silent link partner.
- The AMD `testcases` boot is still queued.

Paths, user, host, machine model, and the benches' vendor, product and BIOS strings are masked.

## The AMD `testcases` boot at f6dc7d0ff (the orchestrator's run)

- `metal-judge-amd.log`: `amdvi_translates_the_boot_controller` passes.
- `amd-kernel-excerpt.log`: the exit of the closed
  `the-hdmi-audio-function-1002-1637-is-driven-at-no-address-width` record.
  - `03:00.1` [1002:1637] is handed over in domain3, whose addresses run
    "from 0x200000 to 0x100000000", so the window ends at 4 GiB.
  - Its grant maps at 0x200000.
  - hda walks codec0 (vendor=1002 device=aa01, 1 function group), ends with
    "plays nothing" (no output a human can hear), and the function is
    released with a D3hot reset.
  - The whole kernel log has 0 `DMA FAULT` lines.
