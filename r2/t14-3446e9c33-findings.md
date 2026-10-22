# T14 at 3446e9c33: the non-zero exits, each traced

Readback: agents/backing/metal/testcases/kernel.log (239 jobs). Baseline: agents/spawn/metal-r2-B/testcases (main, 234 jobs, T14), and the aperture and dma-limit readbacks for the rows those boots ran.

| job | exit | cause | new? |
|---|---|---|---|
| audio_tone, audio_tone_resampled, tone_beside_stick_write, volume_step | 101 | `hda 00:1f.3: plays nothing: the kernel refused the lent region's mapping: Unlendable`. soundserver made its output ring with `SharedMemory::create`; since stage 2 only an `SHM_DEVICE` region (one physical run) can be lent to a device. Fixed: the ring is `create_for_device` (in #1003's round-1 commit). QEMU's `hda_plays_to_the_controller_that_reaches_an_output` passes at the new head. | yes, mine; fixed |
| acpi_counted, acpi_hold | 101 | Not memory. Both wait for lines in the log logkeeper serves "from its first line". This boot's log reached part 39 and logkeeper deleted parts 2 to 38 (`/log holds more than 16 logs`): 16 MB of log, against 7.4 MB on main. The excess is `counters_metal`'s loaded phase: one kernel `exit:` line per child it spawns for 20 s, 49,000 children here against 22,000 on main, since a spawn now costs 45 µs instead of 0.7 ms. acpi_counted gave up at 73 s (its line came at 79.8 s); acpi_hold's bound since boot had passed by the time it ran (85 s). | consequence of faster spawn; test-design defect, not fixed here |
| usbd_spare_vector | 101 | "the function has no MSI-X capability". It is the AMD bench's row (`amdvi_usbd_drives_its_own_entry`, the Bluetooth controller's xHCI) staged into the T14's testcases image because `boot:testcases` took every row on that boot. No T14 readback runs it; the AMD readbacks (dma-limit, aperture) pass it. | no |
| wake_onto_busy | 6 | Its exit code is its p99 in µs; the `wake_onto_busy` row passes below 1000. | no, a pass |

The same lost-parts condition is why a judge of this readback refuses the whole testcases boot ("testcases's own log is missing its parts 2 to 38; no row is judged on it", 257 rows). The shared-debug rows, osbench and the other boots judge PASS.

**Exact judge command** (judges a readback when one is present, and stages when not; it touches no machine):
`cargo test --test toyos-build -- --metal --metal-readback <dir> boot:testcases boot:shared-debug pmm_accounting osbench`
Rows on boot:testcases that this T14 run should be judged on: the shared members (every shared Rust test and the C corpus), `hda_tone`, `tone_beside_a_stick_write`, `hda_tone_resampled`, `hda_volume_step`, `wake_onto_busy`, `counters`, `acpi_server_events`, `acpi_tables_loaded`, `battery_read`. `amdvi_usbd_drives_its_own_entry` rides the same boot but is the AMD bench's.

**The counters_metal log volume** needs a decision, since the whole testcases boot is unjudgeable while it lasts: (a) bound the loaded phase by a child count rather than 20 s, (b) give `counters` a boot of its own, or (c) raise logkeeper's retention. (a) keeps one boot and makes the boot's log independent of spawn speed; it shortens the load where spawns are fast.
