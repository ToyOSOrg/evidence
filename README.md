# PR #1113: the arena holds only what is on the wire, and a flush keeps many writes there

- probe/: the attribution that preceded the change. Two boots, one per bench, of disk-path-probe 21265a06c: #1097's head plus #1098 and #1099, plus measurement-only timers. Both verdicts are `passed`.
  - P-*.lines.txt holds each boot's `disk-path-probe:` lines and its `persist.*` result lines.
  - attribution.txt is attr.py run over each boot's three 8 MiB rounds (lines 4-6 of the probe lines; earlier lines aggregate the small-fsync rows).
- host/ci-host.log: `cargo run -- --ci host` at a122cad77 over the tree in ci-host.diff (base f40791833). Exit 0, 105 steps green; every `error: test failed` lies in a `control` section. ci-host.try1.log is the first run, red on one clippy lint (`ok().expect()`), fixed by amending.
- host/build.log: `cargo run -- --build-only`, exit 0.
- red/red-m*: each mutation as a patch, applied, its named test run and failing (exit 101), then restored.
  - m1: the flush ignores the disk's depth.
  - m2: the flush hands copies.
  - m3: a run is begun after a refusal.
  - m4: the client holds a write's run until the covering flush.
- red/red-mutate-*: the CI's three blockring mutations run against the changed client and model. Each fails its CI-named test, exit 101.
