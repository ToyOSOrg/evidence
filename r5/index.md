# pr-1243 r5: review round 3 suggestions and the owed metal list, ToyOS 8c203f6e8 (the head)

8c203f6e8 changes, against 8d57dcf87, two comments in `kernel/src/arch/x86_64/`, one assertion inside
`kernel/pure/mitigation.rs`'s `#[cfg(test)]` module, and the lines record: nothing an image builds. Guest run
43082719564 at 8d57dcf87 therefore covers this head.

| File | Command | Revision | Exit |
|---|---|---|---|
| `host/a-r5.log` | `cargo test -p kernel --lib mitigation`; `cargo clippy -p kernel --lib --tests --features sched-check -- <adopted lints> -D warnings`; the control below | 8c203f6e8 | 0, 19 passed; 0 |
| `control/mds-no-dropped.{patch,log}` | the `MDS_NO` term dropped from the primary propagator's exemption, tested, reversed with `git apply -R` | 8c203f6e8 | 101: `the_primary_propagator_alone_matters_where_fill_buffers_can_be_read` fails at the new assertion |

Host paths, user and host names are masked.
