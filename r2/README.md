# ToyOSOrg/ToyOS#1277, round 2, host evidence

Head `389bda0422629f6787d0abd216614dd245dd5e8c`, on main `302fb3698` through the stack. Masked as round 1.

- `README.md`
- `a1r2-clippy.log`
- `a1r2-host.log`

The full `cargo run -- --ci host` of this round ran at the top of the stack, #1279's `c07ac2ef31a76d231f2d657180e6b24f30a5152f` (`pr-1279/r2/b2-ci-host.log`): exit 1, 122 of 123 green, the red the recorded macOS `llvm::tests` failure. The guest runs follow in a later round.
