# r4: what moved mem.anon.map and proc.spawn_wait.large on the AMD bench

All boots are AMD-bench `benchcase` runs, each verdict `passed` (`verdicts.txt`). Each `*.osbench.txt` holds a boot's `osbench v=2` lines and nothing else of its kernel.log.

| boot | tree | what it carries |
|---|---|---|
| A1–A4 (`../metal-amd/A-boot*.osbench.txt`) | ddc26a3ea | #1097's head |
| B1, B2 (`../metal-amd/B-run*.osbench.txt`) | 34409c9c2 | A + #1098 + #1099's first round |
| R (`R-amd`) | cc47fc97e | B with the clean limit back at 64 MiB: functionally A + #1098 |
| WA1, WA2 (`W-A-amd-run*`) | f40791833 | main, the base of #1099 and #1113, with neither |
| C1, C2 (`C-amd-run*`) | b3f9af23a | #1099's head, two separately built images |
| WB (`W-B-amd-run1`) | a122cad77 | f40791833 + #1113, without #1099 |

- `anon-spawn.txt`: `mem.anon.*` and `proc.spawn_wait.large` in all twelve boots (`rows.py`).
  - `mem.anon.map` p50 is about 200 ns/MiB in nine boots and 376–388 in B1, B2 and WA1. WA1 is the base without #1099. Both #1099 heads read 202 and 204, and R reads 200. So the 1.90x follows neither #1099 nor its limit.
  - `mem.anon.touch`, `unmap` and `total` show no such split.
- `slow-boots-comove.txt` (`comove.py B1,B2,WA1`) lists the rows whose three slow-mode boots lie outside the other nine boots' whole range. Only `mem.anon.map` does (1.89x), apart from `work.build_shaped.j1` at 0.96x. The slow mode does not follow the clock either: mem.anon.map's `mhz_settled` is 4291 in A1 (fast) and 4267 in B2 (slow).
- `proc.spawn_wait.large` p50, in µs:

  | boots | reads |
  |---|---|
  | A1–A4 | 155–186 |
  | WA1, WA2 | 178, 192 |
  | WB, without #1099 | 219 |
  | B1, B2, R, C1, C2 | 208–217 |

  R is functionally A + #1098, and C lacks #1098, so no single change separates the high boots. The program spawned lives in the memory filesystem, not on DATA.
- `landing-separated-rows.txt` (`comove.py WA1,WA2` over WA1, WA2, C1, C2) has every row where the two base boots lie outside both head boots. The ratio is base/head: ns rows below 1 and MB/s rows above 1 favour the base. `pipe.txt` puts the pipe rows (head 4–9% lower than this base) beside all twelve boots: the heads lie inside the four A boots' range of one tree, except `pipe.throughput.64` at 122 against 125–136.
- `rebase/ci-host.log`: `cargo run -- --ci host` on #1099 rebased onto 0c7e62ca7. `ci-host.rev` holds the revision and the exit code.

Paths under the agent's home and scratch are masked.
