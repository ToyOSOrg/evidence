# pr-1189 round 4: the review of round 3

- `hostci.log` at `revision` (61152480a): `cargo run -- --ci host`, exit 0, 108 steps all green. `build.log`: `--build-only` at the same revision, exit 0.
- `controls/mut15`: `lay_out` without its W+X refusal; `a_writable_executable_segment_is_refused` red, green once restored.
- `rows-42103839687.txt` at 61152480a: 19 of 19, the ten x86-64 rows and the nine aarch64 rows.
- Of the 221 programs the build made (ROOT's and the guest tests'), none has a writable-and-executable `PT_LOAD`, which `lay_out` now refuses. Scanned with `readelf -lW`.
- `metal-request.txt`: the T14 `testcases` boot staged at 61152480a, with `abuse_spawn_maps`' two new cases.
