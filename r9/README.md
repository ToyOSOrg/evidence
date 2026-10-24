# #1057, round 9: the host job's timeout in merge-queue run 40088051331

Nothing in #1057 is heavy, and nothing hangs. That run's runner was slow throughout.

- **The same code passed in 38:14.** Merge-queue run 40088246702, pr-1056's group, was queued behind #1057 and so contains its commits: its log runs `frames::tests::a_kept_superframe_split_answers_a_wait`, which only #1057 adds. Its host job took 11:01:55–11:40:09.
- **In the cancelled run (40088051331), every test binary ran slower**, not one test. Times are seconds, base against cancelled:

| binary | base | cancelled |
|---|---|---|
| `log_record` | 13.83 | 20.35 |
| `loom_watch` | 71.30 | 118.37 |
| `policy` | 20.41 | 34.93 |
| `differential` | 30.27 | 46.69 |
| `transport_loom` | 106.69 | 195.62 |
| the kernel library, frames laws included | 8.51 | 14.23 |
| "the workspace's host members" step | 897 | 1154 |

  Full lists: `ci-host-*-test-binaries.txt`, `steps-*.txt`. The cancelled job had not yet reached the step for the libraries built for a guest (235 s in the base run) when it hit 45:16.
- **Locally (`cargo test -p kernel --lib frames`, debug, the host job's profile)**, the 38 frames laws, the 40 000-step model among them, finish in 0.01 s (0.09–0.11 s wall over three runs). The model alone also takes 0.01 s.
- **The branch merges cleanly** with main at `e9abdd348`, so no rebase is needed.
