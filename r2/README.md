# Review round 1 at 156e7096c (rebased onto f40791833)

- ci-host.log: `cargo run -- --ci host` of the tree in diff (branch against origin/main), exit 0, 105 steps green; every `error: test failed` lies in a `control` section.
- build.log: `cargo run -- --build-only`, exit 0 (compositor and netstack built for the target).
- ../metal-t14: T14 A/B like ../metal-amd: four boots of #1097 at 069cbbeb8 against two of 34409c9c2 (this PR's first round with #1098), both passed; ab.md made by ../metal-amd/ab.py.
