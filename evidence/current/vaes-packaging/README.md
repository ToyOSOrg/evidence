# Package and documentation checks

Source 220f97867d9e4427dfb07d291df905dd0927e3b3 (before test splitting).
`cargo package --locked --offline` succeeds, including package verification.
The inventory and archive hash are recorded. The package contains no comms,
evidence, tools or comparator tree. No package was published.
`cargo doc --locked --offline --no-deps --features std,sign,wpa2,rustls-provider`
passes with RUSTDOCFLAGS=-D warnings. These are build/documentation checks,
not deployment qualification.
