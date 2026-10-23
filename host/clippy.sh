#!/bin/sh
# bcachefs under clippy with the repository's adopted lint set (build/clippy.rs ADOPTED).
cd $WORKTREE && cargo clippy -p bcachefs --all-targets -- -D warnings -D clippy::checked_conversions -D clippy::default_trait_access -D clippy::manual_midpoint -D clippy::redundant_clone -D clippy::unchecked_time_subtraction -D clippy::unnecessary_semicolon
