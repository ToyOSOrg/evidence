# PR #875: the AML interpreter finished

Evidence for https://github.com/ToyOSOrg/ToyOS/pull/875, each file whole and
masked: nothing of either bench's tables but counts and decoded values, the
I/O ports of their C-states as letters, and paths as `<worktree>` and
`<dumps>`.

- `check/`: the check outside the tree, the server's own modules on each
  bench's dump (`main.rs`, its source), its runs' commands and exit codes
  (`runs.log`), and what each wrote (`summary-*.txt`).
- `tools/`: two byte scans of the tables, their output in `check/runs.log`.
