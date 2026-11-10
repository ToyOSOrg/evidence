# PR #1202: a journal entry is one flush and a forced write

Everything here is for `8a8ff27b969b8a0339237ac544f21ea4419546fc` (branch `block-fua`, base
`f9b5d7f12`). Paths are masked: `<scratch>` is the implementer's scratch directory, `<home>` and
`<tmp>` the host's, `<host>` a machine's name.

## Host (a macOS arm64 development host)

| file | command | exit |
|---|---|---|
| `host/ci-host.log` | `cargo run -- --ci host` | 1: 110 of 111 steps green; the one red is `llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key`, recorded in `issues/the-llvm-environment-test-breaks-git-on-macos.md` as red on every macOS host |
| `host/build-only.log` | `cargo run -- --build-only` | 0 |
| `host/mutation-journal-unforced.log` | `cargo test crash` in `lib/bcachefs` with `host/mutation-journal-unforced.patch` applied (the journal's entry written with a plain write), then restored | 101: 15 of 19 red |

The committed control `mutate-fua-goes-out-unforced` ran inside `host/ci-host.log` (search for
`control \`mutate-fua-goes-out-unforced\``): its named test FAILED, as a control must.

## Guest (the guest runner, x86-64, KVM)

`guest/guest-rows-42918253433.log`: `gh workflow run guest-rows.yml --ref block-fua -f filter='nvme_disk_boots
the_data_partition_beside_the_stick_is_designated the_log_lands_on_the_boot_stick'`, run
https://github.com/ToyOSOrg/ToyOS/actions/runs/42918253433, conclusion success, 3 passed of 3.
A green run keeps no serial log, so the drivers' bring-up lines are not here.

## Metal: staged, not run

- `metal/rules.txt`: the decision rules for the A/B, fixed before any boot.
- `metal/stage-F.log`, `metal/request-F.txt`: `cargo test --test toyos-build -- --metal --metal-readback <dir> osbench_disk`
  at this revision. Exit 2 is the harness's "staged": no machine was touched and nothing is judged.

No figure from a bench is in this commit.
