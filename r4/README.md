# PR #1075, round 4: TCTL out of the T14's reset (19fbf239c, 2026-10-28)

One ToyOS boot of `osbench lan` at `19fbf239c`, judged by the harness (`judge-s1.txt`, PASS). Its boot
log says `TCTL` three times: as inherited (`0x3003f0f8`), as the bring-up's reset left it (`0x3003f0f8`),
and after the bring-up (`0x3003f0fa`). A reset that re-read the NVM and reset the rest would read about
`0x30000008` out of it. So this reset does not give §10.2.6.1's initial values: either it kept the
register, `CT` and `COLD` included, or this MAC's own reset value is that one. No reading separates the
two, and the 82574's table does not describe the PCH's MAC. Upload p50 87 MB/s, as at `f9563de4f`.
