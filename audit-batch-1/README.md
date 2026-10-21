# Audit batch 1 of open defect records

ToyOSOrg/ToyOS#982 at 0c8f79a8bad9d6cb52ef23ea40b4cf53d764fa79, auditing
`issues/` batch 1 (117 files) against origin/main
6f4d8dbdbca1452c0faa3eead53104d9d0d47fa4.

`classification.md` is one row per record: its class (fixed, partly stale,
still valid, uncertain), the evidence at the audited revision (file and line,
or the commit that changed it) and the action taken. Line numbers are at the
audited revision.

Counts: 1 fixed, 46 partly stale, 62 still valid, 8 uncertain. No guest or
metal run; every claim was checked by reading the code.
