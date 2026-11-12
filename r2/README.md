# ToyOSOrg/ToyOS#1279, round 2, host evidence

Head `c07ac2ef31a76d231f2d657180e6b24f30a5152f`, on main `302fb3698` through the stack. Masked as round 1.

- `README.md`
- `b-control-inverted.diff`
- `b2-buildgate.log`
- `b2-builds.log`
- `b2-ci-host.log`
- `b2-clippy.log`
- `b2-host.log`
- `b2-mutant-short-everywhere.diff`
- `b2-mutant-short-everywhere.log`
- `b2-pure-1.log`

The full `cargo run -- --ci host` of this round ran at the top of the stack, #1279's `c07ac2ef31a76d231f2d657180e6b24f30a5152f` (`pr-1279/r2/b2-ci-host.log`): exit 1, 122 of 123 green, the red the recorded macOS `llvm::tests` failure. The guest runs follow in a later round.
