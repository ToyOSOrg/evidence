# ToyOSOrg/ToyOS#1242: evidence

Each log begins with the revision it ran at. "+ worktree diff <h>" names an
uncommitted diff whose `shasum` is <h>; each one maps to a later commit, as
below.

- `host-4d1fad663/`: the head's targeted host checks (`97b413994 + worktree diff 4b8bf36a8774` is `git diff 97b413994 4d1fad663`).
- `host-97b413994/`: targeted host checks at 97b413994 (`9700737ed + worktree diff 9cdc5d20cf02` is `git diff 9700737ed 97b413994`).
- `host-9700737ed/`: toyos-desktop's lint and tests, and the lint of the converted servers that build for a host, at 9700737ed (`bcc1c4fdb + worktree diff 6a6186777b82` is `git diff bcc1c4fdb 9700737ed`).
- `host-ci-942e9fa56.log`: the full `cargo run -- --ci host` at 942e9fa56.
- `mutations-head/`: the negative controls of `sdk/toyos/src/admission.rs` at 4d1fad663.
- `metal-stage-head.log`, `metal-request.txt`: metal images staged at 4d1fad663; no machine touched.

Paths are masked: `<worktree>` is the branch's checkout, `<scratch>` the agent's scratch directory, `<home>` and `<tmp>` the host's.
