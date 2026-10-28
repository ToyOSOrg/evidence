# #1110 stage 1 A/B (metal)

base = #1103 benchcase at b3dbfbfb0; head = #1110 benchcase at 1293be570, whose stage-1 diff is identical to the PR head cd91fb835's.
Order per bench: base1, head1, base2, head2, then one testcases boot at 1293be570 carrying served_file_offset.
Every boot's verdict is `passed`. `p50.txt` is the p50 of every fs.disk/fs.mem row per boot (columns base1 head1 base2 head2).
Each `osbench-fs-lines.txt` is the boot's osbench lines for those rows with the log's timestamp prefix removed.
