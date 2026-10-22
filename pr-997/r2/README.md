# PR 997 round 1 (cd7960d45) and PR 992 round 2 (d63355844)

- ci-host.log: `cargo run -- --ci host` at cd7960d45 (contains d63355844 unchanged), exit 0.
- barrett-no-subtraction.log: the Barrett control rerun on the new edge values, red.
- controls-results.txt: every control result for #997 to date.
- agree-code/: the shipped-profile (`[profile.toyos]`) code of `p256::SecretKey::agree` and `x25519::SecretKey::agree` on x86_64- and aarch64-unknown-toyos, from #992 round 2's source (d63355844's code, emitted before its doc-only edits). What they erase and what they leave is listed in #992's body.

Paths are masked as $HOME, $SCRATCH, $WORKTREE and $PRIMARY.
