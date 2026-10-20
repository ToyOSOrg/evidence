# Review round 2 — ToyOS 16bb9e74b

| check | file | exit |
|---|---|---|
| `cargo run -- --ci host` | ci-host.log | 0, 86 green |
| QEMU two-controller row | row.log | 0 |
| exploratory `audio_tone` on that boot | explore-tone.log | 0, 699 completions per 2 s, underruns=0 |
| `testcases` staged, T14 only | metal-stage.log, request.txt | 2 (staged) |
