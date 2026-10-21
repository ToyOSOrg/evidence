# Audit batch 1 of open defect records

ToyOSOrg/ToyOS#982 at 89f2c94b2aec1d9b8ee5e8231ff34ff8c5664fc9, auditing
`issues/` batch 1 (117 files). First pass against origin/main
6f4d8dbdbca1452c0faa3eead53104d9d0d47fa4. After review r1 the branch was
rebased onto db0cf636d (#971, #978, #980), and every record those changes
touched was re-audited there.

`classification.md` has one row per record: its class (fixed, partly stale,
still valid, uncertain, deleted by main), the evidence (file and line at
6f4d8dbdb unless a row says db0cf636d, or the commit that changed it), and the
action taken.

Counts at db0cf636d: 2 fixed, 43 partly stale, 60 still valid, 8 uncertain,
4 deleted by main (#971). One finding was filed. No guest or metal run; every
claim was checked by reading the code.
