# ToyOS PR #1021, review round 2: evidence

Head `2f0da9649`, rebased onto `origin/main` `63bc8a32b`. The conflict was in `system/sshserver/src/main.rs`: I kept
main's code and the PR's two doc comments. `revisions.txt` lists the branch's commits, newest first.

| File | Command | Revision | Exit | Target |
|---|---|---|---|---|
| `r2-host.log` | `cargo run -- --ci host` | `2f0da9649` | 0 (101 steps) | host |
| `r2-build-only.log` | `cargo run -- --build-only` | `2f0da9649` | 0 | image |

Carried over from `../r1/` and `../p0/`, and still valid because main's changes since touch neither the view, the mint,
`make_state_dir` nor osbench's files target:
- QEMU `a_row_reaches_its_own_state_and_no_other`, exit 0 at `b87201d34`.
- The host and QEMU negative controls.
- The orchestrator's T14 runs:
  - `app_view`, at `2d1a26b8d`;
  - `osbench`, at `b87201d34`: `PASS osbench`, `fs.served.dir=/home`, and the files, procs and work groups at exit 0.
