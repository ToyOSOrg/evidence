# The descriptor calls' code at d8f9a490b, at 35d452b2a and with S3

Each directory holds one normalized disassembly per descriptor-table function: the `toyos_fd_*` entry points, `toyos_fd_acquire`'s closure (the lock-free loop) and the owner's `table`. `fdfuncs.sh` made them: `llvm-objdump -d -r` of each function's section, with crate disambiguators, anonymous-constant hashes and exception-table numbers masked.

- `production-d8f9a490b/`: from `libtoyos-*.rlib` in the `x86_64-unknown-toyos` sysroot the build made at d8f9a490b, which is std's copy of the crate that every program links.
- `local-d8f9a490b/`, `local-35d452b2a/`, `local-s3-tailcall/`: the `toyos` crate built with `--release --lib --features fd-table --target x86_64-unknown-toyos`, `codegen-units = 1`, by that sysroot's own `rustc` and `cargo` (`compiler.txt`). The sources were `git archive` of `sdk/toyos` and `sdk/abi` at d8f9a490b and at 35d452b2a, and 35d452b2a with `s3-settle-tailcall.patch` applied.

`summary.txt` holds the results:

- The local build reproduces production for `toyos_fd_acquire`, its closure, `toyos_fd_unuse` and `toyos_fd_inheritable` byte for byte. `table` and the writer-side entry points differ there only inside the writer lock's wait path, from std's own build of the crate; `table`'s check of the endowment flag is the same.
- At 35d452b2a all eleven functions are byte-identical to d8f9a490b. The round's changes to compiled code are renames and a `cfg!`-selected ordering that folds to the same constant.
- With S3 only the closure changes: one more callee-saved register (`r12`) pushed and popped, a frame of 0x20 bytes instead of 0x18, and the slot pointer in `r8` instead of `rsi`; the settling path is a tail call to a cold `settled`.
