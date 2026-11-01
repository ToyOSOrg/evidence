# #1121 round 2, head 73cf52240

The call (C2) and the scheduler commit (b24b37a56) are out; whole messages
(`343a655b1`) stand on #1108 `18060b521`, then the session_lifecycle repair
(`edc8770e4`, tree of `e396bb5f1`) and an issue record (`73cf52240`).

| log | what | tree | exit |
|---|---|---|---|
| ci.log | `cargo run -- --ci host` | 343a655b1 | 0, 107/107 |
| remote-qemu.out | 19 QEMU registrations (runner) | 343a655b1 | 1: 18/19, `session_lifecycle` red |
| session-runs/remote-session-18060b521.out | `session_lifecycle` | 18060b521 | 0 |
| session-runs/remote-session-343a655b1.out | same | 343a655b1 | 1: holder killed before it listened |
| session-runs/remote-session-fix-*.out | same | d38d1723f (direct detach, row not yet granting it) | 1, 1: launch refused PermissionDenied |
| session-runs/remote-session-fix2-*.out | same | 04f0b3548 (direct detach for both uses) | 0, 0 |
| session-runs/remote-session-final-*.out | same | a655c527c (shell detach kept for the first use) | 0, then 1: the first use's holder killed before it listened |
| session-runs/remote-session-last-*.out | same | e396bb5f1 | 0, 1, 0 |
| session-runs/rate-*.out | same, interleaved | 18060b521 ×3, e396bb5f1 ×3 | base 0,0,1; head 1,1,0 |

Every red at e396bb5f1 and the base's rate-3 red are one mode: the forced
stop's kernel records (the holder and its session killed, `Rebooting.`) are on
the console, and the job's or the supervisor's last userland line before it is
not: `issues/a-forced-reboots-last-userland-lines-miss-the-console.md`.

`amd-wake/`: the measurement-only AMD batch staged to answer the
`ipc.reqrep.65536` question: `ipcwake.rs` (diary counts per round trip),
`apply.py` (its wiring, never committed), `request.txt` with the decision rule
stated before the run, and the image checksums.
