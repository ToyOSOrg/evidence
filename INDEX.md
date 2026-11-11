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

`host-97b413994/checks.sh` also ran `cargo fmt --check -p toyos -p diskserver`, which exited 1 (`fmt-check.log`). No gate in the repository runs rustfmt, and main's own files differ from its defaults as well (31 hunks in `sdk/toyos/src/ipc.rs` alone), so the result decides nothing about this change.

## Review r1, head 602db29e9

602db29e9 differs from d09c3e470 only in `system/compositor/src/session.rs`, which no host builds.

- `host-602db29e9/`: the targeted host checks at the head, with a clean worktree (`da39a3ee5e6b` is the hash of an empty diff).
- `mutations-d09c3e470/`: the five negative controls of `sdk/toyos/src/admission.rs`, which is the same file at 602db29e9.
- `build-602db29e9.log`: `cargo run -- --build-only` at the head, which builds every program for the guest.
- `metal-stage-602db29e9.log`, `metal-request-602db29e9.txt`: metal images staged at the head; no machine touched.
- `guest-43050908618-at-97b413994.log`: the job log of guest run 43050908618 at 97b413994, the head before review r1. The runner's machine name is masked as `<host>`.
- `guest-43066328896-at-602db29e9.log`: the job log of guest run 43066328896 at 602db29e9, all six rows passed. The runner's machine name is masked as `<host>`.
