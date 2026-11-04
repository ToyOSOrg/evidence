# bcachefs: nodes written down to reclaim's split bound (8abd51c20)

Review r1 of #1152, S6. On branch `codex/bcachefs-reclaim`, after
`95c79b51d`.

- `small-nodes-1.log`, `small-nodes-2.log`: the experiment, with only the
  32 KiB constant lowered to 16 KiB. On 16 KiB nodes, native and one-block,
  one and two to a bucket, these all ran:
  - churn, and fill to the refusal;
  - full-volume crash/removal/reuse;
  - crash at every request.

  The issue's measurement, repeated: 32 MiB of 16 KiB nodes is refused at
  4715 creates, with 307 journal entries, a clean unmount and fsck clean.
  (The old record: 621130 entries, and an unmount stopped by "journal
  reclaim's share exhausted".)
  - Two crash runs judged 481 and 498 states, under the harness's 500
    minimum. Rerun with 120 operations, both pass.
  - 32 MiB of one-block 16 KiB nodes is too small for the churn's data:
    `NoSpace`, an honest refusal.
- `lib-8abd51c20.log`: `cargo test -p bcachefs --lib`, exit 0, 178 passed.
- `clippy-*.log`: clippy `--lib` with and without std, and `--all-targets`
  with the stale `lib/bcachefs/tests/{crash,integration}.rs` set aside:
  exit 0 each.
- `upstream/`: upstream fsck v1.39.7 on images exported at `8abd51c20`.
  - 4K blocks, 16K nodes: churn, regrouped and full volume, exit 0 each.
  - 16K blocks, 16K nodes: 134, upstream's own split abort on one-block
    nodes, as recorded.
