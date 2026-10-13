PR #895, design round 3. Arithmetic only; nothing booted.
scale-rule-r3.awk over scale-rule-r3.rows and scale-rule-r3-ms.rows -> scale-rule-r3.log (awk exit 0 twice).
The rule has one viewing distance, 24 in, for every panel, so the scale depends on density alone.
The rows are round 2's plus round 2's review counterexample (19.5 in and 20 in 1920x1080 panels).
The Microsoft rows are a labelled comparison, not an oracle (source and hash in ../r2/README.txt).
r2/scale-rule-r2-ms.rows is round 2's comparison input, whose output round 2's log already carried.
sources.txt no longer lists Mutter or winit's Linux backend: round 1 read them, and no round uses them.
