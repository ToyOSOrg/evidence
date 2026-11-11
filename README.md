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
