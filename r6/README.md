# PR #1075, round 6: the bring-up writing every TCTL field (245fe1dee, 2026-10-28)

One ToyOS boot of `osbench lan` at `245fe1dee`, judged by the harness (`judge-s2.txt`, PASS). Its boot log
says `TCTL` inherited (`0x3003f0f8`), out of the reset (`0x3003f0f8`) and after the bring-up
(`0x3003f0fa`), which is now the value the driver writes whatever it met. Upload p50 85 MB/s.
