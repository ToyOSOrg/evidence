# Evidence for ToyOSOrg/ToyOS#1252

Local paths are masked (`<worktree>`, `<scratch>`, `<scratchpad>`, `<home>`, `<tmp>`). Each log ends with its command's exit code.

- `build/`: `cargo run -q -- --build-only` at 766eff4fb, whose tree is b7e35e7b8's (`tree-identity.txt`).
- `host-r0/`: the touched crates' host suites at b7e35e7b8 (`rev`), a clean tree.
- `mutations/`: the SDK's negative controls at 8f5cfaf65, each patch applied, the suite run, the file restored;
  `mut-connect.patch` is the kernel control staged for metal.
- `clippy-r0/`: clippy with the workspace's adopted lints and `-D warnings` on every shape that builds touched code, at 9186185dd (`rev`); `clippy.sh` and `host.sh` are the commands.
- `host-r1/`, `clippy-r1/`: the same host suites and clippy shapes again at c06d210be, the PR's head (`rev`), a clean tree.
- `guest-crates/`: every touched guest crate checked against the head's sysroot (the image build compiles none).
- `guest/run-43053472977.txt`: the first guest run's verdicts at 8f5cfaf65: 19 of 20 pass; `libc_children` red in `tty_interrupt`.
- `metal-staging/`: the staging logs (exit 2 is staged, machine untouched) and `request.txt`, the boots asked for. `-r1` logs are
  the first attempt, which the guest-test compile errors ended.

## After the rebase onto main 6d0cb3ae9
- `guest/run-43060146035.txt`: `libc_children` alone at 1fa5d42d1, no fix: green. The first run's stall was a race.
- `shell-race/`: the shell's quit model (`cargo test -p shell-copies`) at b607b0fa2: the baseline exits 0; `mut-landed.patch`
  (`Asked::landed` deciding without taking the notice, as main's shell did) reds
  `a_child_that_never_listens_ends_with_the_interrupt_in_every_order` on `[Quit, Land, Look, Heard]`, exit 101, restored.
- `build/build-only-b607b0fa2-user_str-dead.log`: the kernel refused `user_str`, left with no caller; removed in 2bbd17005.
- `build/build-only-2bbd17005.log`, `host-r4/`, `clippy-r4/`: the image, the touched crates' host suites (with `shell-copies`)
  and clippy at 2bbd17005. `clippy-r4/shell-copies.log` is the `new_without_default` finding; `shell-copies-fixed.log` and
  `host-r4/shell-copies-fixed.log` are 6aff1970d's derive, linted and tested.
- `metal-a/`: the shared boots `testcases`, `shared-debug` and `proctreecase` staged at 2bbd17005 for each bench, with each
  bench's request.

## Review round 1, rebased onto main e558cc153
- `guest/run-43075819858.txt`: the 20 rows at 2bbd17005, 20 pass.
- `build/build-only-014f2da9d.log`, `host-r5/`, `clippy-r5/`: the image at 014f2da9d, and the touched crates' host suites
  and clippy at d3643d86e (`rev`), which differs from 014f2da9d by three comments in `tests/images/`. The host-buildable
  programs (disks, diskserver, fileserver, netstack, nvme, pkg, session, soundserver, sshserver) are tested, not linted.
- `metal-a-r5/`: the shared boots staged at d3643d86e for each bench, with each bench's request; they supersede `metal-a/`.
