# Review round 2 evidence for ToyOSOrg/ToyOS#1048 (storage B5)

**Revision:** head `298a57aa69162445a3fc159656627e1b74c62e6a`, round 2 on top of `1172d82a5`. Masked paths: `$WORKTREE`, `$B5`, `$STORAGE`, `$SCRATCH`, `$HOME`.

## host/

- `bcachefs-tests-r2.log`: `cargo test -p bcachefs` exits 0, with 153 lib tests.
- `clippy-r2.log`: clippy with the adopted lints exits 0.
- `ci-host-r2.log`: `cargo run -- --ci host` exits 0, "Host: 102 step(s), all green". The FAILED lines inside are the CI's own controls.
- `build-only-r2.log`: `cargo run -- --build-only` exits 0.
- **No QEMU boot this round.** Round 2 leaves mkfs and the reader's behaviour unchanged, so ROOT's bytes are those booted in r1.

## controls/

All 39 controls ran in one pass at the head (`all.log`). Each was applied, built, run and reverted, with file hashes verified. All are red: 37 with test exit 101, and 2 hung until the watchdog killed them (exit 143). The 8 new ones:

| patch | undoes | red test |
|---|---|---|
| f-node-floor-unchecked | the 16 KiB node floor | mount::small_blocks_and_a_journal_position_off_a_block_are_refused |
| g-oversized-counts-clean | counting only changed nodes as oversized (a stall) | mount::a_packed_leaf_past_a_node_once_unpacked_is_read_then_split |
| g-split-in-two | splitting as far as needed | the same |
| g-apply-resolves-late | finding every node before changing any | the same |
| g-restate-position-unmoved | the member's position after S | mount::a_clean_volume_with_an_empty_journal_survives_a_crash_going_read_write |
| g-restate-trusts-offset | scanning for `clean`'s entry | the same |
| g-restate-after-position | placing S at the bucket's start | the same |
| g-torn-copy-in-order | rewriting a torn superblock copy first | the same |

## judge/

The judge is upstream bcachefs-tools v1.39.4, `fsck -n -K`, in B2's VM.

- `judge5-run.log` (B5b) and `judge5-run-c.log` (B5c): 56/56 and 24/24 PASS. They judged the images `judge5-gen-*.log` wrote. At the head (`judge6-gen-*`) those images are byte-identical (`regen-comparison.txt`).
- `judge6-run-d.log`: 282 PASS. The two FAILs are the negative controls `ctl-torn-elsewhere` and `ctl-torn-none-pending`, as required.
  - The corpus now holds second-crash states, `empty-journal-<seq>-<n>-again-<k>`. Each comes from one of the first eight first-crash states, then a crash after each request of the next mount going read-write.
  - Crash images are judged by `judge_torn`, using the sidecars in `sidecars/`.
  - At round-2 WIP, four second-crash states carried two torn copies: one torn by the first crash, the other by the second. The writer now rewrites a torn copy first, and those images (six now differ) pass at the head.
- `vm-sha-*.txt`: the VM holds the host's bytes.
