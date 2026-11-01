# W2a, round 3: ToyOSOrg/ToyOS#1130, review r1 fixed

| check | command | revision | exit | log |
|---|---|---|---|---|
| host CI after the rebase onto main a2a4548b4 | `cargo run -- --ci host` | `b3979f2ba` | 0, 107 steps green | `ci-host-4.log` |
| host CI with review r1's fixes | `cargo run -- --ci host` | `1679ef913` | 0, 107 steps green | `ci-host-5.log` |

`1679ef913` changes in `src/` comments, one reason string and two `if let` that became `expect`. The round-1 controls and the round-2 capture control target lines it does not touch, so they still apply.
