# PR #1100 round 1 on metal: one ToyOS boot and one Linux run per bench

ToyOS at 890f5c709 (rebased onto 9c677be10, #1096's FCH watchdog armed by
the loader). Linux binary sha256 6a06b6b5...d96402, the same revision's
osbench. Runs by the orchestrator. ToyOS lines are each boot's `osbench`
lines out of its kernel log; Linux files are the program's stdout. One link
name is masked (`<vpn>`).

Judged: `osbench_energy` PASS on both readbacks (the row's judge, rerun
over the readback). The T14 `counters` row was booted but could not be
judged by filter: the word `counters` also takes `test_rs_counters_silent`,
whose boot was dropped from the request.

Each kernel admitted what the rule says (`toyos-*-kernel-counters.txt`):
the T14 package energy and residency on cpu0, the AMD package energy on cpu0
and core energy on every CPU.

The same workload draws the same on both systems, a cross-check of the unit
decode: one CPU spinning at equal chunk rates, T14 8351 against 7996 mW,
AMD 6848 against 6795 mW.

Invalid in this round, fixed at 5e5c395b9: Linux's `spin.all` (one thread:
the group pinned itself to CPU 0 before counting the CPUs) and Linux's
per-CPU notes (CPU 0 alone, for the same reason). The AMD Linux run never
read "quiet" (one 10 ms tick of /proc/stat failed a strict bar) and waited
out its 120 s; its rows stand.

`compare-round1.md` is `osbench-compare` over the four files: with one run a
side no row can resolve, so it is a record, not a verdict.
