# Evidence for ToyOSOrg/ToyOS#1252

Local paths are masked (`<worktree>`, `<scratch>`, `<scratchpad>`, `<home>`, `<tmp>`). Each log ends with its command's exit code.

- `build/`: `cargo run -q -- --build-only` at 766eff4fb, whose tree is b7e35e7b8's (`tree-identity.txt`).
- `host-r0/`: the touched crates' host suites at b7e35e7b8 (`rev`), a clean tree.
- `mutations/`: the SDK's negative controls at 8f5cfaf65, each patch applied, the suite run, the file restored;
  `mut-connect.patch` is the kernel control staged for metal.
