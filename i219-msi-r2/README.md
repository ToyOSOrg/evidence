# Round 2 at bbc94d4c0bd286823475ffe152cea0bb8aa20bb1

This revision changes one test in `system/netstack/i219/src/delivery.rs`: it adds the T14's measured capability list. The two checks below were run from `system/netstack/i219` and from the worktree root:

- `cargo test`: exit 0, 105 tests plus doc-tests passed.
- `cargo clippy -p toyos-i219 --all-targets -- -D warnings`: exit 0.

The round 1 host CI, image builds and T14 run stand. This commit changes a test only.
