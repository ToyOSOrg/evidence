#!/bin/bash
# The file server's clippy over every target, past the first failing one: $1 = log path.
cd <scratch>/wt-step1 || exit 2
A="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon -D warnings"
{ git rev-parse HEAD; echo "== cargo clippy --manifest-path system/fileserver/Cargo.toml --all-targets --keep-going -- $A"; } > $1
cargo clippy --manifest-path system/fileserver/Cargo.toml --all-targets --keep-going -- $A >> $1 2>&1; echo "rc=$?" >> $1
