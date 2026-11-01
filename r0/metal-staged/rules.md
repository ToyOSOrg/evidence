# Stage 3a metal A/B: the rules, set before any boot (2026-11-01)

base = #1141's staged head benchcase (fs-7b/ab/head/benchcase, b4edede36,
whose code #1141's head bfc841314 keeps unchanged); head = fs-3a (head.rev). T14 and AMD.
Order per bench: base, head, base, head benchcase; one head testcases boot. Values are p50s.
#1141's own A/B boots of that base image may stand in for the base boots here if they
ran in the same session on the same bench.

1. The claim: on each bench, `fs.disk.fstat`'s two head p50s both lie below both base
   p50s, and the head mean is at most 0.3x the base mean (a syscall against a round trip).
2. No regression: every `fs.disk.*`, `fs.mem.*` and `persist.*` row, judged as in
   fs-7b/ab/rules.md rule 2 (moved = both heads outside both bases; regression = moved
   worse by more than 5%).
3. The head testcases boot: every listed member exits 0 on both benches.
4. A boot marked INVL, or whose image hash differs, is no value: rerun once, recorded.
