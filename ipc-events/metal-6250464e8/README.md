# ToyOS #1108 metal: images built at 6250464e8 (head) and a5b330f39 (base)

Boots were run by the orchestrator; readbacks were judged here with the harness at
f961df917, whose tree is byte-identical to 6250464e8. Judging mode is
`cargo test --test toyos-build -- --metal --metal-readback <dir> <rows>` over a
directory already holding each boot's readback; each log ends with `exit=N`.

| judgement | rows | result |
|---|---|---|
| judge-t14-members.log | event_sides, mio_waker_coalesces, cpal_drop_unreleased, hda_tone, hda_tone_resampled | exit 0, 5 passed |
| judge-amd-members.log | same | exit 0, 5 passed |
| judge-t14-mio-control.log | mio_waker_coalesces at the old pin f762092 (negative control) | exit 1, failed as required: "a poll after the wake was reported reported [Token(7)]" |
| judge-{t14,amd}-{base1,base2,head1,head2}.log | osbench (every group ran, DATA on the NVMe) | exit 0, 1 passed each |

The first members judgement attempt at b777405ce failed to build the guest
tests (`connect_before_serve` calls `Connection::write_nonblock`); that commit was
reverted (f961df917) and the judgement rerun. Its log was overwritten.

ab-table.txt: p50 and p99 per osbench row, base boots (1,2) against head boots (1,2),
and the change of the p50 means, from lines/*.lines by ab.py. head carries the
measurement-only waitone rows; base has none.

lines/: the osbench result lines and test markers extracted from each boot's kernel.log.
