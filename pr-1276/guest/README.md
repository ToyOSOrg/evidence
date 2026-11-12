# PR 1276: guest rows and the negative control

Both runs: `gh workflow run guest-rows.yml --ref <branch> -f filter='testcases_members_exit_0'`, x86-64 under KVM on the guest runner. The logs are the runs' own, with the runner's home and temporary paths masked.

| run | branch, revision | verdict |
|---|---|---|
| 43151307989 (`guest-rows-43151307989.log`) | `mio-registration-wakes-selector` at `f48024a32c6ec5e73d063530957f0c009782e475`, mio fork `3e070f6` | success: `testcases: 242 member(s) exited 0, and the list's reboot ended the boot`, `5 step(s), all green`; host other work 0.04 CPUs |
| 43151340044 (`guest-rows-control-43151340044.log`) | `mio-registration-wakes-selector-control` at `e29225ffb7324e57580ad2a2011b3d19e635b276`: the PR's head with both lockfiles pinning mio back to main's `4108eff` (`control.patch`) | failure, as predicted: `1 of testcases's 242 member(s) did not exit 0: test_rs_mio_registers_while_parked`, `exited 101`, at the assertion `left: []`, `right: [Token(7)]`; every other member exited 0 |

The control's red comes from the base selector returning at once from a `select` with nothing registered, which this change also ends. A `Poll` holds one `Waker`, and the `testcases` boot runs no netstack, so the test cannot park a base `select` on another registration first. The control branch was deleted after the run; `control.patch` is its whole diff from the PR's code head.
