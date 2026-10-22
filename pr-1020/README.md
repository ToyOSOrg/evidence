# #1020: the host's HTTPS on toyos-crypto's rustls provider

- `ci-host.log`: `cargo run -- --ci host` at 0ff4b2851. Exit 0, 93 steps green.
- `tlscheck.rs`, `tlscheck.Cargo.toml` and `tlscheck.txt`: a scratch program with the same provider and group policy as `release::agent`, at ureq 3.4.2. It fetches from GitHub's API, the crates.io index, a GitHub archive (through its redirect) and static.crates.io, getting 200 and a body from each. Rerun when this evidence was published.
- `doom-build-script-output.txt`: doom's build script line after `apps/doom/doomgeneric` was removed, which shows the download ran through the new provider during `cargo run -- --build-only` (exit 0).
