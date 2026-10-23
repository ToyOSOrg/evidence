# PR 1037, round 1: review r1, head f6c63ed0c

Masked: home, worktree and scratch paths.

- `host/ci-host-f6c63ed.log`: `cargo run -- --ci host` at f6c63ed0c, exit 0, all 101 steps green.
- `host/clippy-bcachefs-f6c63ed.log`: `cargo clippy -p bcachefs --all-targets` with the adopted lints and `-D warnings`, exit 0.
- **Judge:** `judge/gen` was rerun at f6c63ed0c. Its eight images match round 0's `SHA256SUMS` (`sums-diff-r1.txt`, diff exit 0), so round 0's judgement stands.
- **Controls** at f6c63ed0c (`controls/run.sh`). Each disables one comparison, and the new
  `an_alloc_need_discard_or_bucket_gens_key_off_its_derivation_is_found` turns red at that comparison's own assertion:

| patch | disables | result |
|---|---|---|
| `c1-no-alloc-compare` | the alloc comparison | exit 101, red at the alloc assertion |
| `c2-no-need-discard-compare` | the need_discard comparison | exit 101, red at the need_discard assertion |
| `c3-no-bucket-gens-compare` | the bucket_gens byte comparison | exit 101, red at the bucket_gens assertion |
