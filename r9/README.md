# PR #1131 r9: rebased onto main, off the closed #1202; checks, and the finishing measurement staged

Head `047e0a708ffcbe976370f1f8643465589cb24dbd` (branch `nvme-apst`), two commits on #1215's
`72ce4d25e`: `349ccb26b` (osbench's after-idle row and Linux's APST read; no driver change) and the
driver's APST. Paths are masked.

| file | command | exit |
|---|---|---|
| `host/ci-host.log` | `cargo run -- --ci host` on a macOS arm64 host | 1: all but one step green; the red is `llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key`, red on every macOS host |
| `host/build-only.log` | `cargo run -- --build-only` | 0 |
| `guest/guest-rows-42983382300.log` | `gh workflow run guest-rows.yml --ref nvme-apst -f filter='nvme_disk_boots'`, https://github.com/ToyOSOrg/ToyOS/actions/runs/42983382300 | success, 1 of 1 |

## Metal: staged, not run

- `metal/rules.txt`: written before any image was staged. The landing rule is the orchestrator's.
- `metal/request.txt`: the two arms, their revisions and image hashes, and the order as a flat list.
- `metal/stage-M.log`, `metal/stage-P.log`: each arm's staging; exit 2 is the harness's "staged".
- `metal/linux/`: how the Linux binary was built and how it is to be run.

No figure from a bench is in r9. The A/B that ran on #1202's base is on branch `pr-1202`, `ab/`.
