# ab6: #1129 review r1 (`1178599c4`) on the AMD bench, judged

Base `f6c2c08cd` (#1117 `e8e96821c` + #1126) against head `ae8f5f443` (#1129 `1178599c4` + #1126). 8 benchcase boots, interleaved
base/head, one image per side, every boot EXIT=0 with runner verdict `passed`. Judge logs: `judge/`.

Rules fixed before the run (`request-amd.txt`, ab5's verdict): read the ipc and fs pairs' `ran=` and p50; read the ab5 slowdowns;
a row resolves only when all 4 of one side beat all 4 of the other (p = 0.029).

## Placement

Every pair is in one LLC on head (ipc 4/4, fs 4/4; base ipc 2/4, fs 3/4). But on head the pair shares one core in 5 of 8:
- ipc.reqrep.8: cpu3+cpu2 7936 ns, cpu11+cpu10 7925, cpu11+cpu10 7975; two cores (cpu10+cpu9) 6883.
- fs.disk.read_4k_at: cpu0+cpu1 11712, cpu2+cpu3 11713; two cores 9649, 9809.
- Base: no pair on one core. Two cores of one LLC 6743-6793 / 9488-9699 ns; split 8396-8426 / 11743.

On one core a pair reads about as slow as split (fs: 11.7 against 11.7). `pipe.throughput.16384` reads 3.66-3.81 GB/s on head
against 8.53-8.65 on base (0.43x), the signature of a writer and reader sharing a core.

Cause (code, then a host test): a request/reply waker has usually parked when its wake is placed, so its CPU reads asleep and
`busy_siblings` counts its SMT sibling as a free core, and `idle_in_llc` scans from the waker, so the sibling comes first. A host
test reproduces it (cpu5, the waker's sibling, is chosen). Fixed in #1129 `b01360923`: the move skips the waker's core.

## The ab5 slowdowns

- wake.storm.call.w1/w4: no longer resolve (ratios 1.016, 0.985). call.w64 +5.6% and drain.w64 +2.7% still resolve.
- thread.spawn_join.default/stack64k: no longer resolve (1.030, 1.052, each with one outlying boot).
- mem.munmap_touched_remote.4k: still resolves, +10.5% (2685-2875 against 3045-3086).
- wake.periodic.idle: bimodal on head (5.8 us twice), not resolved.

New: pingpong.futex.cross_core (pinned cpu1/cpu2, held 41/41) reads 491 and 4469 ns in two head boots against 160-171; not explained.

## A bias every A/B here shares

`tail.diag.periodic.30s` and `tail.wake.periodic.60s` are timer wakes no change in this stack reaches, yet head reads them slower in
all three A/Bs of three unrelated changes: ab5 +0.7-0.8%, ab6 +1.5-1.6% (resolved), the T14 #1111 A/B +1.6-1.7% (resolved). In each
pair the base boots first and the images differ, so boot order or image layout biases head by about 1-3% on such rows. A shift of
that size is not attributable in these A/Bs. Balancing the order (base, head, head, base, ...) separates the order half.

## Verdict

The rule as measured must not land: one-core placement costs the pairs what the rule was to save, and pipe throughput halves.
`cac9ade2e` fixes the cause; it needs a new AMD A/B (ab7), in balanced order.
