# PR #1074, round 4: the finished stall soak

The seven-test batch was run repeatedly in three detached worktrees at once.

| Logs | Revision | Runs | `netstack_holders_exported_to_children` stalls |
|---|---|---|---|
| `head-*` | 5e0cb52b0 | 24 | 5 |
| `main-*` | 576bebf3a | 24 | 3 |
| `base-*` | 544f9cc3c | 16 | 1 |

- **The signature, every time:** the job's last line is "a listener and a datagram socket exported to a child: …". No `exit:` line follows, and the guards expired after 673 to 1021 s.
- **The record:** `issues/two-holders-racing-on-an-exported-socket-can-both-stall.md`.
- **What `r3/soak/` holds:** the same soak, taken mid-run.
