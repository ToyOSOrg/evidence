# PR #1132 r3: review r1's fixes, at display-stage2 aa618bbb7

- `ci-host.log`: `cargo run -- --ci host`, exit 0, 107 steps green. It includes `toyos-tgl-display`'s 33 tests, 2 of them new: a panel on DDI B is refused untouched, and a wait preempted past its deadline reads the well again.
- `build-only.log`: `cargo run -- --build-only`, exit 0.
- Negative controls. Each patch is applied, `cargo test -p toyos-tgl-display` runs, and the patch is reverted in the same run. Each compiles, and its run exits 101, with exactly the test aimed at it failing:
  - `mutation-ddi-a-to-c`: DC6 accepted on DDI A-C again. `a_panel_on_ddi_b_is_refused_untouched` fails.
  - `mutation-stale-verdict`: the verdict taken from a read before the deadline. `a_wait_preempted_past_its_deadline_reads_the_well_again` fails.
  - `mutation-pins-kept`: AUDIO_PIN_BUF_CTL not cleared. `the_t14_loads_the_program_powers_down_pg3_to_pg5_and_allows_dc6_last` fails.

  The mutations ran on the r1 working tree before its commit, whose tree they share.

The T14 evidence the review asks for, hda's tone after DC6 and pipe A's frames through it, rides #1134's `display_output_presents` boot, staged on this fix.

Paths are masked.
