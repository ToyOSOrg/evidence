# Review round 1 — ToyOS 66776de2f

| check | file | exit |
|---|---|---|
| `cargo run -- --ci host` | ci-host.log | 1: 85/86; the red is the llvm environment test, red on origin/main too (#952's issue) |
| `--build-only` x86-64 / aarch64 | build-*.log | 0 / 0 |
| QEMU `hda_plays_to_the_controller_that_reaches_an_output` (tree = 66776de2f before the identity_op test-literal fix) | row.log | 0 |
| exploratory `audio_tone` on the same boot | explore-tone.log | 0, 698 completions per 2 s, underruns=0 |
| `testcases` staged, T14 only | metal-stage.log, request.txt | 2 (staged) |
