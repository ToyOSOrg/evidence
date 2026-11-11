# PR #1131 r12: the first review's fixes, their checks and mutations

Head `a84c64a88da779653956ad57fe1b8df672efd781` (branch `nvme-apst`). The code fixes are in `56318e297`
and the records in `a84c64a88`. Run in one script on a macOS arm64 host, with the tree clean. Paths
are masked. `$ADOPTED` is the `-W` list of the repository's adopted clippy lints, which
`build/clippy.rs` splices in.

| log | command | exit |
|---|---|---|
| `test-nvme-apst.log` | `cargo test -p nvme-apst` | 0: 12 passed |
| `test-nvme.log` | `cargo test --manifest-path system/nvme/Cargo.toml` | 0: 5 passed |
| `clippy-nvme-apst.log` | `cargo clippy -p nvme-apst --all-targets -- $ADOPTED -D warnings` | 0 |
| `clippy-nvme.log` | `cargo clippy --manifest-path system/nvme/Cargo.toml --all-targets -- $ADOPTED -D warnings` | 0 |

## Mutations

The script applies each patch to `system/nvme/apst/src/lib.rs`, runs `cargo test -p nvme-apst` and
reverts the patch. Afterwards the source's SHA-256 matched its value before the patch every time
(`summary.txt`).

| patch | what it breaks | exit | tests that failed |
|---|---|---|---|
| `mutation-bound.patch` | the last tier admits any round trip: a table admits a state past the bound, the mutation the APST track's exit names | 101 | `a_state_whose_round_trip_exceeds_the_bound_is_never_a_target` |
| `mutation-latency-rank.patch` | within a tier, the target is the state with the longest round trip, as before the review | 101 | `the_target_is_the_highest_numbered_whatever_the_latencies`, `an_npss_past_31_is_refused_and_31_reads_all_32_states` |
| `mutation-npss-unchecked.patch` | no refusal of an NPSS past 31 | 101 | `an_npss_past_31_is_refused_and_31_reads_all_32_states` |

The two bench tests (`the_t14s_drive_gets_the_table_linux_sets`, `the_amd_benchs_drive_gets_the_table_linux_sets`)
pass both with and without the latency mutation. Both drives list their latencies rising with state
number, so either ranking gives them the measured `0,1,2,3->4 after 100 ms`.
