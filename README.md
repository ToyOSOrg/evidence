# bench-nic-trials

One line per T14 ToyOS boot since 2026-10-28 12:00 UTC, recording whether Ubuntu's e1000e probe found the wired NIC after that boot (ok / MISSING / unreachable). The first rows carry the run label and result; from 2026-10-28T13:20Z each row is UTC date, label@revision, result. The orchestrator's runner records every boot locally and publishes the rows here periodically. Evidence for issues/linux-loses-the-t14s-i219-after-a-toyos-warm-reset.md.
