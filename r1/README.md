# ToyOS #1147 r1: a stream's local address from netstack

Head 9070b6111. Paths are masked: `<dev>`, `<scratch>`, `<home>`, `<tmp>`.

- `checks/`:
  - `ci-host.log`: `cargo run -- --ci host` at bda799704 (exit 0). Since then only two guest jobs' fake answers changed.
  - `guest-failover.log`: the two-NIC guest test, whose streams over the two links left from 10.0.3.15 and 10.0.2.15.
  - `guest-export.log`: the `ADOPT` path.
  - `guest-fakes.log`: `stream_holders` and `libc_children`.
  - `stage-t1.log`: the T14 staging (exit 2: staged).
- `controls/`: each `ctl-*.patch` was applied, run and reverted in one run.
  - `controls-host.txt` (SDK and node controls): both exit 101.
  - `controls-guest-2.txt` (std's literal, two-link check): exit 1.
  - The `*-first-version` files: the earlier control-stream-only check, whose control passed because the links came up the other way round.
- `session/`: the T14 L1, t1, L2 request with its decision rule, and the image hash.
