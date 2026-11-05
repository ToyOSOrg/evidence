# Round 9 judged: base6 85c7607d5 against head6 fb4ca4a2b (#1133 97ae8d604), AMD

Boots 1-base, 2-head, 3-head ran in sequence. 4-base was aborted before flashing (the dev host's
disk filled), then rerun alone with the same image (sha256 36f6a31c...) about an hour after boot 3,
with another PR's metal run in between. All four verdicts passed, every job exit 0. judge.txt is
judge9.py (written before the run) against rule.txt as written.

- D1 holds: base 8 KiB d16 1953 ns.
- D2 holds. D4 holds. D5 holds.
- C6 holds (copyat half): head at d16 256 B 20 ns (base 90, head d0 30), 1 KiB 20 (base 270),
  2 KiB 30 (base 511). Its mem.memcpy half: 256 B 0.984, 1 KiB 0.988, 4 KiB 0.99 of base. Holds.
- D6 holds by its pair clause ("a failure in one pair only is reported"); judge9.py's D6 line uses arm
  means and is stricter than the rule. Reported: pair 2 fails, 4096 1.32 and 65536 1.74, because the
  rerun base boot 4 read every ipc row faster than the other three boots, ipc.reqrep.8 included
  (6603 against 8045-8276), which no route touches. Pair 1: 0.98 and 0.99.
- D3 FAILS on mem.memcpy.262144: head 33799 against base 39405 MB/s, 0.858 (rounds 7, 8: 0.906, 0.84).
  Every other mem.memcpy row holds.
- P: G = 0.142. P1 FAILS (placement spread base 1.117, head 1.087, both under 1 + G). P2 FAILS (median
  head 36022 against base 40023, 0.900). So by the rule D3 stands as written on that row: the gap does
  not follow buffer placement.
  - Reported, not judged: the head arm's two boots differ. Boot 2's place.p1..p7 read 37.8-39.9k
    (0.97 of base's), boot 3's 32.3-34.2k (0.81). Base's two boots agree (37.2-42.1k). p0 reads
    38.1-38.6k in all four boots.
- Unjudged: 64 B d0/d16 30/40 ns and 128 B 30/60 in both arms (not routed); copyat.262144 d0 head 1.06x base.
