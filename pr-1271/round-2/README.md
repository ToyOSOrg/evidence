# PR 1271, round 2: the judge's negative controls and the affected host checks

Revision: `d0b51ab9aa962f4d3644aaf3ab957772aaefb614`. Its tree is the working tree these ran on; it was committed unchanged.

## Negative controls (`negative-controls-r2.log`)

Each patch is applied, `cargo test --test toyos-checks -- a_shared_` is run, and the patch is reverted. Every mutation reds a check, with exit 101:

| patch | what it breaks | check that reds |
|---|---|---|
| `m1-source-half-dropped` | the speaker filter's source half | `a_shared_member_is_judged_by_its_own_end`: the kernel's or another program's `===TEST_END` answers for an unreached member |
| `m2-pid-half-dropped` | the filter's `pid=` half | the same check: "test_rs_stuck is Passed, not failed" |
| `m3-rebooting-not-required` | the end no longer needs the kernel's `Rebooting.` | `a_shared_boot_ends_by_its_lists_reboot`: "a silent reset after the last member" |
| `m4-guest-reset-not-required` | the end no longer needs QMP's `guest-reset` | the same check (a power-off) |
| `m5-rebooting-any-speaker` | a `Rebooting.` from any speaker counts | the same check: "a program's Rebooting." |

The restored tree is green: 3 passed, exit 0.

## Host checks the round can affect (`host-r2.log`)

- `cargo test --test toyos-checks`: 47 passed, exit 0.
- `cargo clippy -p toyos-build --all-targets` with the adopted lints and `-D warnings`: exit 0.
- `cargo test --lib -- sourcegate`: 10 passed, exit 0.

The intermediate commit `7a0939181`, which makes the corpus compile return `Result`, was built from its own index copy. Its `toyos-checks` run gave 46 passed.
