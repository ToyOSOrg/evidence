# PR #1134 r4: review r1's fixes, at display-stage3 4d54cce89

- `ci-host.log`: `cargo run -- --ci host` at 4d54cce89, exit 0, 107 steps green. It includes:
  - `toyos-display-output`'s 9 tests, three of them new: a hello past the deadline, every way out of protocol, and a served output's answers;
  - `toyos-tgl-display`'s 37;
  - the harness's audio fixtures, two of them new for `on_an_output`.
- `judge.txt`: r3's T14 readback (f256164ab) re-judged offline at 4d54cce89. `display_output_presents` PASS, with pipe A frames 421 to 453.

Paths and machine strings are masked.
