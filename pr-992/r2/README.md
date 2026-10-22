# PR 992, round 2: review round 1 at 41e89b9ec (base 78fdac6e7, #990's round 1)

- `ci-host.log`: `cargo run -- --ci host` at 41e89b9ec, exit 0, 87 green.
- `inspection/`: the shipped-profile code of every secret scalar-multiplication path, for `x86_64-unknown-toyos` and `aarch64-unknown-toyos`. Its README gives the method, the branch classification and the erasure stores; `branches.py` is the scratch tool that walked the call graphs.
- `rosetta-adx-sigill.log`, `rosetta-ill.rs`: Rosetta 2 reports ADX through CPUID, but `adcx` and `adox` raise SIGILL (exit 132); `mulx` runs.

Paths are masked as $HOME, $SCRATCH, $WORKTREE and $PRIMARY.
