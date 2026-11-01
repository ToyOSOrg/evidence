# #1121 landing A/B, and the rebase onto main

## Landing A/B (metal, run by the orchestrator)
- Base `18060b521` (#1108) against head `c715ebfb5`, osbench (benchcase). T14 and AMD, four boots each, interleaved base, head, head, base. Every boot's verdict: passed.
- Request and rule, stated before the run: `ab-request.txt`. Image checksums: `ab-image-sha256.txt`.
- `osbench/<bench>-<boot>.txt` holds each boot's `bench=` lines; `cpu_model` is masked. These are all `judge.py` reads.
- `judgment-table.txt` is `python3 -I judge.py <runs>` (exit 0); `landing-judgment.txt` is the judgment.
- `round1-base/` holds round 1's AMD base-1 and base-6 boots (tree 4fc78ac97). They are the slow-mode signature comparison.

## Rebase onto main `3add613c1`, head `93adf1c83`
- `cargo run -- --ci host`: exit 0, 107 steps, all green (`ci.log`, `ci.rev`).
- `cargo run -- --build-only`: exit 0.
- Remote QEMU x86-64 under KVM (`remote-qemu.out`), exit 0, 6/6:
  - `traffic_leaves_by_the_second_link_while_the_first_is_down`
  - `a_link_ends_under_a_held_stream_and_comes_back`
  - `netstack_holders_exported_to_children`
  - `stream_holders`
  - `a_client_killed_mid_connect_gives_its_place_back`
  - `udp_receive_times_out`
