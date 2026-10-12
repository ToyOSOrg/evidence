# Rust 1.89 x86 compilation

Both default core and optional rustls provider compile for
x86_64-unknown-linux-gnu with cargo +1.89.0 check --locked --offline --lib.
The target standard library was obtained from the official Rust 1.89 manifest,
SHA-256 verified, and extracted into a temporary sysroot. RUSTFLAGS selected
that sysroot; CARGO_TARGET_DIR used a temporary directory. The installed
compiler/toolchain was not modified. Sysroot and build output were removed.
Provenance records the artifact and manifest hashes and official URLs. This
build compiles the VAES/VPCLMUL code that ARM-only MSRV checks could not reach.
It does not execute x86 code or qualify a deployed compiler's timing behavior.
