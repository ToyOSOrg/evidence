# AMD bench A/B (osbench benchcase boot, whole suite)

- A: four boots of #1097 at 069cbbeb8 (code-identical to ddc26a3ea), the coordinator's scoreboard: A-boot1..4.osbench.txt.
- B: two boots of disk-path-ab 34409c9c2 = ddc26a3ea + #1098 + #1099: B-run1/2.osbench.txt, each verdict `passed` (B-run*.verdict.txt).
- ab.md: each row's p50 per boot and the ratio of B's median to A's, made by ab.py from the files here (`python3 -I ab.py <A files,> <B files,>`).
- Only the `osbench v=2 os=toyos` result lines are kept from each boot's kernel log.
