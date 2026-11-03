# #934 review r5's answers, at ad70b5bf5

Masked as in `combined-r5/`.

| file | command | revision | result |
|---|---|---|---|
| `r6-hotplug-{1..5}.log` | `cargo test --test toyos-build -- --nocapture a_function_arrives_and_leaves`, five runs | `ad70b5bf5`'s tree | exit 0 each; each holder line ends `kept=Some(Gone)` |
| `mutation-r6-no-revoke.{patch,log}` | the same, with the reader's revoke dropped and its wake kept, then restored | same | exit 1: `kept=None` |
| `r6-ci-host.log` | `cargo run -- --ci host` | `ad70b5bf5` | exit 0, 109 green |
| `r6-build-x86.log`, `r6-build-arm.log` | `cargo run -- --build-only`, `--arch aarch64` | `ad70b5bf5` | exit 0, 0 |
| `metal-r5b-judge-t14.log`, `metal-r5b-judge-amd.log` | `--metal --metal-readback <scratch>/metal-r5b-judge/{t14,amd} …` over copies of the r5b readbacks | boot `699baad1c`, harness `ad70b5bf5` | exit 0: T14 4/4, AMD 3/3 |

`ad70b5bf5` changes the departure's copy, the holder's wake and `with_bound`'s re-check. None of these is a path the metal rows read: the declaration, the domains and remapping entries, and the boot controllers' claims. Nothing on either bench arms a slot.
