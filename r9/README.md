# PR #1074, round 9: hda_tone across every distinct T14 testcases boot

Each boot's `hda_tone` row was judged by `cargo test --test toyos-build -- --metal --metal-readback <dir> hda_tone`. Head boots were judged from a tree at 094323f29, main boots from 370d7d9f6; the judge's code is the same in both. `tone-*.txt` holds each boot's soundserver stats lines for the tone stream.

| Boot | Tree | hda_tone |
|---|---|---|
| early4 (session 2) | #1074 head 1f828f331 | pass |
| early6 (session 3) | #1074 head | pass |
| early8 (session 4) | #1074 head | pass |
| early9 (session 5) | #1074 head 0a48bf8b4 | pass |
| early1 (final A/B) | #1074 on 9d818b3ed | pass |
| head7 | 094323f29 | **fail, underruns=1 in the first window** |
| tone-head-b | 094323f29, head7's image | pass |
| tone-main-a | main 370d7d9f6 | pass |
| tone-main-c | main 370d7d9f6 | pass |

Result: 1 failure in 7 head boots, 0 in 2 main boots. If both trees failed equally, the one failure would land on a head boot with probability 7/9, so it is not attributable. Earlier counts of "eight head boots" were five distinct boots: some judge directories copied a session's readback.
